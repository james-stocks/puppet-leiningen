class leiningen::bootstrap_fetch inherits leiningen {
  include wget

  wget::fetch { "Fetch lein bootstrap":
    source      => $fetch_url,
    destination => "${bin_dir}/lein",
    timeout     => $fetch_timeout,
    verbose     => false,
    unless      => "test -f ${bin_dir}/lein"
  }
}
