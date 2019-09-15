unit MFichas.Model.Venda.State.Factory;

interface

uses
  MFichas.Model.Venda.State.Interfaces,
  MFichas.Model.Venda.Interfaces,
  MFichas.Model.Venda.State.Abrir,
  MFichas.Model.Venda.State.Pagar,
  MFichas.Model.Venda.State.Finalizar;

type
  TModelVendaStateFactory = class(TInterfacedObject, iModelVendaStateFactory)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelVendaStateFactory;
    function Aberta : iModelVendaMetodos;
    function Pagando: iModelVendaMetodos;
    function Fechada: iModelVendaMetodos;
  end;

implementation

{ TModelVendaStateFactory }

function TModelVendaStateFactory.Aberta: iModelVendaMetodos;
begin
  Result := TModelVendaStateAbrir.New;
end;

constructor TModelVendaStateFactory.Create;
begin

end;

destructor TModelVendaStateFactory.Destroy;
begin

  inherited;
end;

function TModelVendaStateFactory.Fechada: iModelVendaMetodos;
begin
  Result := TModelVendaStateFinalizar.New;
end;

class function TModelVendaStateFactory.New: iModelVendaStateFactory;
begin
  Result := Self.Create;
end;

function TModelVendaStateFactory.Pagando: iModelVendaMetodos;
begin
  Result := TModelVendaStatePagar.New;
end;

end.
