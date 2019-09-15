unit MFichas.Model.Pagamento.Formas.Factory;

interface

uses
  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Pagamento.Formas.Interfaces,
  MFichas.Model.Pagamento.Formas.Dinheiro,
  MFichas.Model.Pagamento.Formas.Debito,
  MFichas.Model.Pagamento.Formas.Credito;

type
  TModelPagamentoFormasFactory = class(TInterfacedObject, iModelPagamentoFormasFactory)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelPagamentoFormasFactory;
    function Dinheiro(AParent: iModelPagamento)     : iModelPagamentoMetodos;
    function CartaoDebito(AParent: iModelPagamento) : iModelPagamentoMetodos;
    function CartaoCredito(AParent: iModelPagamento): iModelPagamentoMetodos;
  end;

implementation

{ TModelPagamentoFormasFactory }

function TModelPagamentoFormasFactory.CartaoCredito(AParent: iModelPagamento): iModelPagamentoMetodos;
begin
  Result := TModelPagamentoFormasCredito.New(AParent);
end;

function TModelPagamentoFormasFactory.CartaoDebito(AParent: iModelPagamento): iModelPagamentoMetodos;
begin
  Result := TModelPagamentoFormasDebito.New(AParent);
end;

constructor TModelPagamentoFormasFactory.Create;
begin

end;

destructor TModelPagamentoFormasFactory.Destroy;
begin

  inherited;
end;

function TModelPagamentoFormasFactory.Dinheiro(AParent: iModelPagamento): iModelPagamentoMetodos;
begin
  Result := TModelPagamentoFormasDinheiro.New(AParent);
end;

class function TModelPagamentoFormasFactory.New: iModelPagamentoFormasFactory;
begin
  Result := Self.Create;
end;

end.
