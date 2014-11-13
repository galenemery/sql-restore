$assemblylist = "Microsoft.SqlServer.Dac.dll",
                "Microsoft.SqlServer.Smo.dll"
$sqlpsreg110="HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.SqlServer.Management.PowerShell.sqlps110"
$sqlpsreg100="HKLM:\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.SqlServer.Management.PowerShell.sqlps"


$user = 'galenemery'
$password = ConvertTo-SecureString -String "d8adreXE" -AsPlainText -Force
$credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, $password

configuration DacDeploy
{
    param
    (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$Ensure,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$DatabaseName,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$SqlServer,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$SqlServerVersion,

        [String]$DacPacPath,

        [String]$BacPacPath,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [String]$NodeName,

        [PSCredential]
        $Credentials,

        [string]$DacPacApplicationName

    )
     
    
    Node 'localhost'
    { 
       xDatabase DeployDac
        {
            Ensure = $Ensure
            SqlServer = $SqlServer
            SqlServerVersion = $SqlServerVersion
            DatabaseName = $DatabaseName
            Credentials = $Credentials
            BacPacPath =  $BacPacPath
        } 
    } 
}

$ConfigurationData = @{
    AllNodes = @(
        @{
            NodeName="*"
            PSDscAllowPlainTextPassword=$true
        }
        @{
            NodeName="localhost"
        }
    )
}

DacDeploy -ConfigurationData $ConfigurationData -Ensure "Present" -DatabaseName "AW2012-TEST" -SqlServer "SQLRESTORE" -SqlServerVersion "2012" -NodeName "localhost" -Credentials $credentials -BacPacPath C:\AW2012_DB\AdventureWorks2012.dacpac
Start-DscConfiguration  -ComputerName "localhost" -Path .\DacDeploy -Wait -Force -Verbose