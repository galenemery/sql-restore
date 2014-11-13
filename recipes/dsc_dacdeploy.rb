#Use xDatabase to import the dacpac
dsc_resource 'DeployDac' do
	resource_name :xDatabase
	property :ensure, 'Present'
	property :SqlServer, 'SQLRESTORE'
	property :SqlServerVersion, '2012'
	property :DatabaseName, 'AW2012-dactest'
	property :Credentials, ''
	property :DacPacPath, ''
	property :DacPacApplicationName, ''
end
