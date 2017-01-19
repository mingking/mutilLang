unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Lang1: TLang;
    Button2: TButton;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FLang_tw :TStringList;
  public
    { Public declarations }
  end;


  TLanguage = class(TFmxObject)
  private
    FLang: string;
    FResources: TStrings;
    FOriginal: TStrings;
    FAutoSelect: Boolean;
    FFileName: string;
    FStoreInForm: Boolean;
    function GetLangStr(const Index: string): TStrings;
    procedure SetLang(const Value: string);
//    procedure SetLang(const Value: string);
//    function GetLangStr(const Index: string): TStrings;
  protected
    { vcl }
//    procedure DefineProperties(Filer: TFiler); override;
//    procedure ReadResources(Stream: TStream);
//    procedure WriteResources(Stream: TStream);
//    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddLang(const AName: string);
//    procedure LoadFromFile(const AFileName: string);
//    procedure SaveToFile(const AFileName: string);
//    property Original: TStrings read FOriginal;
    property Resources: TStrings read FResources;
    property LangStr[const Index: string]: TStrings read GetLangStr;
  published
//    property AutoSelect: Boolean read FAutoSelect write FAutoSelect default True;
//    property FileName: string read FFileName write FFileName;
//    property StoreInForm: Boolean read FStoreInForm write FStoreInForm default True;
    property Lang: string read FLang write SetLang;
  end;


var
  Form3: TForm3;

implementation

{$R *.fmx}


procedure TForm3.Button1Click(Sender: TObject);
var sTemp:string;
begin
//  Button1.Text := 'Button';
//  CheckBox1.Text := 'CheckBox';
//  Label1.Text := 'Test';
//  Caption := 'Test';
//    ShowMessage(TStrings(Lang1.Resources.Objects[ComboBox1.ItemIndex]).Text);
    ShowMessage(TStrings(Lang1.Resources.Objects[ComboBox1.ItemIndex]).Text);
    ShowMessage('MSG_INPUT_ACCT');
