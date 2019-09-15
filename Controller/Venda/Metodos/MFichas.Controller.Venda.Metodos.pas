unit MFichas.Controller.Venda.Metodos;

interface

uses
  MFichas.Controller.Venda.Interfaces,
  MFichas.Controller.Venda.Metodos.VenderItem,
  MFichas.Controller.Venda.Metodos.CancelarItem,
  MFichas.Controller.Venda.Metodos.Pagamento,
  MFichas.Controller.Venda.Metodos.DevolverItem,

  MFichas.Model.Venda.Interfaces;

type
  TControllerVendaMetodos = class(TInterfacedObject, iControllerVendaMetodos)
  private
    [weak]
    FParent   : iControllerVenda;
    FModel    : iModelVenda;
    FPagamento: iControllerVendaMetodosPagar;
    constructor Create(AParent: iControllerVenda; AModel: iModelVenda);
  public
    destructor Destroy; override;
    class function New(AParent: iControllerVenda; AModel: iModelVenda): iControllerVendaMetodos;
    function AbrirVenda      : iControllerVendaMetodos;
    function Pagar           : iControllerVendaMetodos;
    function FinalizarVenda  : iControllerVendaMetodos;
    function VenderItem      : iControllerVendaMetodosVenderItem;
    function CancelarItem    : iControllerVendaMetodosCancelarItem;
    function DevolverItem    : iControllerVendaMetodosDevolverItem;
    function EfetuarPagamento: iControllerVendaMetodosPagar;
  end;

implementation

{ TControllerVendaMetodos }

function TControllerVendaMetodos.AbrirVenda: iControllerVendaMetodos;
begin
  Result := Self;
  FModel
  .Metodos
    .Abrir
      .Executar
    .&End
  .&End;
end;

function TControllerVendaMetodos.CancelarItem: iControllerVendaMetodosCancelarItem;
begin
  Result := TControllerVendaMetodosCancelarItem.New(FParent, FModel);
end;

constructor TControllerVendaMetodos.Create(AParent: iControllerVenda; AModel: iModelVenda);
begin
  FParent    := AParent;
  FModel     := AModel;
  FPagamento := TControllerVendaMetodosPagar.New(FParent, FModel);
end;

destructor TControllerVendaMetodos.Destroy;
begin

  inherited;
end;

function TControllerVendaMetodos.DevolverItem: iControllerVendaMetodosDevolverItem;
begin
  Result := TControllerVendaMetodosDevolverItem.New(FParent, FModel);
end;

function TControllerVendaMetodos.EfetuarPagamento: iControllerVendaMetodosPagar;
begin
  Result := FPagamento;
end;

function TControllerVendaMetodos.FinalizarVenda: iControllerVendaMetodos;
begin
  Result := Self;
  FModel
  .Metodos
    .Finalizar
      .Executar
    .&End
  .&End;
end;

class function TControllerVendaMetodos.New(AParent: iControllerVenda; AModel: iModelVenda): iControllerVendaMetodos;
begin
  Result := Self.Create(AParent, AModel);
end;

function TControllerVendaMetodos.Pagar: iControllerVendaMetodos;
begin
  Result := Self;
  FModel
  .Metodos
    .Pagar
      .Executar
    .&End
  .&End;
end;

function TControllerVendaMetodos.VenderItem: iControllerVendaMetodosVenderItem;
begin
  Result := TControllerVendaMetodosVenderItem.New(FParent, FModel);
end;

end.
