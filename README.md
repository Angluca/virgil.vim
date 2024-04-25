#### Vim plugin for virgil language

You can install [vimcomplete](https://github.com/girishji/vimcomplete) and setting [virgil.tags]()  
[virgil.dict]() for autocomple If you use vim  
quickly building use ```:make```
```vim
au FileType virgil let $VIRGIL= path.../virgil/std'
au FileType virgil setl tags+= path.../virgil.tags
au FileType virgil setl dict= path.../virgil.dict
```
