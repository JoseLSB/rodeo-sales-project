unit MFichas.Model.Entidade.USUARIOPERMISSOES;

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
  [Table('USUARIOPERMISSOES', '')]
  [PrimaryKey('DESCRICAO', NotInc, NoSort, False, 'Chave primária')]
  TUSUARIOPERMISSOES = class
  private
    { Private declarations } 
    FDESCRICAO: String;
    FPERMISSAO: Integer;
  public 
    { Public declarations } 
    [Column('DESCRICAO', ftString, 60)]
    [Dictionary('DESCRICAO', 'Mensagem de validação', '', '', '', taLeftJustify)]
    property DESCRICAO: String read FDESCRICAO write FDESCRICAO;

    [Column('PERMISSAO', ftInteger)]
    [Dictionary('PERMISSAO', 'Mensagem de validação', '', '', '', taCenter)]
    property PERMISSAO: Integer read FPERMISSAO write FPERMISSAO;
  end;

implementation

initialization

  TRegisterClass.RegisterEntity(TUSUARIOPERMISSOES)

end.
