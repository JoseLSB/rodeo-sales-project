unit MFichas.Model.Produto;

interface

uses
  System.SysUtils,

  MFichas.Model.Produto.Interfaces,
  MFichas.Model.Produto.Metodos.Buscar,
  MFichas.Model.Produto.Metodos.Buscar.Model,
  MFichas.Model.Produto.Metodos.Cadastrar,
  MFichas.Model.Produto.Metodos.Editar,
  MFichas.Model.Entidade.PRODUTO,
  MFichas.Model.Conexao.Factory,
  MFichas.Model.Conexao.Interfaces,

  ORMBR.Container.ObjectSet,
  ORMBR.Container.ObjectSet.Interfaces,
  ORMBR.Container.FDMemTable,
  ORMBR.Container.DataSet.interfaces,

  FireDAC.Comp.Client;

type
  TModelProduto = class(TInterfacedObject, iModelProduto, iModelProdutoMetodos)
  private
    FEntidade    : TPRODUTO;
    FConn        : iModelConexaoSQL;
    FDAOObjectSet: IContainerObjectSet<TPRODUTO>;
    FDAODataSet  : IContainerDataSet<TPRODUTO>;
    FFDMemTable  : TFDMemTable;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelProduto;
    function Metodos                      : iModelProdutoMetodos;
    function Entidade                     : TPRODUTO; overload;
    function Entidade(AEntidade: TPRODUTO): iModelProduto; overload;
    function DAO                          : iContainerObjectSet<TPRODUTO>;
    function DAODataSet                   : iContainerDataSet<TPRODUTO>;
    //METODOS
    function CadastrarView: iModelProdutoMetodosCadastrar;
    function EditarView   : iModelProdutoMetodosEditar;
    function BuscarView   : iModelProdutoMetodosBuscar;
    function BuscarModel  : iModelProdutoMetodosBuscarModel;
    function &End         : iModelProduto;
  end;

implementation

{ TModelProduto }

function TModelProduto.BuscarModel: iModelProdutoMetodosBuscarModel;
begin
  Result := TModelProdutoMetodosBuscarModel.New(Self);
end;

function TModelProduto.BuscarView: iModelProdutoMetodosBuscar;
begin
  Result := TModelProdutoMetodosBuscar.New(Self);
end;

function TModelProduto.CadastrarView: iModelProdutoMetodosCadastrar;
begin
  Result := TModelProdutoMetodosCadastrar.New(Self);
end;

function TModelProduto.EditarView: iModelProdutoMetodosEditar;
begin
  Result := TModelProdutoMetodosEditar.New(Self);
end;

function TModelProduto.&End: iModelProduto;
begin
  Result := Self;
end;

function TModelProduto.Entidade: TPRODUTO;
begin
  Result := FEntidade;
end;

function TModelProduto.Entidade(AEntidade: TPRODUTO): iModelProduto;
begin
  Result    := Self;
  FEntidade := AEntidade;
end;

constructor TModelProduto.Create;
begin
  FEntidade     := TPRODUTO.Create;
  FConn         := TModelConexaoFactory.New.ConexaoSQL;
  FDAOObjectSet := TContainerObjectSet<TPRODUTO>.Create(FConn.Conn, 10);
  FFDMemTable   := TFDMemTable.Create(nil);
  FDAODataSet   := TContainerFDMemTable<TPRODUTO>.Create(FConn.Conn, FFDMemTable);
end;

function TModelProduto.DAODataSet: iContainerDataSet<TPRODUTO>;
begin
  Result := FDAODataSet;
end;

function TModelProduto.DAO: iContainerObjectSet<TPRODUTO>;
begin
  Result := FDAOObjectSet;
end;

destructor TModelProduto.Destroy;
begin
  {$IFDEF MSWINDOWS}
  FreeAndNil(FEntidade);
  FreeAndNil(FFDMemTable);
  {$ELSE}
  FEntidade.Free;
  FEntidade.DisposeOf;
  FFDMemTable.Free;
  FFDMemTable.DisposeOf;
  {$ENDIF}
  inherited;
end;

function TModelProduto.Metodos: iModelProdutoMetodos;
begin
  Result := Self;
end;

class function TModelProduto.New: iModelProduto;
begin
  Result := Self.Create;
end;

end.

