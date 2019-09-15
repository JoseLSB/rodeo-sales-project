unit MFichas.Model.GrupoProduto.Metodos.Cadastrar;

interface

uses
  System.SysUtils,

  MFichas.Model.GrupoProduto.Interfaces,

  MFichas.Controller.Types;

type
  TModelGrupoProdutoMetodosCadastrar = class(TInterfacedObject, iModelGrupoProdutoMetodosCadastrar)
  private
    [weak]
    FParent   : iModelGrupoProduto;
    FDescricao: String;
    constructor Create(AParent: iModelGrupoProduto);
    procedure Gravar;
  public
    destructor Destroy; override;
    class function New(AParent: iModelGrupoProduto): iModelGrupoProdutoMetodosCadastrar;
    function Descricao(ADescricao: String): iModelGrupoProdutoMetodosCadastrar;
    function &End                         : iModelGrupoProdutoMetodos;
  end;

implementation

{ TModelGrupoProdutoMetodosCadastrar }

function TModelGrupoProdutoMetodosCadastrar.&End: iModelGrupoProdutoMetodos;
begin
  //TODO: IMPLEMENTAR MÉTODO DE CADASTRO DE GRUPOS.
  Result := FParent.Metodos;
  Gravar;
end;

procedure TModelGrupoProdutoMetodosCadastrar.Gravar;
begin
  FParent.Entidade.DESCRICAO := FDescricao;
  FParent.Entidade.STATUS    := Integer(saiAtivo);
  FParent.DAO.Insert(FParent.Entidade);
end;

constructor TModelGrupoProdutoMetodosCadastrar.Create(AParent: iModelGrupoProduto);
begin
  FParent := AParent;
end;

function TModelGrupoProdutoMetodosCadastrar.Descricao(
  ADescricao: String): iModelGrupoProdutoMetodosCadastrar;
begin
  Result := Self;
  if ADescricao.IsNullOrWhiteSpace(ADescricao) then
    raise Exception.Create(
      'Não é possível cadastrar um grupo sem adicioná-lo um Nome/Descrição.'
    );
  FDescricao := ADescricao.ToUpper;
end;

destructor TModelGrupoProdutoMetodosCadastrar.Destroy;
begin

  inherited;
end;

class function TModelGrupoProdutoMetodosCadastrar.New(AParent: iModelGrupoProduto): iModelGrupoProdutoMetodosCadastrar;
begin
  Result := Self.Create(AParent);
end;

end.
