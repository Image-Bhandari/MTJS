unit SignUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, OleCtrls, DateEditXControl_TLB, DB,
  DBTables;

type
  TForm_signup = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    btn1: TSpeedButton;
    chk1: TCheckBox;
    btn2: TButton;
    qry_signup: TQuery;
    dtdtxl: TDateEditX;
    procedure btn2Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_signup: TForm_signup;
  function CheckUsername(UserName:String): String ;
implementation
  uses Unit_fxn, Unit_login, UnitInchargeVerification;
{$R *.dfm}

function CheckUsername(UserName:String): String ;
  var
    Qry : TQuery;
    returnValue: String;
begin
   Qry:= TQuery.Create(Nil);
    with Qry do
    begin
        Close;
        DatabaseName := gs_DatabaseName;
        sql.Clear;
        SQL.Add('Select USIN_USERNAME from hs_usin_userinfo where USIN_USERNAME = ' + QuotedStr(UserName));
        SQL.SaveToFile('c:\checkuser.txt');
        Open;
        Result := FieldByName('USIN_USERNAME').AsString;
    end;
    Qry.Free;
end;

procedure TForm_signup.btn2Click(Sender: TObject);
var
  li_id : Integer;
  UserNameDb : string;
begin
   UserNameDb := CheckUsername(edt3.Text);
   edt3.Color := clWindow;
   edt4.Color := clWindow;
   edt5.Color := clWindow;
    if(UserNameDb = edt3.Text) then
    begin
       ShowMessage('Username already exist');
       edt3.Color := clRed;
       Exit;
    end;

    if edt4.Text <> edt5.Text then
    begin
      ShowMessage('Password doesnot matched');
      edt4.Color := clRed;
      edt5.Color := clRed;
      Exit;
    end;

    with qry_signup do
    begin
      Close;
      DatabaseName := gs_DatabaseName;
      sql.Clear;
      li_id := GetMaxId('hs_usin_userinfo', 'usin_id');
      SQL.Add('insert into hs_usin_userinfo values (' +inttostr(li_id));
      SQL.Add(',' + quotedstr(edt3.Text));
      SQL.Add(',' + quotedstr(edt4.Text));
      SQL.Add(',' + quotedstr(dtdtxl.ADDateAsText));
      SQL.Add(')');
      SQL.SaveToFile('c:\save.txt');
      ExecSQL;
    end;
      ShowMessage('Account Created');
      close;
end;
end.
