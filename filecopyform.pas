unit filecopyform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ComCtrls;

type

  { TFileCopyFrm }

  TFileCopyFrm = class(TForm)
    FilesCopiedOkBtn: TButton;
    CopyMessageLabel: TLabel;
    FileCopyProgBar: TProgressBar;
    procedure FilesCopiedOkBtnClick(Sender: TObject);
  private

  public

  end;

var
  FileCopyFrm: TFileCopyFrm;

implementation

{ TFileCopyFrm }

procedure TFileCopyFrm.FilesCopiedOkBtnClick(Sender: TObject);
begin
	FileCopyFrm.Hide;
end;

initialization
  {$I filecopyform.lrs}

end.

