program pol_configurator;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms
  { you can add units after this }, polcfgedit, runtimetypeinfocontrols,
  missingFilesForm, accountinfoform, filecopyform, unsavedSettings,
  externprogsel, new_server;



{$R *.res}

begin
  Application.Scaled:=True;
  Application.Title:='TPC';
  Application.Initialize;
  Application.Createform(Tpolconfigurator, Polconfigurator);
  Application.CreateForm(TFormMissingFiles, FormMissingFiles);
  Application.CreateForm(TAccountInfoEntryForm, AccountInfoEntryForm);
//  Application.CreateForm(TAcctsAndPolReplacement, AcctsAndPolReplacement);
  Application.CreateForm(TFileCopyFrm, FileCopyFrm);
  Application.CreateForm(TUnsavedSettingsFrm, UnsavedSettingsFrm);
  Application.CreateForm(TExtrnProgFrm, ExtrnProgFrm);
  Application.CreateForm(TNewPOLServer, NewPOLServer);
  Application.Run;

 end.

