unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniGUIBaseClasses,
  uniEdit, StrUtils;


type
  TMainForm = class(TUniForm)
    UniEdit1: TUniEdit;
    UniButton1: TUniButton;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function protectionXSSforUniGUI(Value: String): Boolean;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

{ TMainForm }

function TMainForm.protectionXSSforUniGUI(Value: String): Boolean;
const
  blockTags: Array[0..11] of AnsiString=('<script>',
  '<embed>',
  '<applet>',
  '<frameset>',
  '<form>',
  '<iframe>',
  '<meta>',
  '<layer>',
  '<object>',
  '<img>',
  '<link>',
  '<div>');

  blockJS: Array[0..6] of AnsiString=('src=',
  'href=',
  'eval()',
  'expression()',
  'vbscript:',
  'url=',
  'url()');
var
 I: Integer;
begin
  Result := False;
  for I := 0 to Length(blockTags) - 1 do
    begin
      if ContainsText(Value, blockTags[I]) then
      begin
        Result := True;
      end;
    end;

  for I := 0 to Length(blockJS) - 1 do
    begin
      if ContainsText(Value, blockJS[I]) then
      begin
        Result := True;
      end;
    end;
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
 if protectionXSSforUniGUI(UniEdit1.Text) then
 begin
   ShowMessage('Geçersiz!');
 end else
 begin
   ShowMessage('Ýzin verildi!');
 end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
