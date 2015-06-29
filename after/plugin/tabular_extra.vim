  " after/plugin/tabular_extra.vim
  " Provides extra :Tabularize commands

  if !exists(':Tabularize')
    finish " Give up here; the Tabular plugin musn't have been loaded
  endif

  :AddTabularPattern 1comma /^[^,]*\zs,/
  :AddTabularPattern 1eq    /^[^=]*\zs=/
  :AddTabularPattern 1hash  /^[^=>]*\zs=>/
  :AddTabularPattern 1pipe  /^[^\|]*\zs|/
