# Class: leiningen
# ===========================
#
# Full description of class leiningen here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'leiningen':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# James Stocks <james.stocks@puppet.com>
#
# Copyright
# ---------
#
# Copyright 2016 James Stocks
#
class leiningen (
  $fetch_url     = $leiningen::params::fetch_url,
  $fetch_timeout = $leiningen::params::fetch_timeout,
  $bin_dir       = $leiningen::params::bin_dir,
) inherits leiningen::params {
  include wget

  wget::fetch { "Fetch lein bootstrap":
    source      => $fetch_url,
    destination => "${bin_dir}/lein",
    timeout     => $fetch_timeout,
    verbose     => false,
    unless      => "test -f ${bin_dir}/lein"
  }
}
