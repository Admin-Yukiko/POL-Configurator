unit accountinfoform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TAccountInfoEntryForm }

  TAccountInfoEntryForm = class(TForm)
    AcctsAndPolMemo: TMemo;
    ClearGameDataAuthorisationCheckBox: TCheckBox;
    Label1: TLabel;
    NamePassEntryLabel: TLabel;
    NewActsAndPolTxtCheckBox: TCheckBox;
    NoBtn: TButton;
    PasswordEdit: TEdit;
    PasswordLabel: TLabel;
    UserNameEdit: TEdit;
    UsernameLabel: TLabel;
    YesBtn: TButton;
    procedure ClearGameDataAuthorisationCheckBoxClick(Sender: TObject);
    procedure NoBtnClick(Sender: TObject);
    procedure YesBtnClick(Sender: TObject);
  private

  public

  end;

var
  AccountInfoEntryForm: TAccountInfoEntryForm;

implementation

{ TAccountInfoEntryForm }


procedure TAccountInfoEntryForm.YesBtnClick(Sender: TObject);
begin
  If((NewActsAndPolTxtCheckBox.Checked) and Not ClearGameDataAuthorisationCheckBox.Checked) Then
  	ShowMessage('You did not check the "Clear Game Data?" check box.' + Chr(13) + Chr(10) +
    						'if you want the Configurator to create a new' + Chr(13) + Chr(10) +
                'accounts file and a default pol.txt file you' + Chr(13) + Chr(10) +
                ' check the "Replace Accounts.txt and pol.txt"' + Chr(13) + Chr(10) +
                'check box.' + Chr(13) + Chr(10) +
                ' PLEASE NOTE that creating those files REQUIRES' + Chr(13) + Chr(10) +
                'a complete wipe of all world data!' + Chr(13) + Chr(10) +
                'Click the "No" button if you do not want to create' + Chr(13) + Chr(10) +
                'these files.');
  If((Length(UserNameEdit.Text) = 0) or (Length(PasswordEdit.Text) = 0)) Then
    ShowMessage('You must enter a user name and a password.')
  Else ModalResult:=mrYes;
  //TFormMissingFiles.Hide;

end;

procedure TAccountInfoEntryForm.NoBtnClick(Sender: TObject);
begin
	ModalResult:=mrNo;
end;

procedure TAccountInfoEntryForm.ClearGameDataAuthorisationCheckBoxClick(
  Sender: TObject);
begin
  If(ClearGameDataAuthorisationCheckBox.Checked and NewActsAndPolTxtCheckBox.Checked) Then
    Begin
      NamePassEntryLabel.Enabled:=True;
      UsernameLabel.Enabled:=True;
      UserNameEdit.Enabled:=True;
      PasswordLabel.Enabled:=True;
      PasswordEdit.Enabled:=True;
    end
  Else
  Begin
    ClearGameDataAuthorisationCheckBox.Checked:=False;
    NamePassEntryLabel.Enabled:=False;
    UsernameLabel.Enabled:=False;
    UserNameEdit.Enabled:=False;
    PasswordLabel.Enabled:=False;
    PasswordEdit.Enabled:=False;
  end;
end;
initialization
  {$I AccountInfoForm.lrs}

end.

