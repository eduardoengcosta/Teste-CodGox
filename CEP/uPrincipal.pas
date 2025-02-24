unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls,
  System.Net.HttpClient, System.Net.HttpClientComponent, System.JSON, frxClass,
  frxDBSet, Vcl.Mask, Vcl.ExtCtrls, System.RegularExpressions;

type
  TTipoCadastro = (tcCadastro, tcEditar);

type
  TFormPrincipal = class(TForm)
    btnNovo: TButton;
    EditNome: TEdit;
    DataSource1: TDataSource;
    MemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    editEndereco: TEdit;
    editLatitude: TEdit;
    editLongitude: TEdit;
    EditIBGE: TEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btnEditar: TButton;
    btnSalvar: TButton;
    BtnExcluir: TButton;
    btnCancelar: TButton;
    Button6: TButton;
    rgImpressao: TRadioGroup;
    MemTable1Nome: TStringField;
    MemTable1Endereco: TStringField;
    MemTable1CNPJ: TStringField;
    MemTable1IBGE: TStringField;
    editCNPJ: TEdit;
    editCep: TEdit;
    MemTable1Latitude: TStringField;
    MemTable1Longitude: TStringField;
    Label8: TLabel;
    editUF: TEdit;
    editCidade: TEdit;
    Label9: TLabel;
    MemTable1UF: TStringField;
    MemTable1Cidade: TStringField;
    MemTable1CEP: TStringField;
    procedure editCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure editCepKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnExcluirClick(Sender: TObject);
  private
    procedure ValidaCampos;
    procedure LimpaCampos;
    procedure AtualizaBotoes;
    procedure BuscarCEP(const ACEP: string);
    procedure BuscarCNPJ(const ACNPJ: string);
    procedure BuscarIBGE(const AUF: string);
    procedure CrudCliente(ATipo: TTipoCadastro);
    procedure SalvarCliente;
    procedure ExcluirCliente;
    procedure ImprimirTodosRegistros;
    procedure ImprimirSomenteSelecionado;
    function  RetornaCodigoIBGE(const jsonData, nomeCidade: string): string;
    procedure MemTableToEdit;

    function SomenteNumeros(const Texto: string): string;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

procedure TFormPrincipal.CrudCliente(ATipo: TTipoCadastro);
begin

  case ATipo of
    tcCadastro: MemTable1.Append;
    tcEditar: begin
                if MemTable1.IsEmpty then
                begin
                  ShowMessage('Nenhum registro selecionado.');
                  Exit;
                end;
                MemTable1.Edit;
              end;
  end;
  ValidaCampos;
  LimpaCampos;
  AtualizaBotoes;

end;

procedure TFormPrincipal.editCepKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    BuscarCEP(SomenteNumeros(editCep.Text));
    Key := 0;
  end;

end;

procedure TFormPrincipal.editCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    BuscarCNPJ(SomenteNumeros(editCNPJ.Text));
    Key := 0;
  end;
end;

procedure TFormPrincipal.ExcluirCliente;
begin
  if MemTable1.IsEmpty then
  begin
    ShowMessage('Nenhum registro selecionado.');
    Exit;
  end;

  MemTable1.Delete;
  ShowMessage('Cliente excluido com sucesso.');
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  MemTable1.CreateDataSet;
end;

procedure TFormPrincipal.BuscarCEP(const ACEP: string);
var
  LHttpClient: THTTPClient;
  LResponse: IHTTPResponse;
  LJSON, LJSONLocation, LJSONCoordinates: TJSONObject;
begin
  LHttpClient := THTTPClient.Create;
  try
    LResponse := LHttpClient.Get('https://brasilapi.com.br/api/cep/v2/' + ACEP);
    if LResponse.StatusCode = 200 then
    begin
      LJSON := TJSONObject.ParseJSONValue(LResponse.ContentAsString) as TJSONObject;
      try
        if Assigned(LJSON) then
        begin
          EditEndereco.Text := LJSON.GetValue<string>('street', '');
          editUF.Text := LJSON.GetValue<string>('state', '');
          EditCidade.Text := LJSON.GetValue<string>('city', '');

          BuscarIBGE(editUF.Text);
          if LJSON.TryGetValue<TJSONObject>('location', LJSONLocation) then
          begin
            if LJSONLocation.TryGetValue<TJSONObject>('coordinates', LJSONCoordinates) then
            begin
              EditLatitude.Text := LJSONCoordinates.GetValue<string>('latitude', '');
              EditLongitude.Text := LJSONCoordinates.GetValue<string>('longitude', '');
            end;
          end;
        end;
      finally
        LJSON.Free;
      end;
    end
    else
      ShowMessage('Erro ao buscar o CEP. C�digo: ' + LResponse.StatusCode.ToString);
  finally
    LHttpClient.Free;
  end;
