unit MFichas.Model.Empresa.Metodos.Editar.View;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  MFichas.Model.Empresa.Interfaces,
  MFichas.Model.Entidade.EMPRESA,

  ORMBR.Types.Blob;

type
  TModelEmpresaMetodosEditarView = class(TInterfacedObject, iModelEmpresaMetodosEditarView)
  private
    [weak]
    FParent     : iModelEmpresa;
    FEntidade   : TEMPRESA;
    FNomeEmpresa: String;
    FLogoEmpresa: TBlob;
    FListaEmpresa: TObjectList<TEMPRESA>;
    constructor Create(AParent: iModelEmpresa);
    procedure RecuperarObjectoNoBancoDeDados;
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelEmpresa): iModelEmpresaMetodosEditarView;
    function Descricao(ANomeEmpresa: String): iModelEmpresaMetodosEditarView;
    function LogoTipo(ALogoEmpresa: String) : iModelEmpresaMetodosEditarView;
    function &End                           : iModelEmpresaMetodos;
  end;

implementation

{ TModelEmpresaMetodosEditarView }

function TModelEmpresaMetodosEditarView.&End: iModelEmpresaMetodos;
begin
  Result := FParent.Metodos;
  RecuperarObjectoNoBancoDeDados;
  Gravar;
end;

procedure TModelEmpresaMetodosEditarView.Gravar;
begin
  FParent.DAO.Modify(FEntidade);
  FEntidade.DESCRICAO := FNomeEmpresa;
  FEntidade.LOGOTIPO  := FLogoEmpresa;
  FParent.DAO.Update(FEntidade);
end;

constructor TModelEmpresaMetodosEditarView.Create(AParent: iModelEmpresa);
begin
  FParent   := AParent;
  FEntidade := TEMPRESA.Create;
end;

function TModelEmpresaMetodosEditarView.Descricao(
  ANomeEmpresa: String): iModelEmpresaMetodosEditarView;
begin
  Result       := Self;
  FNomeEmpresa := ANomeEmpresa;
end;

destructor TModelEmpresaMetodosEditarView.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FEntidade);
  if Assigned(FListaEmpresa) then
    FreeAndNil(FListaEmpresa);
  {$ELSE}
  FEntidade.Free;
  FEntidade.DisposeOf;
  if Assigned(FListaEmpresa) then
  begin
    FListaEmpresa.Free;
    FListaEmpresa.DisposeOf;
  end;
  {$ENDIF}
  inherited;
end;

function TModelEmpresaMetodosEditarView.LogoTipo(
  ALogoEmpresa: String): iModelEmpresaMetodosEditarView;
begin
  Result       := Self;
  FLogoEmpresa.LoadFromFile(ALogoEmpresa);
end;

class function TModelEmpresaMetodosEditarView.New(AParent: iModelEmpresa): iModelEmpresaMetodosEditarView;
begin
  Result := Self.Create(AParent);
end;

procedure TModelEmpresaMetodosEditarView.RecuperarObjectoNoBancoDeDados;
begin
  FListaEmpresa := FParent.DAO.Find;

  FEntidade.GUUID         := FListaEmpresa[0].GUUID;
  FEntidade.DESCRICAO     := FListaEmpresa[0].DESCRICAO;
  FEntidade.LOGOTIPO      := FListaEmpresa[0].LOGOTIPO;
  FEntidade.DATACADASTRO  := FListaEmpresa[0].DATACADASTRO;
  FEntidade.DATAALTERACAO := FListaEmpresa[0].DATAALTERACAO;
end;

end.
