" Vim syntax file
" Language: MUD Zones
" Maintainer: Eric Oestrich
" Latest Revision: 7 May 2020

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword zoneSection skipwhite
      \ characters
      \ features
      \ items
      \ rooms room_exits room_characters
      \ zones

syn region  zoneCommentMulti start=/\/\*/ end=/\*\//
syn match   zoneCommentSingle "#.*$"
syn match   zoneAssignment "\<[a-z][a-z0-9_-]*\>" skipwhite nextgroup=zoneAssignmentOp
syn match   zoneAssignmentOp "=" nextgroup=@zoneValue skipwhite
syn keyword zoneValueBool true false
syn match   zoneValueDec "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn region  zoneValueString start=/"/    end=/"/  skip=/\v\\./   contains=zoneStringInterp
syn region  zoneStringInterp matchgroup=zoneBrackets start=/\${/  end=/}/ contained
syn match   zoneBraces "[\[\]{}]"

syn cluster zoneConfigItem contains=zoneAssignment
syn cluster zoneValue      contains=zoneValueBool,zoneValueDec,zoneValueString

syn region  zoneBlockBraces matchgroup=zoneBraces start="[{\[]" end="[}\]]" fold transparent

highlight link zoneCommentMulti      Comment
highlight link zoneCommentSingle     Comment
highlight link zoneAssignment        Identifier
highlight link zoneAssignmentOp      Operator
highlight link zoneBrackets          Delimiter
highlight link zoneBraces            Delimiter
highlight link zoneSection           Structure
highlight link zoneStringInterp      Identifier
highlight link zoneValueBool         Boolean
highlight link zoneValueDec          Number
highlight link zoneValueString       String

let b:current_syntax = 'zone'
