unit MFichas.Model.Venda.Metodos.Factory;

interface

uses
  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Venda.Metodos.Interfaces,
  MFichas.Model.Venda.Metodos.Abrir,
  MFichas.Model.Venda.Metodos.Pagar,
  MFichas.Model.Venda.Metodos.Finalizar;

type
  TModelVendaMetodosFactory = class(TInterfacedObject, iModelVendaMetodosFactory)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelVendaMetodosFactory;
    function Abrir(AParent: iModelVenda)    : iModelVendaMetodosAbrir;
    function Pagar(AParent: iModelVenda)    : iModelVendaMetodosPagar;
    function Finalizar(AParent: iModelVenda): iModelVendaMetodosFinalizar;
  end;

implementation

{ TModelVendaMetodosFactory }

function TModelVendaMetodosFactory.Abrir(AParent: iModelVenda)    : iModelVendaMetodosAbrir;
begin
  Result := TModelVendaMetodosAbrir.New(AParent);
end;

constructor TModelVendaMetodosFactory.Create;
begin

end;

destructor TModelVendaMetodosFactory.Destroy;
begin

  inherited;
end;

function TModelVendaMetodosFactory.Finalizar(AParent: iModelVenda): iModelVendaMetodosFinalizar;
begin
  Result := TModelVendaMetodosFinalizar.New(AParent);
end;

class function TModelVendaMetodosFactory.New: iModelVendaMetodosFactory;
begin
  Result := Self.Create;
end;

function TModelVendaMetodosFactory.Pagar(AParent: iModelVenda)    : iModelVendaMetodosPagar;
begin
  Result := TModelVendaMetodosPagar.New(AParent);
end;

end.
