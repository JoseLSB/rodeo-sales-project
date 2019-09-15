unit MFichas.Model.Pagamento.Formas.Interfaces;

interface

uses MFichas.Model.Pagamento.Interfaces;

type
  iModelPagamentoFormasFactory = interface
    function Dinheiro(AParent: iModelPagamento)     : iModelPagamentoMetodos;
    function CartaoDebito(AParent: iModelPagamento) : iModelPagamentoMetodos;
    function CartaoCredito(AParent: iModelPagamento): iModelPagamentoMetodos;
  end;

implementation

end.