end;

procedure TFormPrincipal.BuscarCNPJ(const ACNPJ: string);
var
  LHttpClient: THTTPClient;
  LResponse: IHTTPResponse;
  LJSON: TJSONObject;
begin
  LHttpClient := THTTPClient.Create;
  try
    LResponse := LHttpClient.Get('https://brasilapi.com.br/api/cnpj/v1/' + ACNPJ);
    if LResponse.StatusCode = 200 then
    begin
      LJSON := TJSONObject.ParseJSONValue(LResponse.ContentAsString) as TJSONObject;
      EditNome.Text := LJSON.GetValue('razao_social').Value;
      editCep.Text  := LJSON.GetValue('cep').Value;
    end
    else
      ShowMessage('Erro ao buscar o CNPJ.');
  finally
    LHttpClient.Free;
  end;

end;

procedure TFormPrincipal.BuscarIBGE(const AUF: string);
var
  LHttpClient: THTTPClient;
  LResponse: IHTTPResponse;
  LJSON: TJSONObject;
begin
  LHttpClient := THTTPClient.Create;
  try
    LResponse := LHttpClient.Get('https://brasilapi.com.br/api/ibge/municipios/v1/'+
                      AUF+'?providers=dados-abertos-br,gov,wikipedia');
    if LResponse.StatusCode = 200 then
      EditIBGE.Text := RetornaCodigoIBGE(LResponse.ContentAsString, AnsiUpperCase(editCidade.Text))
    else
      ShowMessage('Erro ao buscar o c�digo IBGE.');
  finally
    LHttpClient.Free;
  end;

end;

procedure TFormPrincipal.btnNovoClick(Sender: TObject);
begin
  CrudCliente(tcCadastro);
end;

procedure TFormPrincipal.btnEditarClick(Sender: TObject);
begin
  CrudCliente(tcEditar);
  MemTableToEdit;
end;

procedure TFormPrincipal.BtnExcluirClick(Sender: TObject);
begin
  ExcluirCliente;
end;

procedure TFormPrincipal.btnSalvarClick(Sender: TObject);
begin
  SalvarCliente;
end;

procedure TFormPrincipal.AtualizaBotoes;
begin
  btnNovo.Enabled     := not (MemTable1.State in [dsInsert, dsEdit]);
  btnEditar.Enabled   := not (MemTable1.State in [dsInsert, dsEdit]);
  btnSalvar.Enabled   := MemTable1.State in [dsInsert, dsEdit];
  btnExcluir.Enabled  := not (MemTable1.State in [dsInsert, dsEdit]);
  btnCancelar.Enabled := MemTable1.State in [dsInsert, dsEdit];
end;

procedure TFormPrincipal.btnCancelarClick(Sender: TObject);
begin
  if MemTable1.State in [dsEdit, dsInsert] then
    MemTable1.Cancel;

  ValidaCampos;
  LimpaCampos;
  AtualizaBotoes;
end;

procedure TFormPrincipal.Button6Click(Sender: TObject);
begin
  case rgImpressao.ItemIndex of
    0: ImprimirTodosRegistros;
    1: ImprimirSomenteSelecionado;
  end;
end;

procedure TFormPrincipal.ImprimirSomenteSelecionado;
var
  TempMemTable: TFDMemTable;
begin
  if MemTable1.IsEmpty then
  begin
    ShowMessage('Nenhum registro selecionado.');
    Exit;
  end;
  TempMemTable := TFDMemTable.Create(nil);
  try
    // Criar estrutura da tabela tempor�ria
    TempMemTable.FieldDefs.Assign(MemTable1.FieldDefs);
    TempMemTable.CreateDataSet;
    TempMemTable.Open;
    // Copiar apenas o registro selecionado
    TempMemTable.Append;
    TempMemTable.CopyRecord(MemTable1);
    TempMemTable.Post;
    // Conectar ao FastReport
    frxDBDataset1.DataSet := TempMemTable;
    frxReport1.ShowReport;
  finally
    FreeAndNil(TempMemTable);
  end;
