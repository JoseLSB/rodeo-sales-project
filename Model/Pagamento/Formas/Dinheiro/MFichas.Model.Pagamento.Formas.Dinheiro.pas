unit MFichas.Model.Pagamento.Formas.Dinheiro;

interface

uses
  MFichas.Model.Pagamento.Interfaces,
  MFichas.Model.Pagamento.Formas.Dinheiro.Estornar,
  MFichas.Model.Pagamento.Formas.Dinheiro.Processar;

type
  TModelPagamentoFormasDinheiro = class(TInterfacedObject, iModelPagamentoMetodos)
  private
    [weak]
    FParent: iModelPagamento;
    constructor Create(AParent: iModelPagamento);
  public
    destructor Destroy; override;
    class function New(AParent: iModelPagamento): iModelPagamentoMetodos;
    function Processar: iModelPagamentoMetodosProcessar;
    function Estornar : iModelPagamentoMetodosEstornar;
    function &End     : iModelPagamento;
  end;

implementation

{ TModelPagamentoFormasDinheiro }

function TModelPagamentoFormasDinheiro.&End: iModelPagamento;
begin
  Result := FParent;
end;

constructor TModelPagamentoFormasDinheiro.Create(AParent: iModelPagamento);
begin
  FParent := AParent;
end;

destructor TModelPagamentoFormasDinheiro.Destroy;
begin

  inherited;
end;

function TModelPagamentoFormasDinheiro.Estornar: iModelPagamentoMetodosEstornar;
begin
  Result := TModelPagamentoFormasDinheiroEstornar.New(FParent);
end;

class function TModelPagamentoFormasDinheiro.New(AParent: iModelPagamento): iModelPagamentoMetodos;
begin
  Result := Self.Create(AParent);
end;

function TModelPagamentoFormasDinheiro.Processar: iModelPagamentoMetodosProcessar;
begin
  Result := TModelPagamentoFormasDinheiroProcessar.New(FParent);
end;

end.
