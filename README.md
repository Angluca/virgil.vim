#### Vim plugin for virgil language
https://github.com/titzer/virgil
```vim
Plug 'angluca/virgil.vim'
# gen vim tags
bin/utils/vctags lib/**/*.v3
```
[virgil.base.dict](https://github.com/Angluca/AcVim/blob/master/vimfiles/dict/virgil.base.dict) for autocomple If you use vim  
quickly building use ```:make```

```vim
au FileType virgil let $VIRGIL= .../virgil'
au FileType virgil setl tags+= .../virgil.tags
au FileType virgil setl dict= .../virgil.base.dict
```
