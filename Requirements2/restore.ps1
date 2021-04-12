#Earl Chough 001171966
try
{
    New-ADOrganizationalUnit -Name "finance" -Path "dc=ucertify,dc=com"
    $OUusers = "OU=finance,DC=ucertify,DC=com"
    $Users = Import-csv "$PSScriptRoot\financePersonnel.csv"
    $SQLdata = "$PSScriptRoot\NewClientData.csv"
    foreach ($User in $Users)
    {
        $Firstname = $User.First_Name
        $Lastname = $User.Last_Name
        $Postalcode = $User.PostalCode
        $Officephone = $User.OfficePhone
        $Mobilephone = $User.MobilePhone
        
        New-ADUser -Name "$Firstname $Lastname" -Givenname $Firstname -Surname $Lastname -DisplayName "$Firstname $Lastname" -Path $OUusers -PostalCode $Postalcode -OfficePhone $Officephone  -MobilePhone $Mobilephone
        
    }
}
catch [System.OutOfMemoryException]
{
    Write-Output "Out of Memory Exception. Returning to terminal"
    returnn
}

try 
{
    
    Import -Module sqlps -DisableNameChecking -Force
    $serverobj = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Server -ArgumentList .\UCERTIFY3
    $db = New-Object -TypeName Microsoft.SqlServer.Management.Smo.Database -argumentlist $serverobj, "ClientDB"  
    $db.Create() 

    Invoke-Sqlcmd -ServerInstance .\UCERTIFY3 -Database ClientDB -InputFile $PSScriptRoot\Client_A_Contacts.sql 

    $table  = 'dbo.Client_A_Contacts'
    $db = 'ClientDB'

    Import-Csv  $PSScriptRoot\NewClientData.csv | ForEach-Object {Invoke-Sqlcmd `
    -Database $db -ServerInstance .\UCERTIFY3 -Query "insert into $table (first_name,last_name,city,county, zip,officePhone,mobilePhone) VALUES `
    ('$($_.first_name)','$($_.last_name)','$($_.city)','$($_.county)','$($_.zip)','$($_.officePhone)','$($_.mobilePhone)')"
    }
    #,(Import-Csv -Path $SQLdata) | Write-SqlTableData -ServerInstance .\UCERTIFY3 -DatabaseName "ClientDB" -SchemaName "dbo" -TableName "Client_A_Contacts" -Force    
}

catch [System.OutOfMemoryException]
{
    Write-Output "Out of Memory Exception. Returning to terminal"
    return
}
      