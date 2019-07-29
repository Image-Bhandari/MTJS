unit UnitInchargeVerification;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables;

type
  TForm_InchargeVerification = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit_UserName: TEdit;
    Label2: TLabel;
    Edit_Password: TEdit;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    Query_CheckUser: TQuery;
    procedure FormShow(Sender: TObject);
    procedure Edit_UserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit_PasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnOkClick(Sender: TObject);
    Function CheckUser(UserName,Upassword:String):Boolean;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
     pi_NoofLogin:Integer;
    { Public declarations }
  end;

var
  Form_InchargeVerification: TForm_InchargeVerification;

implementation

uses Unit_fxn;

{$R *.DFM}

procedure TForm_InchargeVerification.FormShow(Sender: TObject);
begin
  Edit_UserName.Text:='';
  Edit_UserName.SetFocus;
  Edit_Password.Text:='';
  pi_NoofLogin:=1;
end;

procedure TForm_InchargeVerification.Edit_UserNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF (key=13) and (Edit_UserName.Text<>'') Then
  Edit_Password.SetFocus
  Else
  Edit_UserName.SetFocus;
end;

procedure TForm_InchargeVerification.Edit_PasswordKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF (key=13) and (Edit_UserName.Text<>'') Then
  Begin
    IF Edit_UserName.Text='' Then
    Edit_UserName.SetFocus
    Else
    BitBtnOkClick(Sender);
  End
  Else
  Edit_Password.SetFocus;
end;

procedure TForm_InchargeVerification.BitBtnOkClick(Sender: TObject);
var ls_UserName,ls_UPassword:String;
begin
  IF Edit_UserName.Text='' Then
  Begin
    MessageDlg('Plz. Enter your User Name.',mtInformation,[mbok],0);
    Edit_UserName.SetFocus;
    Exit;
  End;
  IF Edit_Password.Text='' Then
  Begin
    MessageDlg('Plz. Enter your Password.',mtInformation,[mbok],0);
    Edit_Password.SetFocus;
    Exit;
  End;
  ls_UserName:=Edit_UserName.Text;
  ls_UPassword:=Edit_Password.Text;
  IF pi_NoofLogin > 3 Then
  Begin
    //b_InchVerified:=False;
    MessageDlg('Sorry ! Maximum number of login attempts[3] exceeded.',mtInformation,[mbok],0);
    Close;
    Exit;
  End;
  IF CheckUser(ls_UserName,ls_UPassword)=True Then
  Close;
end;

Function TForm_InchargeVerification.CheckUser(UserName,Upassword:String):Boolean;
Begin
     with Query_CheckUser do
     Begin
          databasename:= gs_databasename;
          Close;
          sql.Clear;
          sql.add(' Select USIN_Id,Isadmin From HS_USIN_USERINFO where ');
          sql.add(' USIN_UserName='+#39+UserName+#39+' and USIN_Password='+#39+Upassword+#39);
          SQL.SaveToFile('C:\LOGPEN.txt');
          open;
     End;

     IF (Query_CheckUser.RecordCount > 0) Then
     Begin
          IF Query_CheckUser.FieldByName('Isadmin').AsString='Y' Then
          Begin
               //gi_InchargeId:=Query_CheckUser.FieldByName('UserId').AsInteger;
              // b_InchVerified:=True;
               Result:=True;
          End
          Else
          Begin
             //  b_InchVerified:=False;
               MessageDlg('Sorry ! This user login doesn''t have admin authority.',mtInformation,[mbok],0);
               Result:=False;
          End;
     End
     Else
     Begin
         // b_InchVerified:=False;
          MessageDlg('Sorry ! User name and password doesn''t match.',mtInformation,[mbok],0);
          Edit_Password.SetFocus;
          Result:=False;
     End;
     Inc(pi_NoofLogin);
End;

procedure TForm_InchargeVerification.BitBtnCancelClick(Sender: TObject);
begin


  // b_InchVerified:=False;
   Close;
end;

procedure TForm_InchargeVerification.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  IF key=27 Then Close;
end;

end.
