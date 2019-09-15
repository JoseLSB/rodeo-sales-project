unit MFichas.Model.Item.Metodos.Interfaces;

interface

uses
  MFichas.Model.Item.Interfaces, MFichas.Model.Venda.Interfaces;

type
  iModelItemMetodosFactory = interface
    ['{3D0158D6-E25D-4E78-A76E-39C2815FAFFD}']
    function Vender(AParent: iModelItem; AVenda: iModelVenda)  : iModelItemMetodosVender;
    function Cancelar(AParent: iModelItem): iModelItemMetodosCancelar;
    function Devolver(AParent: iModelItem; AVenda: iModelVenda): iModelItemMetodosDevolver;
  end;

implementation

end.
