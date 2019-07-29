unit Unit_fxn;

interface

Uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, shellApi,
     // QuickRpt, QRCtrls,
     Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls, Buttons, OleCtrls, DBCtrls,
     DB, DBTables, Change,
     CheckLst, filectrl,
     NB30, DateEditXControl_TLB;

Var
     Query: Tquery;
     gs_DatabaseName: String;
     gs_HosName: String;
     gs_ClientName: String;
     gs_ClientAddress: String;
     gs_DateCaption: String;
     gs_AliasName: String;
     gs_DB_UserName: String;
     gs_DB_Password: String;
     gi_datesystem: Integer;
     AClass: TPersistentClass;
     gs_temppath: String;
     Gs_CalledFrom: String;
     gi_userid: Integer;
     gs_UserName: String;
     gs_UserLoginDate: String;
     NCount: Integer;
     gs_usertype: String;
     gs_isadmin: String;
     gi_i: Integer;
     ga_blankField: array of string;
     gb_up_in: string;

procedure Startup;
procedure showdonemessage;
Function GetJobStatus(JobMasterId: Integer): String;
Function GetProjectDuration(JobMasterId: Integer): String;
Procedure ChangeDateSystem(Dex: TDateEditX; CaptionButton: TSpeedButton);
Function TodaysDate: String;
Function TodaysTime: String;
procedure RefreshQuery(qry: Tquery; DatabaseName_: String);
Function CheckUser(NUserName, NPassword: String): Boolean;
Function GetDateDiff(ExpiryDate: String): Double;

function GetMaxId(TableName, FieldName: String): Integer;

Const
     gi_compilevalue = 2;

implementation

uses ServerDate, Unit_DM, unit_message;

procedure Startup;
begin
     if gi_compilevalue = 1 then
     begin
          gs_ClientName := 'CLIENT NAME 1';
          gs_ClientAddress := 'CLIENT ADDRESS 1';
          gi_datesystem := 0;
          gs_DateCaption := 'BS';
          gs_AliasName := 'hospital';
          gs_DatabaseName := 'orcl';
          gs_DB_UserName := 'mtjs';
          gs_DB_Password := 'mtjs';
     end
     else if gi_compilevalue = 2 then
     begin
          gs_ClientName := 'CLIENT NAME 2 ';
          gs_ClientAddress := 'CLIENT ADDRESS 2';
          gi_datesystem := 1;
          gs_DateCaption := 'AD';
          gs_AliasName := 'orahospital';
          gs_DatabaseName := 'orcl';
          gs_DB_UserName := 'mtjs';
          gs_DB_Password := 'mtjs';
          gi_i := 0;
          // gs_HosName := 'susen n sunny hospital';
          (* Remove this *)
          // gi_userid:=2;
     end;

      DM:= TDM.Create(nil);
      with Dm.DB do
      begin
      DatabaseName := gs_DatabaseName;
      AliasName := gs_AliasName;
      Params.Clear;
      Params.Add('DATABASE NAME=');
      Params.Add('USER NAME=' + gs_DB_UserName);
      Params.Add('ODBC DSN=' + gs_AliasName);
      Params.Add('OPEN MODE=READ/WRITE');
      Params.Add('SCHEMA CACHE SIZE=8');
      Params.Add('SQLQRYMODE=');
      Params.Add('LANGDRIVER=');
      Params.Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
      Params.Add('SCHEMA CACHE TIME=-1');
      Params.Add('MAX ROWS=-1');
      Params.Add('BATCH COUNT=200');
      Params.Add('ENABLE SCHEMA CACHE=FALSE');
      Params.Add('SCHEMA CACHE DIR=');
      Params.Add('ENABLE BCD=FALSE');
      Params.Add('ROWSET SIZE=20');
      Params.Add('BLOBS TO CACHE=64');
      Params.Add('PASSWORD=' + gs_DB_Password);
      if not Connected then
      Connected := true;
      end;
     { ******************************************************************** }
     gs_temppath := ExtractFilePath(Application.ExeName) + 'Temp';
     if not DirectoryExists(gs_temppath) then
          CreateDir(gs_temppath);
end;

function GetMaxId(TableName, FieldName: String): Integer;
Var
     qry: Tquery;
Begin
     qry := Tquery.Create(nil);
     With qry do
     Begin
          Close;
          DatabaseName := gs_DatabaseName;
          sql.Clear;
          sql.Add(' Select NVL(Max(' + FieldName + '),0) as MaxVal From ' +
                 TableName);
          sql.SaveToFile('c:\max.txt');
          Open;
          RESULT := FieldByName('MaxVal').AsInteger + 1;
     End;
     qry.Free;
End;

procedure showdonemessage;
begin
     frm_message.showmodal;
end;

Function GetJobStatus(JobMasterId: Integer): String;
Var
     qry: Tquery;
Begin
     qry := Tquery.Create(nil);
     With qry do
     Begin
          Close;
          DatabaseName := gs_DatabaseName;
          sql.Clear;
          sql.Add('Select Status From JobScheduleDetail ');
          sql.Add('Where Modifiedtime in ');
          sql.Add(
               '(Select Max(Modifiedtime) from JobScheduleDetail Where JobScheduleMasterId=' + IntToStr(JobMasterId));
          sql.Add(
               'And modifieddate in (select max(modifieddate) from jobscheduledetail where jobschedulemasterid=' + IntToStr(JobMasterId) + '))');
          Open;
          if FieldByName('Status').AsString <> '' then
               RESULT := FieldByName('Status').AsString
          else
               RESULT := 'PENDING';
     End;
     qry.Free;
