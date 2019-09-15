unit MFichas.Controller.Utils;

interface

uses
  FMX.TabControl,

  MaykoFichas.View.Principal,
  MaykoFichas.View.Cadastros.Produtos;

type
  TUtils = class
    class procedure MudarAba(ATabControl: TTabControl; ATypeTabs: TTypeTabs ; AProximaTabItem: TTabItem);
  end;

implementation

{ TUtils }

class procedure TUtils.MudarAba(ATabControl: TTabControl; ATypeTabs: TTypeTabs;
  AProximaTabItem: TTabItem);
begin
  ATabControl.ActiveTab := AProximaTabItem;
  FTabs                 := ATypeTabs;
end;

end.
