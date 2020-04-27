" Vim syntax file
" Language: MUD Zones
" Maintainer: Eric Oestrich
" Latest Revision: 2 October 2019

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword zoneSection nextgroup=zoneSectionTypeStr skipwhite
\ zones
\ rooms room_exits room_characters
\ characters
\ items
syn region zoneSectionTypeStr start=/"/ end=/"/ nextgroup=zoneSectionBlock skipwhite
syn region zoneSectionBlock start=/{/ end=/}/ fold contains=@zoneConfigItem

syn match  zoneCommentSingle "#.*$"
syn match  zoneAssignment    "\<[a-z][a-z0-9_-]*\>" contained skipwhite
                              \ nextgroup=zoneAssignmentOp
syn match   zoneAssignmentOp  "=" nextgroup=@zoneValue skipwhite
syn match   zoneValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match   zoneValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"
syn region  zoneCommentMulti start=/\/\*/ end=/\*\//
syn region  zoneValueString  start=/"/    end=/"/  skip=/\v\\./   contains=zoneStringInterp
syn region  zoneStringInterp matchgroup=zoneBrackets start=/\${/  end=/}/ contained
syn keyword zoneValueBool true false
syn match zoneBraces        "[\[\]{}]"


syn cluster zoneConfigItem contains=zoneAssignment
syn cluster zoneBlock      contains=zoneResourceBlock
syn cluster zoneValue      contains=zoneValueBool,zoneValueDec,
                                    \zoneValueHexaDec,zoneValueString

highlight link zoneCommentMulti      Comment
highlight link zoneCommentSingle     Comment
highlight link zoneAssignment        Identifier
highlight link zoneAssignmentOp      Operator
highlight link zoneBrackets          Delimiter
highlight link zoneBraces            Delimiter
highlight link zoneSection           Structure
highlight link zoneSectionTypeStr    String
highlight link zoneSectionBlock      Delimiter
highlight link zoneStringInterp      Identifier
highlight link zoneValueBool         Boolean
highlight link zoneValueDec          Number
highlight link zoneValueHexaDec      Number
highlight link zoneValueString       String

let b:current_syntax = 'zone'
