unit MFichas.Model.Venda.State.Pagar;

interface

uses
  System.SysUtils,

  MFichas.Model.Venda.Interfaces;

type
  TModelVendaStatePagar = class(TInterfacedObject, iModelVendaMetodos)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelVendaMetodos;
    function Abrir    : iModelVendaMetodosAbrir;
    function Pagar    : iModelVendaMetodosPagar;
    function Finalizar: iModelVendaMetodosFinalizar;
    function &End     : iModelVenda;
  end;

implementation

{ TModelVendaStatePagar }

function TModelVendaStatePagar.&End: iModelVenda;
begin

end;

function TModelVendaStatePagar.Abrir: iModelVendaMetodosAbrir;
begin
  raise Exception.Create(
    'Não é possível abrir uma nova venda sem finalizar a venda atual.' + sLineBreak +
    'Insira uma forma de pagamento e finalize a venda atual.'
  );
end;

constructor TModelVendaStatePagar.Create;
begin

end;

destructor TModelVendaStatePagar.Destroy;
begin

  inherited;
end;

function TModelVendaStatePagar.Finalizar: iModelVendaMetodosFinalizar;
begin

end;

class function TModelVendaStatePagar.New: iModelVendaMetodos;
begin
  Result := Self.Create;
end;

function TModelVendaStatePagar.Pagar: iModelVendaMetodosPagar;
begin

end;

end.
