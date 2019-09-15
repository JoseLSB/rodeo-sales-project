unit MFichas.Model.Usuario.Funcoes.Validacao.ValidarUsuarioESenha;

interface

uses
  System.SysUtils,

  MFichas.Model.Conexao.Interfaces,
  MFichas.Model.Conexao.Factory,
  MFichas.Model.Usuario.Interfaces;

type
  TModelUsuarioFuncoesValidarUES = class(TInterfacedObject, iModelUsuarioFuncoesValidarUES)
  private
    [weak]
    FParent : iModelUsuario;
    FUsuario: String;
    FSenha  : String;
    FConexao: iModelConexaoSQL;
    constructor Create(AParent: iModelUsuario);
  public
    destructor Destroy; override;
    class function New(AParent: iModelUsuario): iModelUsuarioFuncoesValidarUES;
    function NomeDoUsuario(AValue: String): iModelUsuarioFuncoesValidarUES;
    function Senha(AValue: String)        : iModelUsuarioFuncoesValidarUES;
    function &End                         : iModelUsuarioFuncoes;
  end;

implementation

{ TModelUsuarioFuncoesValidarUES }

function TModelUsuarioFuncoesValidarUES.&End: iModelUsuarioFuncoes;
const
  _SQL   = ' SELECT * FROM USUARIO ';
  _WHERE = ' WHERE LOGIN = ''%s'' AND SENHA = ''%s''';
begin
  Result := FParent.Funcoes;
  FConexao.Query.Active   := False;
  FConexao.Query.SQL.Text := '';
  FConexao.Query.SQL.Text := _SQL + Format(_WHERE, [FUsuario, FSenha]);
  FConexao.Query.Active   := True;

  if FConexao.Query.RecordCount = 0 then
    raise Exception.Create(
      'A senha informada é inválida ou foi digitada incorretamente.' + sLineBreak +
      'Verifique-a e tente novamente.'
    );
end;

constructor TModelUsuarioFuncoesValidarUES.Create(AParent: iModelUsuario);
begin
  FParent  := AParent;
  FConexao := TModelConexaoFactory.New.ConexaoSQL;
end;

destructor TModelUsuarioFuncoesValidarUES.Destroy;
begin

  inherited;
end;

class function TModelUsuarioFuncoesValidarUES.New(AParent: iModelUsuario): iModelUsuarioFuncoesValidarUES;
begin
  Result := Self.Create(AParent);
end;

function TModelUsuarioFuncoesValidarUES.NomeDoUsuario(
  AValue: String): iModelUsuarioFuncoesValidarUES;
begin
  Result   := Self;
  if AValue.IsNullOrWhiteSpace(AValue) then
    raise Exception.Create(
      'Por favor, selecione um usuário antes de prosseguir.'
    );
  FUsuario := AValue.ToUpper;
end;

function TModelUsuarioFuncoesValidarUES.Senha(
  AValue: String): iModelUsuarioFuncoesValidarUES;
begin
  Result := Self;
  if AValue.IsNullOrWhiteSpace(AValue) then
    raise Exception.Create(
      'Por favor, digite uma senha antes de prosseguir.'
    );
  FSenha := AValue;
end;

end.
