module SimpleFFI.Spec

mutual
  public export
  data DartType
    = IntType
    | StringType
    | DoubleType
    | VoidType
    | NamedType String
    | FunctionType (List DartType) DartType

  public export
  data Field
    = Var String DartType
    | Final String DartType

  public export
  data Parameter
    = P String DartType

  public export
  data Function
    = Fun String (List Parameter) DartType

  public export
  data Member
    = FieldMember Field
    | Method Function
    | Constructor String (List Parameter)

  public export
  record Class where
    constructor MkClass
    name : String
    members : List Member

public export
data Declaration
  = ClassDecl Class
  | EnumDecl String (List String)

public export
record Lib where
  constructor MkLib
  name : String
  package : String

public export
record LibDef where
  constructor MkLibDef
  lib : Lib
  declarations : List Declaration

public export
record Module where
  constructor MkModule
  name : String
  libs : List LibDef

export
FromString DartType where
  fromString = NamedType

export
double : DartType
double = DoubleType

export
void : DartType
void = VoidType

export
var : DartType -> String -> Member
var ty n = FieldMember $ Var n ty

export
final : DartType -> String -> Member
final ty n = FieldMember $ Final n ty

export
p : DartType -> String -> Parameter
p ty n = P n ty

export
defConstructor : String -> List Parameter -> Member
defConstructor = Constructor

export
defIO : String -> List Parameter -> DartType -> Member
defIO n ps ret = Method $ Fun n ps ret

export
defClass : String -> List Member -> Declaration
defClass n ms =
  ClassDecl (MkClass n ms)

export
defEnum : String -> List String -> Declaration
defEnum = EnumDecl

export
defLib : Lib -> List Declaration -> LibDef
defLib = MkLibDef

export
defModule : String -> List LibDef -> Module
defModule = MkModule