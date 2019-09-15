unit MFichas.Controller.Types;

interface

type
  TEvDoClickConfirm = procedure(Sender: TObject) of object;
  TEvDoClickCancel  = procedure(Sender: TObject) of object;

  TTypeStatusCaixa        = (scFechado, scAberto);
  TTypeOperacoesCaixa     = (ocSangria, ocSuprimento);
  TTypeTipoVenda          = (tvCancelamento, tvVenda, tvDevolucao);
  TTypeStatusVenda        = (svFechada, svAberta, svCancelada, svDevolvida);
  TTypeTipoPagamento      = (tpDinheiro, tpCartaoDebito, tpCartaoCredito);
  TTypeStatusPagamento    = (spEstornado, spProcessado);
  TTypeStatusAtivoInativo = (saiInativo, saiAtivo);

  TTypeTipoUsuario        = (tuCaixa, tuFiscal, tuGerente);

  TTypePermissoesUsuario  = (
                              puAbrirCaixa,
                              puFecharCaixa,
                              puSuprimentoCaixa,
                              puSangriaCaixa,
                              puCadastrarProdutos,
                              puCadastrarGrupos,
                              puCadastrarUsuarios,
                              puAcessarRelatorios,
                              puAcessarConfiguracoes,
                              puExcluirProdutosPosImpressao
                            );

  TTypeTipoPedido = (tpDevolucao, tpNovoPedido);

implementation

end.
