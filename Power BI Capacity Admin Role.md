# Power BI Capacity Admin Role
Introducing and communicating organizational standards early and often will be key to managing time to market for report developers. Its recommended to create a Power BI specific [mail enabled security group](https://www.youtube.com/watch?v=o3nyxuPzn3E) for all users with a Pro license to ensure mass communications and as a standard in which to share organizational assets globally.</br></br>

## Role Responsibilites
</br>

### Introductory Consultations</br>
Engagements will largely concentrate on determining the objectives of the developer and the appropriate development path.</br>
##### Related Tasks
   * Determining which reusable entities from [dataflows](https://docs.microsoft.com/en-us/power-bi/service-dataflows-overview) can be leveraged when building new datasets.
   * Determining if redundancy of a dataset exists. Work with owning business unit for build permissions as a [shared dataset](https://docs.microsoft.com/en-us/power-bi/service-datasets-build-permissions).
   * Determinin if data extraction requirement exists that [paginated reports](https://www.microsoftevents.com/profile/form/index.cfm?PKformID=0x88303270001&ch=x4) are positioned.
</br></br>

### (Optional) Managing a Test Capacity environment</br>
For organizations that support multiple SKU's a dedicated P1 environment for development can allow Pro Users to develop advanced functionalities without impacting production environments. During this development stage content distribution should be limited to User Acceptance Testing scenarios only and not include mass distribution.</br>

##### Related Tasks:
   * [Assigning Workspaces to Capacity](https://docs.microsoft.com/en-us/power-bi/service-admin-premium-manage#assign-a-workspace-to-a-capacity)
   * [Auditing dataset]() prior to promoting content to a production capacity.

##### Advanced Features:
   * [Incremental refresh](https://docs.microsoft.com/en-us/power-bi/service-premium-incremental-refresh)
   * [Paginated reports](https://www.microsoftevents.com/profile/form/index.cfm?PKformID=0x88303270001&ch=x4)
   * [AI insights](https://docs.microsoft.com/en-us/power-bi/desktop-ai-insights)
   * [Automated machine learning](https://docs.microsoft.com/en-us/power-bi/service-machine-learning-automated)
</br>

### Promote Workspaces to a Production Capacity environment</br></br>

##### Related Tasks:
   * [Assigning Workspaces to Capacity](https://docs.microsoft.com/en-us/power-bi/service-admin-premium-manage#assign-a-workspace-to-a-capacity)
   * [Auditing dataset]() prior to promoting content to a production capacity.
</br>

### Other Responsibilites May Include
   * Managing and updating an organizational [data catalog](https://docs.microsoft.com/en-us/azure/data-catalog/overview) to increase visibility of existing Power BI assets.
   * Reclaiming unused/infrequently used Power BI Pro licenses by leveraging audit logs.
      * Requires an O365 Admin role to access user licensing.
      * O365 Admin roles can directly access Security & Compliance [Audit logs](https://docs.microsoft.com/en-us/power-bi/service-admin-auditing#access-your-audit-logs) for Power BI activities. Power BI service admin roles can currenttly only access Power BI audit log activities via PowerShell cmdlets or REST API.
