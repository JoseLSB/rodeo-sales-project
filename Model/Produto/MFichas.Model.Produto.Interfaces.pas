unit MFichas.Model.Produto.Interfaces;

interface

uses
  System.Generics.Collections,

  MFichas.Model.Entidade.PRODUTO,

  ORMBR.Container.ObjectSet.Interfaces,
  ORMBR.Container.DataSet.interfaces,

  FireDAC.Comp.Client;

type
  iModelProduto                   = interface;
  iModelProdutoMetodos            = interface;
  iModelProdutoMetodosCadastrar   = interface;
  iModelProdutoMetodosEditar      = interface;
  iModelProdutoMetodosBuscar      = interface;
  iModelProdutoMetodosBuscarModel = interface;

  iModelProduto = interface
    ['{61661537-0B52-412D-ADBF-07AD0CE4B36A}']
    function Metodos: iModelProdutoMetodos;
    function Entidade: TPRODUTO; overload;
    function Entidade(AEntidade: TPRODUTO): iModelProduto; overload;
    function DAO       : iContainerObjectSet<TPRODUTO>;
    function DAODataSet: iContainerDataSet<TPRODUTO>;
  end;

  iModelProdutoMetodos = interface
    ['{F0085DB7-902C-4F16-9EE4-FD46FDC51B48}']
    function CadastrarView: iModelProdutoMetodosCadastrar;
    function EditarView   : iModelProdutoMetodosEditar;
    function BuscarView   : iModelProdutoMetodosBuscar;
    function BuscarModel  : iModelProdutoMetodosBuscarModel;
    function &End         : iModelProduto;
  end;

  iModelProdutoMetodosCadastrar = interface
    ['{6F017D50-9B06-43DA-8EFB-2C96818DF053}']
    function Descricao(ADescricao: String): iModelProdutoMetodosCadastrar;
    function Valor(AValor: Currency)      : iModelProdutoMetodosCadastrar;
    function Grupo(AGrupo: String)        : iModelProdutoMetodosCadastrar;
    function &End                         : iModelProdutoMetodos;
  end;

  iModelProdutoMetodosBuscar = interface
    ['{53805661-F48B-47DF-9CFF-84DC595B3C01}']
    function FDMemTable(AFDMemTable: TFDMemTable): iModelProdutoMetodosBuscar;
    function BuscarTodos                     : iModelProdutoMetodosBuscar;
    function BuscarTodosAtivos               : iModelProdutoMetodosBuscar;
    function BuscarPorCodigo(ACodigo: String): iModelProdutoMetodosBuscar;
    function BuscarPorGrupo(AGrupo: String)  : iModelProdutoMetodosBuscar;
    function &End                            : iModelProdutoMetodos;
  end;

  iModelProdutoMetodosBuscarModel = interface
    ['{93C38D5A-83DE-4B9E-A5AB-D7058E113F90}']
    function BuscarPorCodigo(AGUUID: String): TObjectList<TPRODUTO>;
    function &End                           : iModelProdutoMetodos;
  end;

  iModelProdutoMetodosEditar = interface
    ['{C9AAD284-8E20-4162-8762-C5C8B09E1B95}']
    function GUUID(AGUUID: String)        : iModelProdutoMetodosEditar;
    function Descricao(ADescricao: String): iModelProdutoMetodosEditar;
    function Valor(AValor: Currency)      : iModelProdutoMetodosEditar;
    function Grupo(AGrupo: String)        : iModelProdutoMetodosEditar;
    function AtivoInativo(AValue: Integer): iModelProdutoMetodosEditar;
    function &End                         : iModelProdutoMetodos;
  end;

implementation

end.
