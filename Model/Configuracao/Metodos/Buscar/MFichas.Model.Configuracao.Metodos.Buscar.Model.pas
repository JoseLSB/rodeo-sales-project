unit MFichas.Model.Configuracao.Metodos.Buscar.Model;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  MFichas.Model.Entidade.CONFIGURACOES,
  MFichas.Model.Configuracao.Interfaces;

type
  TModelConfiguracaoMetodosBuscarModel = class(TInterfacedObject, iModelConfiguracaoMetodosBuscarModel)
  private
    [weak]
    FListaConfiguracao: TObjectList<TCONFIGURACOES>;
    FParent: iModelConfiguracao;
    constructor Create(AParent: iModelConfiguracao);
  public
    destructor Destroy; override;
    class function New(AParent: iModelConfiguracao): iModelConfiguracaoMetodosBuscarModel;
    function Impressora: String;
    function &End      : iModelConfiguracaoMetodos;
  end;

implementation

{ TModelConfiguracaoMetodosBuscarModel }

function TModelConfiguracaoMetodosBuscarModel.&End: iModelConfiguracaoMetodos;
begin
  Result := FParent.Metodos;
end;

constructor TModelConfiguracaoMetodosBuscarModel.Create(AParent: iModelConfiguracao);
begin
  FParent := AParent;
end;

destructor TModelConfiguracaoMetodosBuscarModel.Destroy;
begin
  {$IFDEF MSWINDOWS}
  if Assigned(FListaConfiguracao) then
    FreeAndNil(FListaConfiguracao);
  {$ELSE}
  if Assigned(FListaConfiguracao) then
  begin
    FListaConfiguracao.Free;
    FListaConfiguracao.DisposeOf;
  end;
  {$ENDIF}
  inherited;
end;

class function TModelConfiguracaoMetodosBuscarModel.New(AParent: iModelConfiguracao): iModelConfiguracaoMetodosBuscarModel;
begin
  Result := Self.Create(AParent);
end;

function TModelConfiguracaoMetodosBuscarModel.Impressora: String;
begin
  FListaConfiguracao := FParent.DAO.Find;
  Result := FListaConfiguracao.Items[0].IMPRESSORA;
end;

end.
