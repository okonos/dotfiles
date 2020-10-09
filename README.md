# dotfiles

Managed with [GNU Stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).

Running ansible:

```shell
ansible-playbook --ask-become-pass local.yml [-v]
```

Alternatively [ansible-pull](https://docs.ansible.com/ansible/latest/cli/ansible-pull.html) can be used.

# Things to memorize:

### cdo command
(for search and replace across many files)

    1. :grep <search term> (:Ack)
    2. :cdo %s/<search term>/<replace term>/gc
    3. (If you want to save the changes in all files) :cdo update

cdo executes the given command to each term in the quickfix list, which your grep command populates.
https://stackoverflow.com/a/38004355

### [vim-surround](https://github.com/tpope/vim-surround):

__(To surround without whitespace use closing brackets)__

Surround word:

    ysiw"

Surround line:

    yssb
    yss(

Remove delimeters:

    ds"

Change " to ':

    cs"'

Surround selected:

    Sb
    S(
    S"

### Wrap lines in vim:
    gqq
