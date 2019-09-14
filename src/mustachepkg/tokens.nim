import strformat

type
  Delimiter* = ref object
    open*: string
    close*: string

  Token* = ref object of RootObj
    pos*: int
    size*: int

  Text* = ref object of Token
    doc*: string

  EscapedTag* = ref object of Token
    name*: string
    tag*: string

  UnescapedTag* = ref object of Token
    name*: string
    tag*: string

  SectionOpen* = ref object of Token
    name*: string
    tag*: string
    inverted*: bool
    delimiter*: Delimiter

  SectionClose* = ref object of Token

  Partial* = ref object of Token

  SetDelimiter* = ref object of Token
    delimiter*: Delimiter

method `$`*(token: Token): string {.base.} = "<token>"

method `$`*(token: Text): string = fmt"<text ""{token.doc}"">"