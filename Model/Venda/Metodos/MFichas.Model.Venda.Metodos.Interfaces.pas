unit MFichas.Model.Venda.Metodos.Interfaces;

interface

uses
  MFichas.Model.Venda.Interfaces;

type
  iModelVendaMetodosFactory = interface
    ['{7DE3B610-AFF6-4DEF-B26D-96C06BDC6D77}']
    function Abrir(AParent: iModelVenda)    : iModelVendaMetodosAbrir;
    function Pagar(AParent: iModelVenda)    : iModelVendaMetodosPagar;
    function Finalizar(AParent: iModelVenda): iModelVendaMetodosFinalizar;
  end;

implementation

end.
