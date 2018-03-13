

  
  if &background == 'dark'
    
  let s:shade0 = "#3D4752"
  let s:shade1 = "#505C6A"
  let s:shade2 = "#77818D"
  let s:shade3 = "#A5A5A5"
  let s:shade4 = "#AFB1B3"
  let s:shade5 = "#CDCED1"
  let s:shade6 = "#E6E6E6"
  let s:shade7 = "#FFFFFF"
  let s:accent0 = "#FF8E7D"
  let s:accent1 = "#FFC36D"
  let s:accent2 = "#FFDF67"
  let s:accent3 = "#A3D971"
  let s:accent4 = "#55BBA7"
  let s:accent5 = "#80BBE7"
  let s:accent6 = "#B490B6"
  let s:accent7 = "#F6B4C8"
  
  endif
  

  
  if &background == 'light'
    
  let s:shade0 = "#FFFFFF"
  let s:shade1 = "#E6E6E6"
  let s:shade2 = "#CDCED1"
  let s:shade3 = "#AFB1B3"
  let s:shade4 = "#A5A5A5"
  let s:shade5 = "#77818D"
  let s:shade6 = "#505C6A"
  let s:shade7 = "#3D4752"
  let s:accent0 = "#CB2735"
  let s:accent1 = "#F28C00"
  let s:accent2 = "#FEC31D"
  let s:accent3 = "#79B63F"
  let s:accent4 = "#05977D"
  let s:accent5 = "#007DBC"
  let s:accent6 = "#843F88"
  let s:accent7 = "#E05C84"
  
  endif
  

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:shade1, s:accent5 ], [ s:shade7, s:shade2 ] ]
  let s:p.normal.right = [ [ s:shade1, s:shade4 ], [ s:shade5, s:shade2 ] ]
  let s:p.inactive.right = [ [ s:shade1, s:shade3 ], [ s:shade3, s:shade1 ] ]
  let s:p.inactive.left =  [ [ s:shade4, s:shade1 ], [ s:shade3, s:shade0 ] ]
  let s:p.insert.left = [ [ s:shade1, s:accent3 ], [ s:shade7, s:shade2 ] ]
  let s:p.replace.left = [ [ s:shade1, s:accent1 ], [ s:shade7, s:shade2 ] ]
  let s:p.visual.left = [ [ s:shade1, s:accent6 ], [ s:shade7, s:shade2 ] ]
  let s:p.normal.middle = [ [ s:shade5, s:shade1 ] ]
  let s:p.inactive.middle = [ [ s:shade4, s:shade1 ] ]
  let s:p.tabline.left = [ [ s:shade6, s:shade2 ] ]
  let s:p.tabline.tabsel = [ [ s:shade6, s:shade0 ] ]
  let s:p.tabline.middle = [ [ s:shade2, s:shade4 ] ]
  let s:p.tabline.right = copy(s:p.normal.right)
  let s:p.normal.error = [ [ s:accent0, s:shade0 ] ]
  let s:p.normal.warning = [ [ s:accent2, s:shade1 ] ]

  let g:lightline#colorscheme#ThemerVimLightline#palette = lightline#colorscheme#fill(s:p)

  