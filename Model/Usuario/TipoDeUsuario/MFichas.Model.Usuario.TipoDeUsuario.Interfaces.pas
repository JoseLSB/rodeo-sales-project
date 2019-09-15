unit MFichas.Model.Usuario.TipoDeUsuario.Interfaces;

interface

uses
  MFichas.Model.Usuario.Interfaces;

type
  iModelUsuarioTipoDeUsuarioFactory = interface
    ['{C6BB17C3-00DF-47B3-9734-A0AD664A174C}']
    function Caixa(AParent: iModelUsuario)  : iModelUsuarioMetodos;
    function Fiscal(AParent: iModelUsuario) : iModelUsuarioMetodos;
    function Gerente(AParent: iModelUsuario): iModelUsuarioMetodos;
  end;

implementation

end.
