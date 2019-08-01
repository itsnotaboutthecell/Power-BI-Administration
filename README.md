# Power-BI-Administration
Recommendations for Power BI Service Administration based on best practices and Microsoft's official documentation.


## OneDrive for Business

###### Collaborative Storage
The Workspace OneDrive feature allows you to configure an Office 365 Group whose SharePoint Document Library file storage is available to workspace users. You create the group outside of Power BI first. Power BI doesn't synchronize permissions of users or groups who are configured to have workspace access with the Office 365 Group membership. The best practice is give the same Office 365 group, whose file storage you configure in this setting Office 365 group, access to the workspace. Then manage workspace access by managing membership of the Office 365 group.
Reference: https://docs.microsoft.com/en-us/power-bi/service-create-the-new-workspaces#workspace-onedrive

Instructions
1.	Workspace Settings
2.	Advanced
3.	Workspace OneDrive
 

###### File Synchronization
When you store a Power BI Desktop file on OneDrive or SharePoint Online, any data you’ve loaded into your file’s model is imported into the dataset, and any reports you’ve created in the file are loaded into Reports in the Power BI serviced. When you make changes to your file on OneDrive or SharePoint Online, such as adding new measures, changing column names, or editing visualizations, once you save the file those changes will be updated in the Power BI service too, usually within about an hour.

Reference: https://docs.microsoft.com/en-us/power-bi/refresh-desktop-file-onedrive

Instructions
1.	Upload Locally Created Power BI Files (PBIX) to OneDrive for Business
2.	Within the Power BI Service

    •	↗ Get Data
    
    •	File
    
    •	OneDrive – Business
    
    •	Select the Power BI (PBIX) file



###### Version History
With online version history, you can see and restore older versions of all your files in your OneDrive. Version history works with all file types, including PDFs, CAD files, photos, and videos. If you need to, you might be able to restore deleted OneDrive files or restore deleted SharePoint items from the recycle bin.

Reference: https://support.office.com/en-us/article/restore-a-previous-version-of-a-file-in-onedrive-159cad6d-d76e-4981-88ef-de6e96c93893
 

## Dataflows

###### Linked Entities
With dataflows in Power BI, you can have a single organizational data storage source where business analysts can prep and manage their data once, and then reuse it between different analytics apps in the organization. When you link entities between dataflows, you can reuse entities that have already been ingested, cleansed and transformed by other dataflows owned by others without the need to maintain that data. The linked entities simply point to the entities in other dataflows, and do not copy or duplicate the data.

Reference:
https://docs.microsoft.com/en-us/power-bi/service-dataflows-linked-entities
https://docs.microsoft.com/en-us/power-bi/service-dataflows-overview


Limitations and considerations:
There is a maximum of five referencing hops
Cyclic dependencies of linked entities are not allowed
The dataflow must reside in a new Power BI workspace
A linked entity can't be joined with a regular entity that gets its data from an on-premises data source

Reference: https://docs.microsoft.com/en-us/power-bi/service-dataflows-azure-data-lake-integration#power-bi-protects-data-in-the-data-lake


## Capacity Management


###### Incremental Refresh



###### Vertipaq Analyzer
VertiPaq Analyzer is useful to analyze VertiPaq storage structures for a data model in Analysis Services Tabular. 
A complete description and short tutorial is available in the article Data Model Size with VertiPaq Analyzer.

Power BI Desktop Instructions (Microsoft Store):
1.	Open the Power BI (pbix) file
2.	Open Task Manager, navigate to the Details tab and find the below name and PID:
```
      msmsrv.exe
```
3.	Open Command Prompt
4.  Run the following command and replace the {PID} with the result in step 2
```
      netstat -anop TCP | find /I "{PID}"
```     
Example:
```
      nestat -anop TCP | find /I "6452"
```
5.	Locate the associating PID
6.  Within the Local Address column the current port number is listed after the colon in the IP address.
```
      ex. 0.0.0.0:50028
```

Power BI Desktop Instructions
1.	Open the Power BI (pbix) file
2.	Navigate to Start and then Run
      Shortcut: (Windows + R)
3.	Open the following location:
```
      %LocalAppData%\Microsoft\Power BI Desktop\AnalysisServicesWorkspaces
```
4.	Navigate to the folder matching AnalysisServicesWorkspaces
5.	Navigate to Data
6.	Open file msmdsrv.port.txt to obtain the localhost Port


7.	Open the Vertipaq Analyzer
8.	Open the Power Pivot for Excel window (go in Data ribbon, then click on Manage Data Model button)
9.	Click Existing Connections in the Home ribbon
10.	Select the SSAS item in the PowerPivot Data Connections
11.	Click Edit in the Existing Connections dialog box
12.	Click Build in the Edit Connection dialog box
13.	Insert the instance name of Analysis Services as Data Source (localhost:18032 in this example)
14.	Select the database name from the combo box (Enter initial catalog to use) – there should be a single unique name generated automatically by Power BI
15.	Click Test Connection (if you receive a Microsoft Data Link Error, click Yes and continue the test). The test is successful even if you receive the message “Test connection succeeded but some settings were not accepted by the provider”. Click OK to close the message after the test of the connection.
16.	Click OK to close the Data Link Properties dialog box.
17.	Click Save to close the Edit Connection dialog box.
18.	Click Refresh in the Existing Connections dialog box to refresh the data model in VertiPaq Analyzer
