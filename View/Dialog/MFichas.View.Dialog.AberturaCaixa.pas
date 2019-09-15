unit MFichas.View.Dialog.AberturaCaixa;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Edit,
  FMX.Controls.Presentation,
  FMX.Layouts;

type
  TFrameViewAberturaCaixa = class(TFrame)
    LayoutPrincipal: TLayout;
    RectanglePrincipal: TRectangle;
    LayoutRectangleTop: TLayout;
    LabelTitulo: TLabel;
    LayoutRectangleClient: TLayout;
    LabelValor: TLabel;
    EditValor: TEdit;
    LayoutRectangleBottom: TLayout;
    LayoutDireita: TLayout;
    RoundRectBotaoConfirmar: TRoundRect;
    LabelBotaoConfirmar: TLabel;
    LayoutEsquerda: TLayout;
    RoundRectBotaoCancelar: TRoundRect;
    LabelBotaoCancelar: TLabel;
    RectangleSombra: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfigurarTamanhoDoModal(AParent: TForm);
  end;

implementation

{$R *.fmx}

{ TFrameViewAberturaCaixa }

procedure TFrameViewAberturaCaixa.ConfigurarTamanhoDoModal(AParent: TForm);
begin
  Self.Align                             := TAlignLayout.Contents;
  Self.Visible                           := False;
  Self.Parent                            := AParent;
  Self.RectanglePrincipal.Margins.Top    := AParent.Height / 3.5;
  Self.RectanglePrincipal.Margins.Bottom := AParent.Height / 3.5;
  Self.RectanglePrincipal.Margins.Left   := AParent.Width  / 10;
  Self.RectanglePrincipal.Margins.Right  := AParent.Width  / 10;
  Self.Visible                           := True;
end;

end.
