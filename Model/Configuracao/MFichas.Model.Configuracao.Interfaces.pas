unit MFichas.Model.Configuracao.Interfaces;

interface

uses
  System.Generics.Collections,

  MFichas.Model.Entidade.CONFIGURACOES,

  ORMBR.Container.ObjectSet.Interfaces,
  ORMBR.Container.DataSet.Interfaces,

  FireDAC.Comp.Client;

type
  iModelConfiguracao                   = interface;
  iModelConfiguracaoMetodos            = interface;
  iModelConfiguracaoMetodosEditarView  = interface;
  iModelConfiguracaoMetodosBuscarModel = interface;
  iModelConfiguracaoMetodosBuscarView  = interface;

  iModelConfiguracao = interface
    ['{CCD68DC9-037A-4D2E-A58C-E4CEB5349B60}']
    function Metodos   : iModelConfiguracaoMetodos;
    function DAO       : iContainerObjectSet<TCONFIGURACOES>;
    function DAODataSet: iContainerDataSet<TCONFIGURACOES>;
  end;

  iModelConfiguracaoMetodos = interface
    ['{F4145C48-8209-43E8-A388-C0359E62558F}']
    function BuscarModel: iModelConfiguracaoMetodosBuscarModel;
    function EditarView : iModelConfiguracaoMetodosEditarView;
    function BuscarView : iModelConfiguracaoMetodosBuscarView;
    function &End       : iModelConfiguracao;
  end;

  iModelConfiguracaoMetodosBuscarModel = interface
    ['{070A5592-6D5D-41CC-884F-2757C8E7C9FE}']
    function Impressora: String;
    function &End      : iModelConfiguracaoMetodos;
  end;

  iModelConfiguracaoMetodosEditarView = interface
    ['{3FD6FD21-EF3A-4D8F-9785-7FCC7B097311}']
    function Impressora(AImpressora: String): iModelConfiguracaoMetodosEditarView;
    function &End                           : iModelConfiguracaoMetodos;
  end;

  iModelConfiguracaoMetodosBuscarView = interface
    ['{09CFFA6C-2D8F-4F2E-8D5F-5951BA2209F4}']
    function FDMemTable(AFDMemTable: TFDMemTable): iModelConfiguracaoMetodosBuscarView;
    function BuscarConfiguracao                  : iModelConfiguracaoMetodosBuscarView;
    function &End                                : iModelConfiguracaoMetodos;
  end;

implementation

end.
