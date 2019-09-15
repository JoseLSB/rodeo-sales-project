unit MFichas.Model.Permissoes.Interfaces;

interface

uses
  MFichas.Model.Entidade.USUARIOPERMISSOES,

  ORMBR.Container.ObjectSet.Interfaces;

type
  iModelPermissoes       = interface;
  iModelPermissoesEditar = interface;
  iModelPermissoesLista  = interface;

  iModelPermissoes = interface
    ['{10B0BC27-5241-4CDF-A08A-4A82EF6C97DD}']
    function ListaDePermissoes: iModelPermissoesLista;
    function EditarPermissoes : iModelPermissoesEditar;
    function DAO              : iContainerObjectSet<TUSUARIOPERMISSOES>;
  end;

  iModelPermissoesEditar = interface
    ['{CCC73878-CBEE-4A28-ABDB-6A114102BE28}']
    function AbrirCaixa(ABoolean: Integer)                 : iModelPermissoesEditar;
    function FecharCaixa(ABoolean: Integer)                : iModelPermissoesEditar;
    function Suprimento(ABoolean: Integer)                 : iModelPermissoesEditar;
    function Sangria(ABoolean: Integer)                    : iModelPermissoesEditar;
    function CadastrarProdutos(ABoolean: Integer)          : iModelPermissoesEditar;
    function CadastrarGrupos(ABoolean: Integer)            : iModelPermissoesEditar;
    function CadastrarUsuarios(ABoolean: Integer)          : iModelPermissoesEditar;
    function AcessarRelatorios(ABoolean: Integer)          : iModelPermissoesEditar;
    function AcessarConfiguracoes(ABoolean: Integer)       : iModelPermissoesEditar;
    function ExcluirProdutosPosImpressao(ABoolean: Integer): iModelPermissoesEditar;
    function Executar                                      : iModelPermissoesEditar;
    function &End                                          : iModelPermissoes;
  end;

  iModelPermissoesLista = interface
    ['{2A53116B-5568-444E-B011-04B74238D1E8}']
    function AbrirCaixa                 : Integer;
    function FecharCaixa                : Integer;
    function Suprimento                 : Integer;
    function Sangria                    : Integer;
    function CadastrarProdutos          : Integer;
    function CadastrarGrupos            : Integer;
    function CadastrarUsuarios          : Integer;
    function AcessarRelatorios          : Integer;
    function AcessarConfiguracoes       : Integer;
    function ExcluirProdutosPosImpressao: Integer;
    function &End                       : iModelPermissoes;
  end;

implementation

end.
