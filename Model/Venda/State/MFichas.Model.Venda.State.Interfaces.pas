unit MFichas.Model.Venda.State.Interfaces;

interface

uses
  MFichas.Model.Venda.Interfaces;

type
  iModelVendaStateFactory = interface
    ['{01129A4D-918B-4E96-ACB8-565A35F8089F}']
    function Aberta : iModelVendaMetodos;
    function Pagando: iModelVendaMetodos;
    function Fechada: iModelVendaMetodos;
  end;

implementation

end.
