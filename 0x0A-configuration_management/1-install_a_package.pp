# Puppet manifest to install Flask using pip3

# Ensuring the package is present
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# End of Puppet manifest
