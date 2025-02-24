object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gerenciamento de Cliente'
  ClientHeight = 509
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 32
    Top = 11
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 159
    Top = 114
    Width = 36
    Height = 15
    Caption = 'I.B.G.E.'
  end
  object Label3: TLabel
    Left = 32
    Top = 63
    Width = 132
    Height = 15
    Caption = 'C.N.P.J. - (F3 - Pesquisar)'
  end
  object Label4: TLabel
    Left = 32
    Top = 114
    Width = 113
    Height = 15
    Caption = 'CEP - (F3 - Pesquisar)'
  end
  object Label5: TLabel
    Left = 32
    Top = 166
    Width = 62
    Height = 15
    Caption = 'Logradouro'
  end
  object Label6: TLabel
    Left = 32
    Top = 217
    Width = 43
    Height = 15
    Caption = 'Latitude'
  end
  object Label7: TLabel
    Left = 176
    Top = 217
    Width = 54
    Height = 15
    Caption = 'Longitude'
  end
  object Label8: TLabel
    Left = 271
    Top = 166
    Width = 14
    Height = 15
    Caption = 'UF'
  end
  object Label9: TLabel
    Left = 303
    Top = 166
    Width = 37
    Height = 15
    Caption = 'Cidade'
  end
  object btnNovo: TButton
    Left = 32
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 0
    OnClick = btnNovoClick
  end
  object EditNome: TEdit
    Left = 32
    Top = 32
    Width = 320
    Height = 23
    Enabled = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 32
    Top = 272
    Width = 404
    Height = 120
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object editEndereco: TEdit
    Left = 32
    Top = 185
    Width = 233
    Height = 23
    Enabled = False
    TabOrder = 3
  end
  object editLatitude: TEdit
    Left = 32
    Top = 235
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 4
  end
  object editLongitude: TEdit
    Left = 176
    Top = 235
    Width = 121
    Height = 23
    Enabled = False
    TabOrder = 5
  end
  object EditIBGE: TEdit
    Left = 159
    Top = 133
    Width = 75
    Height = 23
    Enabled = False
    TabOrder = 6
  end
  object btnEditar: TButton
    Left = 199
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 7
    OnClick = btnEditarClick
  end
  object btnSalvar: TButton
    Left = 280
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 8
    OnClick = btnSalvarClick
  end
  object BtnExcluir: TButton
    Left = 361
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 9
    OnClick = BtnExcluirClick
  end
  object btnCancelar: TButton
    Left = 118
    Top = 398
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object Button6: TButton
    Left = 361
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 11
    OnClick = Button6Click
  end
  object rgImpressao: TRadioGroup
    Left = 32
    Top = 429
    Width = 233
    Height = 52
    Caption = 'Impress'#227'o'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Selecionado')
    TabOrder = 12
  end
  object editCNPJ: TEdit
    Left = 32
    Top = 84
    Width = 136
    Height = 23
    Enabled = False
    TabOrder = 13
    OnKeyDown = editCNPJKeyDown
  end
  object editCep: TEdit
    Left = 32
    Top = 133
    Width = 113
    Height = 23
    Enabled = False
    TabOrder = 14
    OnKeyDown = editCepKeyDown
  end
  object editUF: TEdit
    Left = 271
    Top = 185
    Width = 26
    Height = 23
    Enabled = False
    TabOrder = 15
  end
  object editCidade: TEdit
    Left = 303
    Top = 185
    Width = 90
    Height = 23
    Enabled = False
    TabOrder = 16
  end
  object DataSource1: TDataSource
    DataSet = MemTable1
    Left = 368
    Top = 96
  end
  object MemTable1: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 360
    Top = 24
    object MemTable1Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object MemTable1Endereco: TStringField
      FieldName = 'Endereco'
      Size = 250
    end
    object MemTable1CNPJ: TStringField
      FieldName = 'CNPJ'
    end
    object MemTable1IBGE: TStringField
      FieldName = 'IBGE'
      Size = 10
    end
    object MemTable1Latitude: TStringField
      FieldName = 'Latitude'
      Size = 100
    end
    object MemTable1Longitude: TStringField
      FieldName = 'Longitude'
      Size = 100
    end
    object MemTable1UF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object MemTable1Cidade: TStringField
      FieldName = 'Cidade'
    end
    object MemTable1CEP: TStringField
      FieldName = 'CEP'
      Size = 15
    end
  end
  object frxReport1: TfrxReport
    Version = '2022.2.7'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45709.348267500000000000
    ReportOptions.LastChange = 45709.618689895830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 376
    Top = 224
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 130.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object frxDBDataset1Nome: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 42.795300000000000000
        Top = 113.385900000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        DataField = 'Nome'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."Nome"]')
      end
      object frxDBDataset1CNPJ: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 40.574830000000000000
        Top = 162.519790000000000000
        Width = 158.740260000000000000
        Height = 18.897650000000000000
        DataField = 'CNPJ'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."CNPJ"]')
      end
      object frxDBDataset1IBGE: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 230.551330000000000000
        Top = 158.740260000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DataField = 'IBGE'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."IBGE"]')
      end
      object frxDBDataset1Endereco: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 40.574830000000000000
        Top = 215.433210000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        DataField = 'Endereco'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."Endereco"]')
      end
      object frxDBDataset1Latitude: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 41.795300000000000000
        Top = 321.260050000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DataField = 'Latitude'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."Latitude"]')
      end
      object frxDBDataset1Longitude: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 162.519790000000000000
        Top = 321.260050000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DataField = 'Longitude'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."Longitude"]')
      end
      object Date: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 609.842920000000000000
        Top = 56.692950000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          '[Date]')
      end
      object Memo1: TfrxMemoView
        AllowVectorExport = True
        Left = 43.574830000000000000
        Top = 90.708720000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Nome')
      end
      object Memo2: TfrxMemoView
        AllowVectorExport = True
        Left = 41.574830000000000000
        Top = 139.842610000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'CNPJ')
      end
      object Memo3: TfrxMemoView
        AllowVectorExport = True
        Left = 230.551330000000000000
        Top = 136.063080000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'C'#243'digo IBGE')
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 41.574830000000000000
        Top = 192.756030000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Logradouro')
      end
      object Memo5: TfrxMemoView
        AllowVectorExport = True
        Left = 41.574830000000000000
        Top = 294.803340000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Latitude')
      end
      object Memo6: TfrxMemoView
        AllowVectorExport = True
        Left = 162.519790000000000000
        Top = 294.803340000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Longitude')
      end
      object frxDBDataset1UF: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 41.574830000000000000
        Top = 260.787570000000000000
        Width = 15.118120000000000000
        Height = 18.897650000000000000
        DataField = 'UF'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."UF"]')
      end
      object frxDBDataset1Cidade: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 162.519790000000000000
        Top = 260.787570000000000000
        Width = 158.740260000000000000
        Height = 18.897650000000000000
        DataField = 'Cidade'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."Cidade"]')
      end
      object Memo7: TfrxMemoView
        AllowVectorExport = True
        Left = 41.574830000000000000
        Top = 238.110390000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Estado')
      end
      object Memo8: TfrxMemoView
        AllowVectorExport = True
        Left = 162.519790000000000000
        Top = 238.110390000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Cidade')
      end
      object frxDBDataset1CEP: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 343.937230000000000000
        Top = 260.787570000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DataField = 'CEP'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Frame.Typ = []
        Memo.UTF8W = (
          '[frxDBDataset1."CEP"]')
      end
      object Memo9: TfrxMemoView
        AllowVectorExport = True
        Left = 343.937230000000000000
        Top = 238.110390000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'CEP')
      end
      object Memo10: TfrxMemoView
        AllowVectorExport = True
        Left = 555.590910000000000000
        Top = 56.692950000000000000
        Width = 49.133890000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          'Data:')
      end
      object Page: TfrxMemoView
        IndexTag = 1
        AllowVectorExport = True
        Left = 623.622450000000000000
        Top = 377.953000000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Frame.Typ = []
        Memo.UTF8W = (
          '[Page#]')
      end
      object Memo11: TfrxMemoView
        AllowVectorExport = True
        Left = 75.590600000000000000
        Top = 49.133890000000000000
        Width = 468.661720000000000000
        Height = 26.456710000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'Cadastro de Cliente')
        ParentFont = False
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = MemTable1
    BCDToCurrency = False
    DataSetOptions = []
    Left = 400
    Top = 160
  end
end
