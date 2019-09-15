unit MFichas.Controller.Usuario;

interface

uses
  MFichas.Controller.Usuario.Interfaces,

  MFichas.Model.Usuario.Interfaces,
  MFichas.Model.Usuario.TipoDeUsuario.Factory,
  MFichas.Model.Usuario;

type
  TControllerUsuario = class(TInterfacedObject, iControllerUsuario)
  private
    FModel  : iModelUsuario;
    FCaixa  : iModelUsuarioMetodos;
    FFiscal : iModelUsuarioMetodos;
    FGerente: iModelUsuarioMetodos;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iControllerUsuario;
    function Caixa  : iModelUsuarioMetodos;
    function Fiscal : iModelUsuarioMetodos;
    function Gerente: iModelUsuarioMetodos;
  end;

implementation

uses
  MFichas.Controller.Usuario.Operacoes.PedirSenha;

{ TControllerUsuario }

function TControllerUsuario.Caixa: iModelUsuarioMetodos;
begin
  Result := FCaixa;
end;

constructor TControllerUsuario.Create;
begin
  if not Assigned(FModel) then
    FModel := TModelUsuario.New;
  FCaixa   := TModelUsuarioTipoDeUsuarioFactory.New.Caixa(FModel);
  FFiscal  := TModelUsuarioTipoDeUsuarioFactory.New.Fiscal(FModel);
  FGerente := TModelUsuarioTipoDeUsuarioFactory.New.Gerente(FModel);

  FCaixa.NextReponsibility(FFiscal).SetOperacoes(TControllerUsuarioOperacoesPedirSenha.New);
  FFiscal.NextReponsibility(FGerente).SetOperacoes(TControllerUsuarioOperacoesPedirSenha.New);
  FGerente.NextReponsibility(nil).SetOperacoes(TControllerUsuarioOperacoesPedirSenha.New);
end;

destructor TControllerUsuario.Destroy;
begin

  inherited;
end;

function TControllerUsuario.Fiscal: iModelUsuarioMetodos;
begin
  Result := FFiscal;
end;

function TControllerUsuario.Gerente: iModelUsuarioMetodos;
begin
  Result := FGerente;
end;

class function TControllerUsuario.New: iControllerUsuario;
begin
  Result := Self.Create;
end;

end.