end;

procedure TFormPrincipal.ImprimirTodosRegistros;
begin
  if MemTable1.IsEmpty then
  begin
    ShowMessage('Nenhum registro encontrado.');
    Exit;
  end;

  frxDBDataset1.DataSet := MemTable1;
  frxReport1.ShowReport;
end;

procedure TFormPrincipal.LimpaCampos;
begin
  editNome.Text := '';
  editEndereco.Text := '';
  editLatitude.Text := '';
  editLongitude.Text := '';
  EditIBGE.Text := '';
  editCNPJ.Text := '';
  editCep.Text := '';
  editUF.Text := '';
  editCidade.Text := '';
end;

procedure TFormPrincipal.MemTableToEdit;
begin
  EditNome.Text       := MemTable1.FieldByName('Nome').AsString;
  EditEndereco.Text   := MemTable1.FieldByName('Endereco').AsString;
  editCep.Text        := MemTable1.FieldByName('CEP').AsString;
  EditCNPJ.Text       := MemTable1.FieldByName('CNPJ').AsString;
  EditIBGE.Text       := MemTable1.FieldByName('IBGE').AsString;
  EditLatitude.Text   := MemTable1.FieldByName('Latitude').AsString;
  EditLongitude.Text  := MemTable1.FieldByName('Longitude').AsString;
  editUF.Text         := MemTable1.FieldByName('UF').AsString;
  editCidade.Text     := MemTable1.FieldByName('Cidade').AsString;

end;

function TFormPrincipal.RetornaCodigoIBGE(const jsonData, nomeCidade: string): string;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  i: Integer;
begin
  Result := '';
  JSONArray := TJSONObject.ParseJSONValue(jsonData) as TJSONArray;
  try
    if Assigned(JSONArray) then
    begin
      for i := 0 to JSONArray.Count - 1 do
      begin
        JSONObject := JSONArray.Items[i] as TJSONObject;
        if SameText(JSONObject.GetValue('nome').Value, nomeCidade) then
        begin
          Result := JSONObject.GetValue('codigo_ibge').Value;
          Exit;
        end;
      end;
    end;
  finally
    JSONArray.Free;
  end;

end;

procedure TFormPrincipal.SalvarCliente;
begin

  MemTable1.FieldByName('Nome').AsString      := EditNome.Text;
  MemTable1.FieldByName('Endereco').AsString  := EditEndereco.Text;
  MemTable1.FieldByName('CNPJ').AsString      := EditCNPJ.Text;
  MemTable1.FieldByName('IBGE').AsString      := EditIBGE.Text;
  MemTable1.FieldByName('CEP').AsString       := editCep.Text;
  MemTable1.FieldByName('Latitude').AsString  := EditLatitude.Text;
  MemTable1.FieldByName('Longitude').AsString := EditLongitude.Text;
  MemTable1.FieldByName('UF').AsString        := editUF.Text;
  MemTable1.FieldByName('Cidade').AsString    := editCidade.Text;

  MemTable1.Post;

  ValidaCampos;
  LimpaCampos;
  AtualizaBotoes;
end;

function TFormPrincipal.SomenteNumeros(const Texto: string): string;
begin
  Result := Trim(TRegEx.Replace(Texto, '\D', ''));
end;

procedure TFormPrincipal.ValidaCampos;
begin
  EditNome.Enabled      := MemTable1.State in [dsInsert, dsEdit];
  editEndereco.Enabled  := MemTable1.State in [dsInsert, dsEdit];
  editLatitude.Enabled  := MemTable1.State in [dsInsert, dsEdit];
  editLongitude.Enabled := MemTable1.State in [dsInsert, dsEdit];
  EditIBGE.Enabled      := MemTable1.State in [dsInsert, dsEdit];
  editCNPJ.Enabled      := MemTable1.State in [dsInsert, dsEdit];
  editCep.Enabled       := MemTable1.State in [dsInsert, dsEdit];
  editCidade.Enabled    := MemTable1.State in [dsInsert, dsEdit];
  editUF.Enabled        := MemTable1.State in [dsInsert, dsEdit];
end;

end.