//    label1.text := 'Button';
    sTemp:= Lang1.Resources.Names[0];
    InputQuery( 'MSG_INPUT_PWD' , [#1 + sTemp], [''],
    procedure(const AResult: TModalResult; const AValues: array of string)
    begin
    end);
end;

procedure TForm3.Button2Click(Sender: TObject);
var Lang2 : TLanguage;
begin


  Label1.Text := FLang_tw.Values['UI_fmMain_dfAccount'];
exit;

  Lang2 := TLanguage.Create(nil);
  try
  Lang2.AddLang('en_US');
  Lang2.AddLang('zh_CN');
  Lang2.AddLang('zh_TW');

  with Lang2.LangStr['en_US'] do
  begin
    Values['Label1'] := 'label';
    Values['Button1'] := 'Button';
    Values['CheckBox1'] := 'Check box';
    Values['Test'] := 'Test';
    Values['MSG_INPUT_ACCT'] := 'input account';
    Values['MSG_INPUT_PWD'] := 'input password';
    Values['MSG_EXTRA_FUN_PWD'] := 'function 1';
  end;
  with Lang2.LangStr['zh_CN'] do
  begin
    Values['Label1'] := '標題CN';
    Values['Button1'] := '按钮';
    Values['CheckBox1'] := '复选框';
    Values['Test'] := '测试';
    Values['MSG_INPUT_ACCT'] := '輸入帳號cn';
    Values['MSG_INPUT_PWD'] := '密碼CN';
    Values['MSG_EXTRA_FUN_PWD'] := '功能CN';
  end;
  {繁体中文}
  with Lang2.LangStr['zh_TW'] do
  begin
    Values['Label1'] := '標題TW';
    Values['Button1'] := '按鈕';
    Values['CheckBox1'] := '復選框';
    Values['Test'] := '測試';
    Values['MSG_INPUT_ACCT'] := '輸入帳號tw';
    Values['MSG_INPUT_PWD'] := '密碼TW';
    Values['MSG_EXTRA_FUN_PWD'] := '功能TW';
  end;

  Lang2.Lang := 'zh_CN';


  finally
    Lang2.Free;
  end;

end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: Lang1.Lang := 'en_US';
    1: Lang1.Lang := 'zh_CN';
    2: Lang1.Lang := 'zh_TW';
    3: Lang1.Lang := '';
  end;

end;

procedure TForm3.ComboBox2Change(Sender: TObject);
begin
//
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
//  Button1.Text := 'Button';
//  CheckBox1.Text := 'CheckBox';
//  Label1.Text := 'Test';
//  Caption := 'Test';
  Lang1.AddLang('en_US');
  Lang1.AddLang('zh_CN');
  Lang1.AddLang('zh_TW');
{
  with Lang1.Original do
  begin
    Add('Button');
    Add('CheckBox');
    Add('Test');
    Add('MSG INPUT ACCT');
    Add('MSG INPUT PWD');
  end;
}
{
  with Lang1.LangStr['en'] do
  begin
    Add('Button');
    Add('CheckBox');
    Add('Test');
    Add('input account');
    Add('input pwd');
  end;
}

  with Lang1.LangStr['en_US'] do
  begin
    Values['Label1'] := 'label';
    Values['Button1'] := 'Button';
    Values['CheckBox1'] := 'Check box';
    Values['Test'] := 'Test';
    Values['MSG_INPUT_ACCT'] := 'input account';
    Values['MSG_INPUT_PWD'] := 'input password';
    Values['MSG_EXTRA_FUN_PWD'] := 'function 1';
  end;
  with Lang1.LangStr['zh_CN'] do
  begin
    Values['Label1'] := '標題CN';
    Values['Button1'] := '按钮';
    Values['CheckBox1'] := '复选框';
    Values['Test'] := '测试';
    Values['MSG_INPUT_ACCT'] := '輸入帳號cn';
    Values['MSG_INPUT_PWD'] := '密碼CN';
    Values['MSG_EXTRA_FUN_PWD'] := '功能CN';
  end;
  {繁体中文}
  with Lang1.LangStr['zh_TW'] do
  begin
    Values['Label1'] := '標題TW';
    Values['Button1'] := '按鈕';
    Values['CheckBox1'] := '復選框';
    Values['Test'] := '測試';
    Values['MSG_INPUT_ACCT'] := '輸入帳號tw';
    Values['MSG_INPUT_PWD'] := '密碼TW';
    Values['MSG_EXTRA_FUN_PWD'] := '功能TW';
  end;
  ComboBox1.ItemIndex := 2;
  Lang1.Lang := ComboBox1.Items.Strings[ComboBox1.ItemIndex];


  FLang_tw := TStringList.Create;
  FLang_tw.Add('UI_fmMain_dfAccount=帳號 :');
  FLang_tw.Add('UI_fmMain_dfPwd=密碼 :');
  FLang_tw.Add('UI_fmMain_btnSignIn=登入');
  FLang_tw.Add('UI_fmSetup_pbReturn=完成');
  FLang_tw.Add('UI_fmSetup_itemHost=主機名稱');
  FLang_tw.Add('UI_fmSetup_itemPort=通訊埠');
  FLang_tw.Add('UI_fmSetup_itemCompany=公司 ID');
  FLang_tw.Add('UI_fmSetup_itemLanguage=語言設定');
  FLang_tw.Add('UI_fmSetup_itemClickSensitivity=點擊靈敏度');
  FLang_tw.Add('UI_fmSetup_itemDomainName=網域名稱');


end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  FLang_tw.Free;

end;

{ TLanguage }

procedure TLanguage.AddLang(const AName: string);
var
  Idx: Integer;
  Str: TStrings;
begin
  Idx := FResources.IndexOf(AName);
  if Idx < 0 then
  begin
    Str := TStringList.Create;
//    TStringList(Str).Sorted := True;
    TStringList(Str).CaseSensitive := True;
    FResources.AddObject(AName, Str);
  end;
end;

constructor TLanguage.Create(AOwner: TComponent);
begin
  inherited;
  FOriginal := TStringList.Create;
  FResources := TStringList.Create;
  FAutoSelect := True;
  FStoreInForm := True;

end;

destructor TLanguage.Destroy;
var
  I: Integer;
begin
  for I := 0 to FResources.Count - 1 do
    TStrings(FResources.Objects[I]).DisposeOf;
  FreeAndNil(FResources);
  FreeAndNil(FOriginal);
  inherited;
end;

function TLanguage.GetLangStr(const Index: string): TStrings;
var
  Idx: Integer;
begin
  Idx := FResources.IndexOf(Index);
  if Idx >= 0 then
    Result := TStrings(FResources.Objects[Idx])
  else
    Result := nil;
end;

procedure TLanguage.SetLang(const Value: string);
begin
  FLang := Value;
  if not(csLoading in ComponentState) then
  begin
    if FLang = 'en' then
      ResetLang
    else
      LoadLangFromStrings(LangStr[FLang]);
  end;
end;

end.
