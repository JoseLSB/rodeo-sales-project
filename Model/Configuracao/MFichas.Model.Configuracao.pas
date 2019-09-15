unit MFichas.Model.Configuracao;

interface

uses
  System.SysUtils,

  MFichas.Model.Configuracao.Interfaces,
  MFichas.Model.Entidade.CONFIGURACOES,
  MFichas.Model.Conexao.Interfaces,
  MFichas.Model.Conexao.Factory,

  ORMBR.Container.ObjectSet.Interfaces,
  ORMBR.Container.ObjectSet,
  ORMBR.Container.DataSet.Interfaces,
  ORMBR.Container.FDMemTable,

  FireDAC.Comp.Client;

type
  TModelConfiguracao = class(TInterfacedObject, iModelConfiguracao, iModelConfiguracaoMetodos)
  private
    FFDMemTable: TFDMemTable;
    FConn      : iModelConexaoSQL;
    FDAO       : iContainerObjectSet<TCONFIGURACOES>;
    FDAODataSet: iContainerDataSet<TCONFIGURACOES>;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelConfiguracao;
    function Metodos   : iModelConfiguracaoMetodos;
    function DAO       : iContainerObjectSet<TCONFIGURACOES>;
    function DAODataSet: iContainerDataSet<TCONFIGURACOES>;
    //METODOS
    function BuscarModel: iModelConfiguracaoMetodosBuscarModel;
    function EditarView : iModelConfiguracaoMetodosEditarView;
    function BuscarView : iModelConfiguracaoMetodosBuscarView;
    function &End       : iModelConfiguracao;
  end;

implementation

{ TModelConfiguracao }

uses
  MFichas.Model.Configuracao.Metodos.Buscar.Model,
  MFichas.Model.Configuracao.Metodos.Buscar.View,
  MFichas.Model.Configuracao.Metodos.Editar.View;

function TModelConfiguracao.&End: iModelConfiguracao;
begin
  Result := Self;
end;

function TModelConfiguracao.BuscarModel: iModelConfiguracaoMetodosBuscarModel;
begin
  Result := TModelConfiguracaoMetodosBuscarModel.New(Self);
end;

function TModelConfiguracao.BuscarView: iModelConfiguracaoMetodosBuscarView;
begin
  Result := TModelConfiguracaoMetodosBuscarView.New(Self);
end;

constructor TModelConfiguracao.Create;
begin
  FFDMemTable := TFDMemTable.Create(nil);
  FConn       := TModelConexaoFactory.New.ConexaoSQL;
  FDAO        := TContainerObjectSet<TCONFIGURACOES>.Create(FConn.Conn);
  FDAODataSet := TContainerFDMemTable<TCONFIGURACOES>.Create(FConn.Conn, FFDMemTable);
end;

function TModelConfiguracao.DAO: iContainerObjectSet<TCONFIGURACOES>;
begin
  Result := FDAO;
end;

function TModelConfiguracao.DAODataSet: iContainerDataSet<TCONFIGURACOES>;
begin
  Result := FDAODataSet;
end;

destructor TModelConfiguracao.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FFDMemTable);
  {$ELSE}
  FFDMemTable.Free;
  FFDMemTable.DisposeOf;
  {$ENDIF}
  inherited;
end;

function TModelConfiguracao.EditarView: iModelConfiguracaoMetodosEditarView;
begin
  Result := TModelConfiguracaoMetodosEditarView.New(Self);
end;

function TModelConfiguracao.Metodos: iModelConfiguracaoMetodos;
begin
  Result := Self;
end;

class function TModelConfiguracao.New: iModelConfiguracao;
begin
  Result := Self.Create;
end;

end.
