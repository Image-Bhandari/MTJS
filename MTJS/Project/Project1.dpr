program Project1;

uses
     Forms,
     Unit_login in '..\Unit\Unit_login.pas' { form_login } ,
     SignUp in '..\Unit\SignUp.pas' { form_signup } ,
     Unit_main_form in '..\Unit\Unit_main_form.pas' { form_main } ,
     Unit_modified_track_form in '..\Unit\Unit_modified_track_form.pas'
     { form_modification } ,
     unit_job_schedule in '..\Unit\unit_job_schedule.pas'
     { form_job_scheduling } ,
     Unit_dm in '..\Unit\Unit_dm.pas' { DM: TDataModule } ,
     UnitInchargeVerification in '..\Unit\UnitInchargeVerification.pas'
     { Form_InchargeVerification } ,
     Unit_fxn in '..\Unit\Unit_fxn.pas',
     Unit_Message in '..\Unit\Unit_Message.pas' { Frm_Message } ,
     ServerDate in '..\Unit\ServerDate.pas',
     Change in '..\Unit\Change.pas',
     Unit_databasedetails in '..\Unit\Unit_databasedetails.pas'
     { form_databasedetails } ,
     Unit_databasesummary in '..\Unit\Unit_databasesummary.pas'
     { Form_qprdatabasesummary } ,
     Unit_projectdetails in '..\Unit\Unit_projectdetails.pas'
     { Form_qprprojectdetails } ,
     Unit_projectsummary in '..\Unit\Unit_projectsummary.pas'
     { Form_qprprojectsummary } ,
     Unit_Report in '..\Unit\Unit_Report.pas' { form_report } ;
{$R *.res}

begin

     Application.Initialize;
     Application.MainFormOnTaskbar := True;
     Startup;
     Application.CreateForm(Tform_login, form_login);
     Application.CreateForm(Tform_signup, form_signup);
     Application.CreateForm(Tform_main, form_main);
     Application.CreateForm(TDM, DM);
     Application.CreateForm(TForm_InchargeVerification,
          Form_InchargeVerification);
     Application.CreateForm(TFrm_Message, Frm_Message);
     Application.CreateForm(Tform_databasedetails, form_databasedetails);
     Application.CreateForm(TForm_qprdatabasesummary, Form_qprdatabasesummary);
     Application.CreateForm(TForm_qprprojectdetails, Form_qprprojectdetails);
     Application.CreateForm(TForm_qprprojectsummary, Form_qprprojectsummary);
     Application.CreateForm(Tform_report, form_report);
     Application.CreateForm(Tform_modification, form_modification);
     Application.CreateForm(Tform_job_scheduling, form_job_scheduling);
     Application.CreateForm(Tform_report, form_report);
     Application.Run;

end.
