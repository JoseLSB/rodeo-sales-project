unit MFichas.Model.Caixa.Metodos.Fechar;

interface

uses
  System.SysUtils,

  MFichas.Model.Caixa.Interfaces,
  MFichas.Model.Caixa.State.Factory,
  MFichas.Model.Impressao.Interfaces,
  MFichas.Model.Impressao,

  MFichas.Controller.Types;

type
  TModelCaixaMetodosFechar = class(TInterfacedObject, iModelCaixaMetodosFechar)
  private
    [weak]
    FParent         : iModelCaixa;
    FValorFechamento: Currency;
    FOperador       : String;
    FImpressao      : iModelImpressao;
    constructor Create(AParent: iModelCaixa);
    procedure Imprimir;
    procedure Gravar;
    procedure LimparEntidade;
  public
    destructor Destroy; override;
    class function New(AParent: iModelCaixa): iModelCaixaMetodosFechar;
    function SetValorFechamento(AValue: Currency): iModelCaixaMetodosFechar;
    function SetOperador(AOperador: String)      : iModelCaixaMetodosFechar;
    function &End                                : iModelCaixaMetodos;
  end;

implementation

{ TModelCaixaMetodosFechar }

function TModelCaixaMetodosFechar.&End: iModelCaixaMetodos;
begin
  //TODO: IMPLEMENTAR METODO DE FECHAR CAIXA
  Result := FParent.Metodos;

  Imprimir;
  Gravar;
end;

procedure TModelCaixaMetodosFechar.Gravar;
begin
  FParent.DAO.Modify(FParent.Entidade);
  FParent.Entidade.DATAFECHAMENTO := Now;
  FParent.Entidade.STATUS         := Integer(scFechado);
  FParent.DAO.Update(FParent.Entidade);
  FParent.SetState(TModelCaixaStateFactory.New.Fechado);

  LimparEntidade;
end;

procedure TModelCaixaMetodosFechar.Imprimir;
begin
  FImpressao
  .Caixa
    .Fechamento
      .TituloDaImpressao('FECHAMENTO DE CAIXA')
      .CodigoDoCaixa(FParent.Entidade.GUUID)
      .ExecutarImpressao
    .&End
  .&End;
end;

procedure TModelCaixaMetodosFechar.LimparEntidade;
begin
  FParent.Entidade.CleanupInstance;
  FParent.Entidade.DATAABERTURA   := StrToDate('30/12/1899');
  FParent.Entidade.DATAFECHAMENTO := StrToDate('30/12/1899');
  FParent.Entidade.DATAALTERACAO  := StrToDate('30/12/1899');
  FParent.Entidade.VALORABERTURA  := 0;
  FParent.Entidade.OPERACOES.Clear;
end;

constructor TModelCaixaMetodosFechar.Create(AParent: iModelCaixa);
begin
  FParent := AParent;
  FImpressao := TModelImpressao.New;
end;

destructor TModelCaixaMetodosFechar.Destroy;
begin

  inherited;
end;

class function TModelCaixaMetodosFechar.New(AParent: iModelCaixa): iModelCaixaMetodosFechar;
begin
  Result := Self.Create(AParent);
end;

function TModelCaixaMetodosFechar.SetOperador(
  AOperador: String): iModelCaixaMetodosFechar;
begin
  Result    := Self;
  FOperador := AOperador;
end;

function TModelCaixaMetodosFechar.SetValorFechamento(
  AValue: Currency): iModelCaixaMetodosFechar;
begin
  Result           := Self;
  FValorFechamento := AValue;
end;

end.
