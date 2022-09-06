unit missingFilesForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TFormMissingFiles }

  TFormMissingFiles = class(TForm)
    UOClientLabel: TLabel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    UOClientSaveBtn: TButton;
    UOClientDirEdit: TEdit;
    POLCfgCheckBox: TCheckBox;
    YesInstallFilesBtn: TButton;
    NoInstallFilesBtn: TButton;
    CombatCfgCheckBox: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MissingFilesMemo: TMemo;
    ServspecoptCfgCheckBox: TCheckBox;
    WatchCfgCheckBox: TCheckBox;
    EcompileCfgCheckBox: TCheckBox;
    UOClientCfgCheckBox: TCheckBox;
    ServersCfgCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure NoInstallFilesBtnClick(Sender: TObject);
    procedure UOClientCfgCheckBoxChange(Sender: TObject);
    procedure UOClientSaveBtnClick(Sender: TObject);
    procedure YesInstallFilesBtnClick(Sender: TObject);
  private

  public

  end;

var
  FormMissingFiles: TFormMissingFiles;

implementation

{ TFormMissingFiles }

procedure TFormMissingFiles.YesInstallFilesBtnClick(Sender: TObject);
begin
  If(UOClientCfgCheckBox.Checked and (Not FileExists(UOClientDirEdit.Text + '/pkg.cfg'))) Then
  Begin
    ShowMessage('You must choose a package directory for the uoclient.cfg file.' + Chr(13) + Chr(10) +
  						  'It must contain a pkg.cfg file.');
    Exit;
  end;
  ModalResult:=mrYes;
  //TFormMissingFiles.Hide;
end;

procedure TFormMissingFiles.NoInstallFilesBtnClick(Sender: TObject);
begin
  ModalResult:=mrNo;
  //TFormMissingFiles.Hide;
end;

procedure TFormMissingFiles.UOClientCfgCheckBoxChange(Sender: TObject);
begin
  If(UOClientCfgCheckBox.Checked) Then
  Begin
  UOClientDirEdit.Enabled:=True;
  UOClientSaveBtn.Enabled:=True;
  end
  Else
  Begin
    UOClientDirEdit.Enabled:=False;
    UOClientSaveBtn.Enabled:=False;
  end;
end;

procedure TFormMissingFiles.UOClientSaveBtnClick(Sender: TObject);
begin
	SelectDirectoryDialog1.Title:='Please select a valid package for the uoclient.cfg file.';;
  If (SelectDirectoryDialog1.Execute) then
  	If(Not FileExists(SelectDirectoryDialog1.FileName + '/pkg.cfg')) Then
    Begin
      ShowMessage('You must choose a package directory for the uoclient.cfg file.' + Chr(13) + Chr(10) +
  						    'It must contain a pkg.cfg file.');
      Exit;
    end;
  UOClientDirEdit.Text := SelectDirectoryDialog1.FileName;
end;

procedure TFormMissingFiles.FormCreate(Sender: TObject);
begin

end;

initialization
  {$I missingfilesform.lrs}

end.

