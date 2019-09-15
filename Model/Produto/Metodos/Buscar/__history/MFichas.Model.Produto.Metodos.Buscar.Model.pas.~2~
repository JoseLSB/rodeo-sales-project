unit MFichas.Model.Produto.Metodos.Buscar.Model;

interface

uses
  System.SysUtils,
  System.Generics.Collections,

  MFichas.Model.Produto.Interfaces,
  MFichas.Model.Entidade.PRODUTO;

type
  TModelProdutoMetodosBuscarModel = class(TInterfacedObject, iModelProdutoMetodosBuscarModel)
  private
    [weak]
    FParent: iModelProduto;
    constructor Create(AParent: iModelProduto);
  public
    destructor Destroy; override;
    class function New(AParent: iModelProduto): iModelProdutoMetodosBuscarModel;
    function BuscarPorCodigo(AGUUID: String): TObjectList<TPRODUTO>;
    function &End                           : iModelProdutoMetodos;
  end;

implementation

{ TModelProdutoMetodosBuscarModel }

function TModelProdutoMetodosBuscarModel.&End: iModelProdutoMetodos;
begin
  Result := FParent.Metodos;
end;

function TModelProdutoMetodosBuscarModel.BuscarPorCodigo(
  AGUUID: String): TObjectList<TPRODUTO>;
begin
  Result := FParent.DAO.FindWhere('GUUID = ' + QuotedStr(AGUUID));
end;

constructor TModelProdutoMetodosBuscarModel.Create(AParent: iModelProduto);
begin
  FParent := AParent;
end;

destructor TModelProdutoMetodosBuscarModel.Destroy;
begin

  inherited;
end;

class function TModelProdutoMetodosBuscarModel.New(AParent: iModelProduto): iModelProdutoMetodosBuscarModel;
begin
  Result := Self.Create(AParent);
end;

end.
