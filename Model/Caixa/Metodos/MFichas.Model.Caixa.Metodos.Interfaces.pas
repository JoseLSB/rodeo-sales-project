unit MFichas.Model.Caixa.Metodos.Interfaces;

interface

uses
  MFichas.Model.Caixa.Interfaces;

type
  iModelCaixaMetodosFactory = interface
    ['{430FF626-FC73-4CEE-BA4F-E98DEF26218B}']
    function CaixaMetodoAbrir(AParent: iModelCaixa)     : iModelCaixaMetodosAbrir;
    function CaixaMetodoFechar(AParent: iModelCaixa)    : iModelCaixaMetodosFechar;
    function CaixaMetodoSuprimento(AParent: iModelCaixa): iModelCaixaMetodosSuprimento;
    function CaixaMetodoSangria   (AParent: iModelCaixa): iModelCaixaMetodosSangria;
  end;

implementation

end.
