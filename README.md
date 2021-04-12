These are two of the scripts I wrote for my course Scripting and Automation – C916 at Western Govenors University.

Requirements1 is about the following:
#Introduction:
In this task you will create PowerShell script. 
PowerShell enables administrators to perform administrative tasks on both local and remote systems. 
You will be expected to apply scripting standards and use exception and exit handling where appropriate. 
The completed product will prompt the user for input to complete various tasks until the user selects a prompt to exit the script.

#Scenario:
You are working as a server administrator at a consulting firm. 
Your client is a recent start-up company based out of Salt Lake City, Utah. 
Currently their environment contains only 35 employees. 
They will be doubling their staff in the coming months, and you will need to start automating some processes that are commonly run. 
In the near future, they may be hiring an intern for the system administration. 
As such, you will need to comment throughout the script to identify the script processes. 
Please follow the task requirements below to help this company.

#Requirements:
A.  Create a PowerShell script named “prompts.ps1” within the “Requirements1” folder. For the first line, create a comment and include your first and last name along with your student ID.

Note: The remainder of this task should be completed within the same script file, prompts.ps1.

B.  Create a “switch” statement that continues to prompt a user by doing each of the following activities, until a user presses key 5:

1.   Using a regular expression, list files within the Requirements1 folder, with the .log file extension and redirect the results to a new file called “DailyLog.txt” within the same directory without overwriting existing data. Each time the user selects this prompt, the current date should precede the listing. (User presses key 1.)

2.  List the files inside the “Requirements1” folder in tabular format, sorted in ascending alphabetical order. Direct the output into a new file called “C916contents.txt” found in your “Requirements1” folder. (User presses key 2.)

3. Use counters to list the current CPU % Processor Time and physical memory usage. Collect 4 samples with each sample being 5 seconds intervals. (User presses key 3.) 

4.  List all the different running processes inside your system. Sort the output by processor time in seconds greatest to least, and display it in grid format. (User presses key 4.) 

5.  Exit the script execution. (User presses key 5.)

C.  Apply scripting standards throughout your script, including the addition of comments that describe the behavior of each of parts B1–B5.

D.  Apply exception handling using try-catch for System.OutOfMemoryException.

E.  Run your script and take a screenshot of the user results when each prompt (parts B3–B4) is chosen. Save each screenshot within the “Requirements1” folder. Compress all files (original and new) within the folder to a ZIP archive.

F.  When you are ready to submit your final script, run the Get-FileHash cmdlet against the “Requirements1” ZIP archive. Note that hash value and place it into the comment section when you submit your task.

Requirements2:
#Introduction:
In this task, you will create PowerShell script. 
PowerShell enables administrators to perform administrative tasks on both local and remote systems. 
You will be expected to manage an Active Directory server and an SQL server within the PowerShell environment. 
This management will include the configuration and administration of the servers.

#Scenario:
You have been hired as a consultant at a company. 
The company previously had an SQL server and Active Directory server configured throughout two separate Windows 2012 servers. 
However, all of the drives (including backups) were destroyed due to unforeseen circumstances, and you need to write one PowerShell script named “restore.ps1” that can accomplish all of the required tasks from the local server.

Requirements

A.  Create a PowerShell script named “restore.ps1” within the “Requirements2” folder. 
For the first line, create a comment and include your first and last name along with your student ID.

Note: The remainder of this task shall be completed within the same script file, “restore.ps1.”

B.  Write a single script within the “restore.ps1” file that performs all of the following functions without user interaction:

1.  Create an Active Directory organizational unit (OU) named “finance.”

2.  Import the financePersonnel.csv file (found in the “Requirements2” directory) into your Active Directory domain and directly into the finance OU. Be sure to include the following properties:

•  First Name

•  Last Name

•  Display Name (First Name + Last Name, including a space between)

•  Postal Code

• Office Phone

• Mobile Phone

3.  Create a new database on the UCERTIFY3 SQL server instance called “ClientDB.”

4.  Create a new table and name it “Client_A_Contacts.” Add this table to your new database.

5.  Insert the data from the attached “NewClientData.csv” file (found in the “Requirements2” folder) into the table created in part B4.
 

C.  Apply exception handling using try-catch for System.OutOfMemoryException.
 

D.    Run the script within the uCertify environment. After the script executes successfully, run the following cmdlets individually from within your Requirements2 directory:
1. Get-ADUser -Filter * -SearchBase “ou=finance,dc=ucertify,dc=com” -Properties DisplayName,PostalCode,OfficePhone,MobilePhone > .\AdResults.txt
2. Invoke-Sqlcmd -Database ClientDB –ServerInstance .\UCERTIFY3 -Query ‘SELECT * FROM dbo.Client_A_Contacts’ > .\SqlResults.txt


Note: Ensure you have all of the following files intact within the “Requirements2” folder, including the original files:

•  “restore.ps1”

•  “AdResults.txt”

•  “SqlResults.txt”
 

E.  Compress the “Requirements2” folder as a ZIP archive. When you are ready to submit your final task, run the Get-FileHash cmdlet against the “Requirements2” ZIP archive. Note the hash value and place it into the comment section when you submit your task.
