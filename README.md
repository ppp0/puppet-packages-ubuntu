puppet-packages [![Build Status](http://ci.cargomedia.ch:8080/buildStatus/icon?job=cargomedia-puppet-packages-ubuntu)](http://ci.cargomedia.ch:8080/job/cargomedia-puppet-packages-ubuntu/)
===============
Reusable puppet modules for Ubuntu (Vivid Vervet 15.04 only so far).

Install puppet
--------------
```sh
curl -Ls https://raw.github.com/cargomedia/puppet-packages/master/scripts/puppet-install.sh | bash
```

Module development
------------------
It's recommended to write specs for newly developed modules and test them by running appropriate rake task.

All specs should be placed in `modules/<module-name>/spec/<spec-name>/spec.rb`. This way they can be detected and form rake tasks.
Spec helper will also automatically apply all puppet manifests from the same dir (`*.pp`).

To test specific module run `rake test:<module-name>`. To learn about other available tasks please run `rake --tasks`.
Our test tasks recognize following rake options:
- `verbose=true` verbose output
- `debug=true` running puppet apply with `--debug` flag
- `keep_box=true` do not roll back the vm to a clean state
