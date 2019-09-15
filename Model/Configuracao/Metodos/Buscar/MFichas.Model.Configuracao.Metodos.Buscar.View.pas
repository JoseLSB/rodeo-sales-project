unit MFichas.Model.Configuracao.Metodos.Buscar.View;

interface

uses
  System.SysUtils,

  MFichas.Model.Configuracao.Interfaces,

  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet;

type
  TModelConfiguracaoMetodosBuscarView = class(TInterfacedObject, iModelConfiguracaoMetodosBuscarView)
  private
    [weak]
    FParent    : iModelConfiguracao;
    FFDMemTable: TFDMemTable;
    constructor Create(AParent: iModelConfiguracao);
    procedure Validacao;
    procedure CopiarDataSet;
  public
    destructor Destroy; override;
    class function New(AParent: iModelConfiguracao): iModelConfiguracaoMetodosBuscarView;
    function FDMemTable(AFDMemTable: TFDMemTable): iModelConfiguracaoMetodosBuscarView;
    function BuscarConfiguracao                  : iModelConfiguracaoMetodosBuscarView;
    function &End                                : iModelConfiguracaoMetodos;
  end;

implementation

{ TModelConfiguracaoMetodosBuscarView }

function TModelConfiguracaoMetodosBuscarView.BuscarConfiguracao: iModelConfiguracaoMetodosBuscarView;
begin
  Result := Self;

  FParent.DAODataSet.Open;
  Validacao;
  CopiarDataSet;
end;

function TModelConfiguracaoMetodosBuscarView.&End: iModelConfiguracaoMetodos;
begin
  Result := FParent.Metodos;
end;

procedure TModelConfiguracaoMetodosBuscarView.CopiarDataSet;
begin
  FFDMemTable.CopyDataSet(FParent.DAODataSet.DataSet, [coStructure, coRestart, coAppend]);
end;

constructor TModelConfiguracaoMetodosBuscarView.Create(AParent: iModelConfiguracao);
begin
  FParent := AParent;
end;

destructor TModelConfiguracaoMetodosBuscarView.Destroy;
begin

  inherited;
end;

function TModelConfiguracaoMetodosBuscarView.FDMemTable(
  AFDMemTable: TFDMemTable): iModelConfiguracaoMetodosBuscarView;
begin
  Result      := Self;
  FFDMemTable := AFDMemTable;
end;

class function TModelConfiguracaoMetodosBuscarView.New(AParent: iModelConfiguracao): iModelConfiguracaoMetodosBuscarView;
begin
  Result := Self.Create(AParent);
end;

procedure TModelConfiguracaoMetodosBuscarView.Validacao;
begin
  if FParent.DAODataSet.DataSet.RecordCount = 0 then
    raise Exception.Create(
      'Nenhuma configuração encontrada.'
    );

  if not Assigned(FFDMemTable) then
    raise Exception.Create(
      'Para prosseguir, você deve vincular um FDMemTable ao encadeamento' +
      ' de funcões do método de Configuracoes.Metodos.BuscarView .'
    );
end;

end.
