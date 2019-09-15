unit MFichas.Controller.Usuario.Interfaces;

interface

uses
  MFichas.Model.Usuario.Interfaces;

type
  iControllerUsuario = interface
    ['{6468262B-22AD-4F9B-9797-C859B8EE3004}']
    function Caixa  : iModelUsuarioMetodos;
    function Fiscal : iModelUsuarioMetodos;
    function Gerente: iModelUsuarioMetodos;
  end;

implementation

end.
