unit MFichas.Model.Entidade.VENDA;

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
  [Table('VENDA', '')]
  [PrimaryKey('GUUID', NotInc, NoSort, False, 'Chave primária')]
  TVENDA = class
  private
    { Private declarations } 
    FGUUID: String;
    FCAIXA: String;
    FNUMERO: Integer;
    FDATAABERTURA: TDateTime;
    FDATAFECHAMENTO: TDateTime;
    FSTATUS: Integer;
    function GetDATAABERTURA: TDateTime;
    function GetGUUID: String;
  public 
    { Public declarations } 
    [Column('GUUID', ftString, 38)]
    [Dictionary('GUUID', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property GUUID: String read GetGUUID write FGUUID;

    [Column('CAIXA', ftString, 38)]
    [Dictionary('CAIXA', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property CAIXA: String read FCAIXA write FCAIXA;

    [Column('NUMERO', ftInteger)]
    [Dictionary('NUMERO', 'Mensagem de validação', '', '', '', taCenter)]
    property NUMERO: Integer read FNUMERO write FNUMERO;

    [Column('DATAABERTURA', ftDateTime)]
    [Dictionary('DATAABERTURA', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAABERTURA: TDateTime read GetDATAABERTURA write FDATAABERTURA;

    [Column('DATAFECHAMENTO', ftDateTime)]
    [Dictionary('DATAFECHAMENTO', 'Mensagem de validação', '', '', '', taCenter)]
    property DATAFECHAMENTO: TDateTime read FDATAFECHAMENTO write FDATAFECHAMENTO;

    [Column('STATUS', ftInteger)]
    [Dictionary('STATUS', 'Mensagem de validação', '', '', '', taCenter)]
    property STATUS: Integer read FSTATUS write FSTATUS;
  end;

implementation

{ TVENDA }

function TVENDA.GetDATAABERTURA: TDateTime;
begin
  if FDATAABERTURA = StrToDate('30/12/1899') then
    FDATAABERTURA := Now;
  Result := FDATAABERTURA;
end;

function TVENDA.GetGUUID: String;
begin
  if FGUUID.IsEmpty then
    FGUUID := TGUID.NewGuid.ToString;
  Result := FGUUID;
end;

initialization

  TRegisterClass.RegisterEntity(TVENDA)

end.
