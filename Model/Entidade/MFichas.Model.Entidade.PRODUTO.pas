unit MFichas.Model.Entidade.PRODUTO;

interface

uses
  DB, 
  Classes, 
  SysUtils, 
  Generics.Collections, 

  /// orm 
  ormbr.types.blob, 
  ormbr.types.lazy, 
  ormbr.types.mapping, 
  ormbr.types.nullable, 
  ormbr.mapping.classes, 
  ormbr.mapping.register, 
  ormbr.mapping.attributes; 

type
  [Entity]
  [Table('PRODUTO', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TPRODUTO = class
  private
    { Private declarations } 
    FGUUID: String;
    FGRUPO: String;
    FCODIGO: String;
    FDESCRICAO: String;
    FPRECO: Double;
    FSTATUS: Integer;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetDATACADASTRO: TDateTime;
    function GetGUUID: String;
  public 
    { Public declarations } 
    [Column('GUUID', ftString, 38)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('GRUPO', ftString, 38)]
    [Dictionary('GRUPO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GRUPO: String read FGRUPO write FGRUPO;

    [Column('CODIGO', ftString, 20)]
    [Dictionary('CODIGO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CODIGO: String read FCODIGO write FCODIGO;

    [Column('DESCRICAO', ftString, 128)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;

    [Column('PRECO', ftBCD, 18, 4)]
    [Dictionary('PRECO', 'Mensagem de validação', '0', '', '', taRightJustify)]
    property PRECO: Double read FPRECO write FPRECO;

    [Column('STATUS', ftInteger)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: Integer read FSTATUS write FSTATUS;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('DATACADASTRO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;
  end;

implementation

{ TPRODUTO }

function TPRODUTO.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result         := FDATAALTERACAO;
end;

function TPRODUTO.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TPRODUTO.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TPRODUTO)

end.
