unit MFichas.Model.Venda.Interfaces;

interface

uses
  MFichas.Model.Item.Interfaces,
  MFichas.Model.Caixa.Interfaces,
  MFichas.Model.Entidade.VENDA,
  MFichas.Model.Pagamento.Interfaces,

  ORMBR.Container.ObjectSet.Interfaces;

type
  iModelVenda                 = interface;
  iModelVendaMetodos          = interface;
  iModelVendaMetodosAbrir     = interface;
  iModelVendaMetodosPagar     = interface;
  iModelVendaMetodosFinalizar = interface;

  iModelVenda = interface
    ['{CB5AE15E-1BC5-4CF8-B5C4-CD5F77DBCC4D}']
    function SetState(AState: iModelVendaMetodos): iModelVenda;
    function Metodos                    : iModelVendaMetodos;
    function Entidade(AEntidade: TVENDA): iModelVenda; overload;
    function Entidade                   : TVENDA; overload;
    function Caixa                      : iModelCaixa;
    function Item                       : iModelItem;
    function Pagamento                  : iModelPagamento;
    function DAO                        : iContainerObjectSet<TVENDA>;
  end;

  iModelVendaMetodos = interface
    ['{07EB681F-CEF2-486B-A9E9-910A7DA7F507}']
    function Abrir    : iModelVendaMetodosAbrir;
    function Pagar    : iModelVendaMetodosPagar;
    function Finalizar: iModelVendaMetodosFinalizar;
    function &End     : iModelVenda;
  end;

  iModelVendaMetodosAbrir = interface
    ['{FD1A0630-4CA0-4A2D-90CD-2B24FC1483F3}']
    function Executar: iModelVendaMetodosAbrir;
    function &End    : iModelVendaMetodos;
  end;

  iModelVendaMetodosPagar = interface
    ['{75E0001E-4A9C-49E2-AB56-FC9349AE20A0}']
    function Executar: iModelVendaMetodosPagar;
    function &End    : iModelVendaMetodos;
  end;

  iModelVendaMetodosFinalizar = interface
    ['{34E97BB4-A513-4F5C-BEF7-1636457DE4AE}']
    function Executar: iModelVendaMetodosFinalizar;
    function &End    : iModelVendaMetodos;
  end;

implementation

end.
