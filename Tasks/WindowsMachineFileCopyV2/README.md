# Windows Machine File Copy Task
### Overview
The task is used to copy application files and other artifacts that are required to install the application on Windows Machines like PowerShell scripts, PowerShell-DSC modules etc. The task provides the ability to copy files to Windows Machines. The tasks uses RoboCopy, the command-line utility built for fast copying of data.

### The different parameters of the task are explained below:

*	**Source**: The source of the files. As described above using pre-defined system variables like $(Build.Repository.LocalPath) make it easy to specify the location of the build on the Build Automation Agent machine. The variables resolve to the working folder on the agent machine, when the task is run on it. Wild cards like **\*.zip are not supported.
* **Machines**: Specify comma separated list of machine FQDNs/ip addresses along with port(optional). For example dbserver.fabrikam.com, dbserver_int.fabrikam.com:5986,192.168.34:5986.  
* **Admin Login**: Domain/Local administrator of the target host. Format: &lt;Domain or hostname&gt;\ &lt; Admin User&gt;.  
* **Password**:  Password for the admin login. It can accept variable defined in Build/Release definitions as '$(passwordVariable)'. You may mark variable type as 'secret' to secure it.  
*	**Destination Folder**: The folder in the Windows machines where the files will be copied to. An example of the destination folder is c:\FabrikamFibre\Web.
*	**Clean Target**: Checking this option will clean the destination folder prior to copying the files to it.
*	**Copy Files in Parallel**: Checking this option will copy files to all the target machines in parallel, which can speed up the copying process.
