unit MFichas.Model.Caixa.State.Fechado;

interface

uses
  System.SysUtils,

  MFichas.Model.Caixa.Interfaces;

type
  TModelCaixaStateFechado = class(TInterfacedObject, iModelCaixaMetodos)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelCaixaMetodos;
    function Abrir     : iModelCaixaMetodosAbrir;
    function Fechar    : iModelCaixaMetodosFechar;
    function Suprimento: iModelCaixaMetodosSuprimento;
    function Sangria   : iModelCaixaMetodosSangria;
    function &End      : iModelCaixa;
  end;

implementation

{ TModelCaixaStateFechado }

function TModelCaixaStateFechado.Abrir: iModelCaixaMetodosAbrir;
begin

end;

function TModelCaixaStateFechado.&End: iModelCaixa;
begin

end;

constructor TModelCaixaStateFechado.Create;
begin

end;

destructor TModelCaixaStateFechado.Destroy;
begin

  inherited;
end;

function TModelCaixaStateFechado.Fechar: iModelCaixaMetodosFechar;
begin
  raise Exception.Create(
    'Este caixa já encontrasse fechado.'
  );
end;

class function TModelCaixaStateFechado.New: iModelCaixaMetodos;
begin
  Result := Self.Create;
end;

function TModelCaixaStateFechado.Sangria: iModelCaixaMetodosSangria;
begin
  raise Exception.Create(
    'Este caixa encontrasse fechado.' + sLineBreak +
    'Não é possível efetuar uma Sangria.'
  );
end;

function TModelCaixaStateFechado.Suprimento: iModelCaixaMetodosSuprimento;
begin
  raise Exception.Create(
    'Este caixa encontrasse fechado.' + sLineBreak +
    'Não é possível efetuar um Suprimento.'
  );
end;

end.
