unit MFichas.Model.Impressao.Caixa;

interface

uses
  MFichas.Model.Impressao.Interfaces, MFichas.Model.Impressao.Caixa.Fechamento;

type
  TModelImpressaoCaixa = class(TInterfacedObject, iModelImpressaoCaixa)
  private
    [weak]
    FParent: iModelImpressao;
    constructor Create(AParent: iModelImpressao);
  public
    destructor Destroy; override;
    class function New(AParent: iModelImpressao): iModelImpressaoCaixa;
    function Fechamento: iModelImpressaoCaixaFechamento;
    function &End      : iModelImpressao;
  end;

implementation

{ TModelImpressaoCaixa }

function TModelImpressaoCaixa.&End: iModelImpressao;
begin
  Result := FParent;
end;

constructor TModelImpressaoCaixa.Create(AParent: iModelImpressao);
begin
  FParent := AParent;
end;

destructor TModelImpressaoCaixa.Destroy;
begin

  inherited;
end;

function TModelImpressaoCaixa.Fechamento: iModelImpressaoCaixaFechamento;
begin
  Result := TModelImpressaoCaixaMetodosFechamento.New(Self);
end;

class function TModelImpressaoCaixa.New(AParent: iModelImpressao): iModelImpressaoCaixa;
begin
  Result := Self.Create(AParent);
end;

end.
