# musical-install

musical-install is shell library of helper functions for create install files with use musical emoji

## List of functions

- mi_start (print start emoji)
- mi_step (print step emoji)
- mi_complete (print complete emoji)
- mi_confirm (confirm actions by answer yes or no)
- mi_install (create symbol links from to)

## Example of use

```shell
#!/bin/bash

eval "$(curl -sL https://raw.githubusercontent.com/madurmanov/musical-install/master/musical-install.sh)"

mi_start
if mi_confirm "Do you want install emacs" ; then
  mi_install .emacs.d $HOME
fi
mi_complete
```

## License

**musical-install** is released under the MIT License. See the bundled `LICENSE.md` for details.
