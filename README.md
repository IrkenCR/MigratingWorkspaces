# MigratingWorkspaces
This repository will have scripts dedicated to migrate Power BI Workspaces.


# MigratingWorkspacesToNewCapacity
This is an script that will take a .csv input with all the workspaces you want to migrate to a specific capacity.
You can generate this file by two ways:

## 1. Exporting the workspaces from the Power BI Admin Portal
To do this go to the Power BI Admin Portal and access the workspaces option:

https://app.powerbi.com/admin-portal/workspaces

![image](https://user-images.githubusercontent.com/5109724/155641220-f5003364-1457-4a09-9dac-5c6d256131be.png)

## 2. Manually creating a CSV file
Manually creating a CSV file and entering one column "ID", and another for "Name" (Name it's not necessary, but you will need to remove the script part that call the "Name"
