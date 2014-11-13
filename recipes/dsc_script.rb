
dsc_script 'db_restore' do
  # configuration_data <<-EOH
  #   @{
  #    AllNodes = @(
  #         @{
  #         NodeName = "localhost";
  #         PSDscAllowPlainTextPassword = $true
  #         })
  #    }
  # EOH
  code <<-EOH
    $user = 'galenemery'
    $password = ConvertTo-SecureString -String "d8adreXE" -AsPlainText -Force
    $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, $password
    xDatabase DeployDac 
    	{
	        Ensure = "Present" 
	        SqlServer = "SQLRESTORE"
	        SqlServerVersion = "2012" 
	        DatabaseName = "AW2012-dactest" 
	        Credentials = $cred 
	        DacPacPath =  "C:\\AW2012_DB\\AdventureWorks2012.dacpac" 
	        DacPacApplicationName = "AW2012-dactest"
	    }
  EOH

  # configuration_data <<-EOH
  #   @{
  #     AllNodes = @(
  #         @{
  #         NodeName = "localhost";
  #         PSDscAllowPlainTextPassword = $true
  #         })
  #     }
  #   EOH
end


