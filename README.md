# dotfiles

Managed with [GNU Stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html)

# Things to memorize:
    
[vim-surround](https://github.com/tpope/vim-surround):
-----------------------

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

Wrap lines in vim:
------------------
    gqq
