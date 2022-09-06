unit unsavedSettings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ActnList;

type

  { TUnsavedSettingsFrm }

  TUnsavedSettingsFrm = class(TForm)
    NoAction: TAction;
    YesAction: TAction;
    ActionList1: TActionList;
    Yes: TButton;
    No: TButton;
    Label1: TLabel;
    procedure NoClick(Sender: TObject);
    procedure YesClick(Sender: TObject);
  private

  public

  end;

var
  UnsavedSettingsFrm: TUnsavedSettingsFrm;

implementation

{ TUnsavedSettingsFrm }

procedure TUnsavedSettingsFrm.YesClick(Sender: TObject);
begin
  ModalResult:=mrYes;
end;

procedure TUnsavedSettingsFrm.NoClick(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

initialization
  {$I unsavedSettings.lrs}

end.

