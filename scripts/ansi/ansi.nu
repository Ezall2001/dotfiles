export def style [str:string style:string] { $'(ansi $style)($str)(ansi rst)' }
