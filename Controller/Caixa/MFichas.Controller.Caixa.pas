unit MFichas.Controller.Caixa;

interface

uses
  MFichas.Controller.Caixa.Interfaces,
  MFichas.Controller.Caixa.Metodos;

type
  TControllerCaixa = class(TInterfacedObject, iControllerCaixa)
  private
    FMetodos: iControllerCaixaMetodos;
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iControllerCaixa;
    function Metodos: iControllerCaixaMetodos;
  end;

implementation

{ TControllerCaixa }

constructor TControllerCaixa.Create;
begin
  FMetodos := TControllerCaixaMetodos.New(Self);
end;

destructor TControllerCaixa.Destroy;
begin

  inherited;
end;

function TControllerCaixa.Metodos: iControllerCaixaMetodos;
begin
  Result := FMetodos;
end;

class function TControllerCaixa.New: iControllerCaixa;
begin
  Result := Self.Create;
end;

end.
