#
# Cookbook:: wordpress
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


package 'httpd';
rpm_package 'epel-release' do
	action :install
	source "https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm"
end

package 'yum-utils';

rpm_package 'remi-release-7' do 
	action :install
	source "http://rpms.remirepo.net/enterprise/remi-release-7.rpm"
end 

bash 'enable-php72-repo' do
	cwd ::File.dirname("/tmp")
    code <<-EOH
    	sudo yum-config-manager --enable remi-php72;
    EOH
end

package 'mariadb';
package 'php';
package 'php-common';
package 'php-opcache';
package 'php-mcrypt';
package 'php-cli';
package 'php-gd';
package 'php-curl';
package 'php-mysql';

service 'httpd' do
	action :start
end