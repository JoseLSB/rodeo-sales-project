unit MFichas.Model.Entidade.CONFIGURACOES;

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
  [Table('CONFIGURACOES', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave prim�ria')]
  TCONFIGURACOES = class
  private
    { Private declarations } 
    FGUUID: String;
    FIMPRESSORA: String;
    FNOMEDISPOSITIVO: String;
    FGUUIDDISPOSITIVO: TBlob;
    FDATACADASTRO: TDateTime;
    FDATAALTERACAO: TDateTime;
    FDATALIBERACAO: TDateTime;
    function GetDATAALTERACAO: TDateTime;
    function GetDATACADASTRO: TDateTime;
    function GetGUUID: String;
  public 
    { Public declarations } 
    [Column('GUUID', ftString, 38)]
    [Dictionary('GUUID', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('IMPRESSORA', ftString, 128)]
    [Dictionary('IMPRESSORA', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property IMPRESSORA: String read FIMPRESSORA write FIMPRESSORA;

    [Column('NOMEDISPOSITIVO', ftString, 128)]
    [Dictionary('NOMEDISPOSITIVO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property NOMEDISPOSITIVO: String read FNOMEDISPOSITIVO write FNOMEDISPOSITIVO;

    [Column('GUUIDDISPOSITIVO', ftBlob)]
    [Dictionary('GUUIDDISPOSITIVO', 'Mensagem de valida��o', '', '', '', taLeftJustify)]
    property GUUIDDISPOSITIVO: TBlob read FGUUIDDISPOSITIVO write FGUUIDDISPOSITIVO;

    [Column('DATACADASTRO', ftDateTime)]
    [Dictionary('DATACADASTRO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATACADASTRO: TDateTime read GetDATACADASTRO write FDATACADASTRO;

    [Column('DATAALTERACAO', ftDateTime)]
    [Dictionary('DATAALTERACAO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATAALTERACAO: TDateTime read GetDATAALTERACAO write FDATAALTERACAO;

    [Column('DATALIBERACAO', ftDateTime)]
    [Dictionary('DATALIBERACAO', 'Mensagem de valida��o', '', '', '', taCenter)]
    property DATALIBERACAO: TDateTime read FDATALIBERACAO write FDATALIBERACAO;
  end;

implementation

{ TCONFIGURACOES }

function TCONFIGURACOES.GetDATAALTERACAO: TDateTime;
begin
  FDATAALTERACAO := Now;
  Result         := FDATAALTERACAO;
end;

function TCONFIGURACOES.GetDATACADASTRO: TDateTime;
begin
  if FDATACADASTRO = StrToDateTime('30/12/1899') then
    FDATACADASTRO := Now;
  Result := FDATACADASTRO;
end;

function TCONFIGURACOES.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TCONFIGURACOES)

end.
