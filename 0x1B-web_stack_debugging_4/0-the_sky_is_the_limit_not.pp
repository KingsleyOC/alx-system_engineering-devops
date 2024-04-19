# Increases the amount of traffic an Nginx server can handle.

# Increase the ULIMIT of the default file
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
  notify  => Exec['nginx-restart'],  # Add notification to restart nginx after changing the ulimit
} ->

# Restart Nginx
exec { 'nginx-restart':
  command     => '/etc/init.d/nginx restart',  # Correct the command to restart nginx
  refreshonly => true,  # Make sure this exec only runs when triggered by notification
  subscribe   => File['/etc/default/nginx'],  # Add subscription to the file change
}