End;

Function GetProjectDuration(JobMasterId: Integer): String;
Var
     qry: Tquery;
Begin
     qry := Tquery.Create(nil);
     With qry do
     Begin
          Close;
          DatabaseName := gs_DatabaseName;
          sql.Clear;
          sql.Add('Select Min(ModifiedDate)DateRange from JobScheduleDetail ');
          sql.Add('Where JobScheduleMasterId=' + IntToStr(JobMasterId));
          sql.Add('Union');
          sql.Add('Select Max(ModifiedDate)DateRange from JobScheduleDetail ');
          sql.Add('Where JobScheduleMasterId=' + IntToStr(JobMasterId));
          Open;
          While not eof do
          begin
               if RESULT = '' then
                    RESULT := FieldByName('DateRange').AsString
               else
                    RESULT := RESULT + ' - ' + FieldByName('DateRange')
                      .AsString;
               Next;
          end;
     End;
     qry.Free;
end;

Procedure ChangeDateSystem(Dex: TDateEditX; CaptionButton: TSpeedButton);
begin
     if Dex.SystemOfDate = 0 then
     begin
          Dex.SystemOfDate := 1;
          CaptionButton.Caption := 'AD';
     end
     else
     begin
          Dex.SystemOfDate := 0;
          CaptionButton.Caption := 'BS';
     end;
end;

Function TodaysDate: String;
begin
     RESULT := ServerDate.TodaysDate;
end;

Function TodaysTime: String;
begin
     RESULT := ServerDate.TodaysTime;
end;

procedure RefreshQuery(qry: Tquery; DatabaseName_: String);
begin
     qry.Close;
     qry.DatabaseName := DatabaseName_;
     qry.Open;
end;

Function GetDateDiff(ExpiryDate: String): Double; // function
begin
     // TDate.ADDateAsText := TodaysDate;
     // TDate.SystemOfDate := gi_datesystem;
     // Edate.ADDateAsText := ExpiryDate;
     // Edate.SystemOfDate := gi_datesystem;
     // Result := Edate.ADDateAsDate - TDate.ADDateAsDate;
end;

Function CheckUser(NUserName, NPassword: String): Boolean;
Var
     Tem_dateEditx: TDateEditX;
     DateDiff: Double;
     QueryChekUser: Tquery;
     DEX_Control: TDateEditX;
     Pass: String;
Begin
     gi_userid := 0;
     QueryChekUser := Tquery.Create(nil);
     DEX_Control := TDateEditX.Create(nil);
     Tem_dateEditx := TDateEditX.Create(nil);
     With QueryChekUser Do
     Begin
          Close;
          DatabaseName := gs_DatabaseName;
          sql.Clear;
          sql.Add(' Select UserID,UserName,ExpDate,UPassword');
          sql.Add(' ,IsActive');
          sql.Add('From UserMain Where UserName=' + chr(39) + NUserName + chr
                 (39));
          // sql.Add(' UPassword=' + chr(39) + NPassword + chr(39));
          FetchAll;
          Open;
          while Not eof do
          begin
               Pass := DecodePWDEx(FieldByName('Upassword').AsString);
               if Pass = NPassword then
               begin
                    gi_userid := FieldByName('UserID').AsInteger;
                    break;
               end;
               Next;
          end;
          sql.Clear;
          sql.Add
            (' Select UserID,UserName,Usertype,ExpDate,UPassword,IsActive');
          sql.Add('From UserMain Where UserID=' + IntToStr(gi_userid));
          Open;
          If FieldByName('IsActive').AsString = 'N' then
          begin
               MessageDlg('Sorry ! You are not the Active User', mtWarning,
                    [MbOk], 0);
               RESULT := False;
               Exit;
          End;

          IF FieldByName('UserID').AsInteger > 0 Then
          Begin
               Tem_dateEditx.ADDateAsText := TodaysDate;
               Tem_dateEditx.SystemOfDate := gi_datesystem;
               DEX_Control.ADDateAsText := FieldByName('ExpDate').AsString;
               DEX_Control.SystemOfDate := gi_datesystem;
               DateDiff := DEX_Control.ADDateAsDate -
                 Tem_dateEditx.ADDateAsDate;

               If (DateDiff <= 5) and (DateDiff > 0) then
                    MessageDlg
                      ('      Your user account will be Expired after ' +
                           FloatToStr(DateDiff) + ' Day(s).' + #13 + #13 +
                           'So,Please contact with IT Administrator to extend the User Account Date.', mtWarning, [MbOk], 0)
               Else If (DateDiff <= 0) then
               begin
                    MessageDlg('Your account has already expired.', mtWarning,
                         [MbOk], 0);
                    RESULT := False;
                    Exit;
               end;

               gi_userid := FieldByName('UserID').AsInteger;
               gs_UserName := FieldByName('UserName').AsString;
               gs_UserLoginDate := ServerDate.TodaysDate;
               gs_usertype := FieldByName('UserType').AsString;
               // Gi_StaffId:= FieldByName('StaffId').AsInteger;
               RESULT := true;
               With sql Do
               Begin
                    Close;
                    Clear;
                    Add('Update UserMain Set IsLogin=' + chr(39) + 'T' + chr(39)
                      );
                    Add('Where UserID=' + IntToStr(gi_userid));
                    ExecSQL;
               End;
               RESULT := true;
          End;
     End;
     Inc(NCount);
     QueryChekUser.Free;
End;

end.
