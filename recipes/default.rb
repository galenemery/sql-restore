#
# Cookbook Name:: sql_restore
# Recipe:: default
#
# Copyright (C) YEAR YOUR_NAME <YOUR_EMAIL>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "powershell::powershell4"


# Extracting the Microsoft DSC Resource Kit into Powershell Modules
remote_file "#{Chef::Config[:file_cache_path]}\\DSCKit_Wave8.zip" do
  source 'https://gallery.technet.microsoft.com/scriptcenter/DSC-Resource-Kit-All-c449312d/file/129525/1/DSC%20Resource%20Kit%20Wave%208%2011102014.zip'
end

windows_zipfile "#{ENV['PROGRAMW6432']}\\WindowsPowerShell\\Modules" do
  source "#{Chef::Config[:file_cache_path]}\\DSCKit_Wave8.zip"
  action :unzip
  not_if { ::File.exists?("#{ENV['PROGRAMW6432']}\\WindowsPowerShell\\Modules\\All Resources\\xPSDesiredStateConfiguration\\xPSDesiredStateConfiguration.psd1") }
end

