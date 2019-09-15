unit MFichas.Model.Impressao;

interface

uses
  MFichas.Model.Impressao.Interfaces, MFichas.Model.Impressao.Caixa;

type
  TModelImpressao = class(TInterfacedObject, iModelImpressao)
  private
    constructor Create;
  public
    destructor Destroy; override;
    class function New: iModelImpressao;
    function Caixa: iModelImpressaoCaixa;
  end;

implementation

{ TModelImpressao }

function TModelImpressao.Caixa: iModelImpressaoCaixa;
begin
  Result := TModelImpressaoCaixa.New(Self);
end;

constructor TModelImpressao.Create;
begin

end;

destructor TModelImpressao.Destroy;
begin

  inherited;
end;

class function TModelImpressao.New: iModelImpressao;
begin
  Result := Self.Create;
end;

end.
