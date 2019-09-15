unit MFichas.Model.Item.Metodos.Vender;

interface

uses
  System.SysUtils,

  MFichas.Model.Item.Interfaces,
  MFichas.Model.Entidade.VENDAITENS,
  MFichas.Model.Venda.Interfaces,

  MFichas.Controller.Types;

type
  TModelItemMetodosVender = class(TInterfacedObject, iModelItemMetodosVender)
  private
    [weak]
    FParent    : iModelItem;
    FVenda     : iModelVenda;
    FCodigo    : String;
    FQuantidade: Double;
    FValor     : Currency;
    constructor Create(AParent: iModelItem; AVenda: iModelVenda);
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelItem; AVenda: iModelVenda): iModelItemMetodosVender;
    function Codigo(ACodigo: String)         : iModelItemMetodosVender;
    function Quantidade(AQuantidade: Double) : iModelItemMetodosVender;
    function Valor(AValor: Currency)         : iModelItemMetodosVender;
    function &End                            : iModelItemMetodos;
  end;

implementation

{ TModelItemMetodosVender }

function TModelItemMetodosVender.Codigo(
  ACodigo: String): iModelItemMetodosVender;
begin
  Result  := Self;
  FCodigo := ACodigo;
end;

function TModelItemMetodosVender.&End: iModelItemMetodos;
begin
  //TODO: IMPLEMENTAR METODO DE VENDER ITEM
  Result := FParent.Metodos;
  Gravar;
end;

procedure TModelItemMetodosVender.Gravar;
begin
  FParent.Entidade.VENDA      := FVenda.Entidade.GUUID;
  FParent.Entidade.PRODUTO    := FCodigo;
  FParent.Entidade.QUANTIDADE := FQuantidade;
  FParent.Entidade.PRECO      := FValor;
  FParent.Entidade.TIPO       := Integer(tvVenda);
end;

constructor TModelItemMetodosVender.Create(AParent: iModelItem; AVenda: iModelVenda);
begin
  FParent := AParent;
  FVenda  := AVenda;
end;

destructor TModelItemMetodosVender.Destroy;
begin
  inherited;
end;

class function TModelItemMetodosVender.New(AParent: iModelItem; AVenda: iModelVenda): iModelItemMetodosVender;
begin
  Result := Self.Create(AParent, AVenda);
end;

function TModelItemMetodosVender.Quantidade(
  AQuantidade: Double): iModelItemMetodosVender;
begin
  Result      := Self;
  FQuantidade := AQuantidade;
end;

function TModelItemMetodosVender.Valor(
  AValor: Currency): iModelItemMetodosVender;
begin
  Result := Self;
  FValor := AValor;
end;

end.
