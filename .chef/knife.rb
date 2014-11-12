# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "galenemery"
client_key               "#{current_dir}/galenemery.pem"
validation_client_name   "galenemery-validator"
validation_key           "#{current_dir}/galenemery-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/galenemery"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:rackspace_api_username] = "galene"
knife[:rackspace_api_key] = "beeecc05511d4b69b8305419d4beee62"
knife[:rackspace_region] = "ORD"
knife[:vsphere_host] = "172.31.8.66"
knife[:vsphere_user] = "galen@vsphere.local"
knife[:vsphere_pass] = "g@l3n"
knife[:vsphere_dc] = "vmwarelab"
knife[:vsphere_insecure] = true
knife[:azure_publish_settings_file] = "#{current_dir}/galen@galenemery-credentials.publishsettings"