#### Vim plugin for virgil language
```vim
Plug 'angluca/virgil.vim'
# gen vim tags
bin/utils/vctags lib/**/*.v3
```
You can install [vimcomplete](https://github.com/girishji/vimcomplete) and setting   
[virgil.dict](https://github.com/Angluca/AcVim/blob/master/vimfiles/dict/virgil.dict) [virgil.base.dict](https://github.com/Angluca/AcVim/blob/master/vimfiles/dict/virgil.base.dict) for autocomple If you use vim  
quickly building use ```:make```

```vim
au FileType virgil let $VIRGIL= .../virgil'
au FileType virgil setl tags+= .../virgil.tags
au FileType virgil setl dict= .../virgil.dict, .../virgil.base.dict
```
