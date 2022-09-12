unit externprogsel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ActnList;

type

  { TExtrnProgFrm }

  TExtrnProgFrm = class(TForm)
    ClearBtnCheckBox: TCheckBox;
    StartInDirBrowse: TButton;
    CancelAct: TAction;
    StartInDirEdit: TEdit;
    StartinDir: TLabel;
    OkAct: TAction;
    ActionList1: TActionList;
    OkBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    ProgBrowseBtn: TButton;
    ProgLocLabel: TLabel;
    ProgNameLabel: TLabel;
    ProgNameEdit: TEdit;
    ProgLocEdit: TEdit;
    OpenDialog1: TOpenDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Action1Execute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OkActExecute(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ProgBrowseBtnClick(Sender: TObject);
    procedure StartInDirBrowseClick(Sender: TObject);
    

  private

  public
    NewExtProgName: String;
    NewExtProgLoc: String;
	NewExtProgDir: String;
  end;

var
  ExtrnProgFrm: TExtrnProgFrm;

implementation

{ TExtrnProgFrm }

procedure TExtrnProgFrm.Action1Execute(Sender: TObject);
begin

end;

procedure TExtrnProgFrm.FormActivate(Sender: TObject);
begin

end;

procedure TExtrnProgFrm.OkActExecute(Sender: TObject);
begin

end;

procedure TExtrnProgFrm.OkBtnClick(Sender: TObject);
begin
  If(ProgNameEdit.Text = '') Then
  Begin
    ShowMessage('You must enter a name for the button.');
    Exit;
  end;
  if(Length(ProgNameEdit.Text) > 20) Then
  Begin
    ShowMessage('The button name is too long. (Max 20 characters)');
    Exit;
  end;
  If(ClearBtnCheckBox.Checked = True) Then
  Begin
  	ProgNameEdit.Text:='<empty>';
  	ProgLocEdit.Text := '';
  	StartInDirEdit.Text := '';
  end;
  If((ProgLocEdit.Text = '') and (ClearBtnCheckBox.Checked = False)) Then
  Begin
    ShowMessage('You must choose a program for the button.');
    Exit;
  end;

  NewExtProgName := ProgNameEdit.Text;
  NewExtProgLoc := ProgLocEdit.Text;
  NewExtProgDir := StartInDirEdit.Text;
  ExtrnProgFrm.ProgNameEdit.Text := '';
  ExtrnProgFrm.ProgLocEdit.Text:= '';
  ExtrnProgFrm.StartInDirEdit.Text:= '';
  ModalResult := mrOK;
end;

procedure TExtrnProgFrm.CancelBtnClick(Sender: TObject);
begin
  ExtrnProgFrm.ProgNameEdit.Text := '';
  ExtrnProgFrm.ProgLocEdit.Text:= '';
  ModalResult := mrCancel;
end;

procedure TExtrnProgFrm.ProgBrowseBtnClick(Sender: TObject);
begin
  If(OpenDialog1.Execute) Then ProgLocEdit.Text:=OpenDialog1.FileName;
end;

procedure TExtrnProgFrm.StartInDirBrowseClick(Sender: TObject);
begin
	If(SelectDirectoryDialog1.Execute) Then StartInDirEdit.Text:=SelectDirectoryDialog1.FileName;
end;

initialization
  {$I externprogsel.lrs}

end.

