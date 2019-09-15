unit MFichas.Model.Empresa;

interface

uses
  System.SysUtils,

  MFichas.Model.Empresa.Interfaces,
  MFichas.Model.Entidade.EMPRESA,
  MFichas.Model.Conexao.Interfaces,
  MFichas.Model.Conexao.Factory,

  ORMBR.Container.ObjectSet.Interfaces,
  ORMBR.Container.ObjectSet,
  ORMBR.Container.DataSet.Interfaces,
  ORMBR.Container.FDMemTable,

  FireDAC.Comp.Client;

type
  TModelEmpresa = class(TInterfacedObject, iModelEmpresa, iModelEmpresaMetodos)
  private
    FFDMemTable: TFDMemTable;
    FConn      : iModelConexaoSQL;
    FDAO       : iContainerObjectSet<TEMPRESA>;
    FDAODataSet: iContainerDataSet<TEMPRESA>;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelEmpresa;
    function Metodos   : iModelEmpresaMetodos;
    function DAO       : iContainerObjectSet<TEMPRESA>;
    function DAODataSet: iContainerDataSet<TEMPRESA>;
    //METODOS
    function BuscarModel: iModelEmpresaMetodosBuscarModel;
    function EditarView : iModelEmpresaMetodosEditarView;
    function BuscarView : iModelEmpresaMetodosBuscarView;
    function &End       : iModelEmpresa;
  end;

implementation

{ TModelEmpresa }

uses
  MFichas.Model.Empresa.Metodos.Buscar.Model,
  MFichas.Model.Empresa.Metodos.Buscar.View,
  MFichas.Model.Empresa.Metodos.Editar.View;

function TModelEmpresa.&End: iModelEmpresa;
begin
  Result := Self;
end;

function TModelEmpresa.BuscarModel: iModelEmpresaMetodosBuscarModel;
begin
  Result := TModelEmpresaMetodosBuscarModel.New(Self);
end;

function TModelEmpresa.BuscarView: iModelEmpresaMetodosBuscarView;
begin
  Result := TModelEmpresaMetodosBuscarView.New(Self);
end;

constructor TModelEmpresa.Create;
begin
  FFDMemTable := TFDMemTable.Create(nil);
  FConn       := TModelConexaoFactory.New.ConexaoSQL;
  FDAO        := TContainerObjectSet<TEMPRESA>.Create(FConn.Conn);
  FDAODataSet := TContainerFDMemTable<TEMPRESA>.Create(FConn.Conn, FFDMemTable);
end;

function TModelEmpresa.DAO: iContainerObjectSet<TEMPRESA>;
begin
  Result := FDAO;
end;

function TModelEmpresa.DAODataSet: iContainerDataSet<TEMPRESA>;
begin
  Result := FDAODataSet;
end;

destructor TModelEmpresa.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FFDMemTable);
  {$ELSE}
  FFDMemTable.Free;
  FFDMemTable.DisposeOf;
  {$ENDIF}
  inherited;
end;

function TModelEmpresa.EditarView: iModelEmpresaMetodosEditarView;
begin
  Result := TModelEmpresaMetodosEditarView.New(Self);
end;

function TModelEmpresa.Metodos: iModelEmpresaMetodos;
begin
  Result := Self;
end;

class function TModelEmpresa.New: iModelEmpresa;
begin
  Result := Self.Create;
end;

end.
