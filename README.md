# Power BI Administration and Premium Capacity Management
Recommended practices for Power BI service Administration and Power BI Premium Capacity Management.

# Power BI Licenses
Determine the users within your organization currently assigned Power_BI_Pro or Power_BI_Standard licenses. 

<b>Recommended Practice:</b> Create a Mail Enabled Security Group to facilitate your Pro Users for license assignment, organizational notifications and sharing approved organizational assets within Power BI (dataflows, datasets, etc.)

How to: [Assign a Group License](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/licensing-groups-assign)

## PowerShell
Example cmdlet [Power_BI_User_Licenses](../master/Power_BI_User_Licenses.ps1)
<br />

## Microsoft 365 admin center
Navigate to [Active users](https://admin.microsoft.com/Adminportal/Home?source=applauncher#/users), select Filter and the + New filter option. For the Assigned product license select Power BI Pro and if necessary a second filter for Power BI (free) users can also be created. The Export Users functionality will provide a list of users in a csv file format.
<br />

# Power BI Audit Logs
Determine the current activites within your organization. Currently allows 90 days worth of history. 

<b>Recommended Practice:</b> Run as a nightly batch activity to collect the previous days activities.

## PowerShell
Example cmdlet [Power_BI_Audit_Logs](../master/Power_BI_Audit_Logs.ps1)
<br />

# OneDrive for Business and SharePoint Online
###### File Synchronization and Version History
When you store a Power BI Desktop file on OneDrive or SharePoint Online, any data you’ve loaded into your file’s model is imported into the dataset, and any reports you’ve created in the file are loaded into Reports in the Power BI serviced. When you make changes to your file on OneDrive or SharePoint Online, such as adding new measures, changing column names, or editing visualizations, once you save the file those changes will be updated in the Power BI service too, usually within about an hour.

> **Instructions**
```
1. Upload Locally Created Power BI Files (PBIX) to OneDrive for Business
2. Within the Power BI Service
    • ↗ Get Data
    • File
    • OneDrive – Business
    • Select the Power BI (PBIX) file
```
Reference: https://docs.microsoft.com/en-us/power-bi/refresh-desktop-file-onedrive

With online version history, you can see and restore older versions of all your files in your OneDrive. Version history works with all file types, including PDFs, CAD files, photos, and videos. If you need to, you might be able to restore deleted OneDrive files or restore deleted SharePoint items from the recycle bin.

Reference: https://support.office.com/en-us/article/restore-a-previous-version-of-a-file-in-onedrive-159cad6d-d76e-4981-88ef-de6e96c93893
 
## Capacity Management


###### Incremental Refresh



###### Vertipaq Analyzer
VertiPaq Analyzer is useful to analyze VertiPaq storage structures for a data model in Analysis Services Tabular. 
A complete description and short tutorial is available in the article Data Model Size with VertiPaq Analyzer.

Instructions:
> Power BI Desktop (Microsoft Store):
1.	Open the Power BI (pbix) file
2.	Open Task Manager, navigate to the Details tab and find the below name and PID:
```
      msmdsrv.exe
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

> Power BI Desktop (Download Center)
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
