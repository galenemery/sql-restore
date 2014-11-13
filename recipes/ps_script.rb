cookbook_file 'dacdeploy.ps1' do
	path "#{Chef::Config[:file_cache_path]}\\dacdeploy.ps1"
	action :create_if_missing
end


dsc_script 'DacDeploy' do
	command "#{Chef::Config[:file_cache_path]}\\dacdeploy.ps1"
end