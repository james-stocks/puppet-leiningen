class leiningen::bootstrap_fetch inherits leiningen {
  include wget

  wget::fetch { 'Fetch lein bootstrap':
    source      => $fetch_url,
    destination => "${bin_dir}/lein",
    timeout     => $fetch_timeout,
    verbose     => false,
    unless      => "test -f ${bin_dir}/lein",
    notify      => File['lein bootstrap file'],
  }

  File { 'lein bootstrap file':
    path        => "${bin_dir}/lein",
    mode        => 'a+x',
  }
}
