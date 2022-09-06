unit new_server;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, StdCtrls,
  httpsend, fphttpclient, ssl_openssl;

type
  
  { TNewPOLServer }

  TNewPOLServer = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DownloadPOLCore: TButton;
    DownloadPOLDistro: TButton;
    Edit2: TEdit;
    Label6: TLabel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button2Click(Sender: TObject);
    procedure DownloadPOLCoreClick(Sender: TObject);
    procedure DownloadPOLDistroClick(Sender: TObject);
  private

  public

  end;

var
  NewPOLServer: TNewPOLServer;

implementation
Uses polcfgedit;

function FileDownload(URL: string; SaveToFile: boolean = false; Filename: string = ''): string;
begin
  // Result will be:
  // - empty ('') when it has failed
  // - filename when the file has been downloaded successfully
  // - content when the content SaveToFile is set to False
  Result := '';
  With TFPHttpClient.Create(Nil) do
  try
    try
      AllowRedirect := true;
      if SaveToFile then begin
        Get(URL, Filename);
        Result := Filename;
      end else begin
        Result := Get(URL);
      end;
    except
      on E: Exception do
        ShowMessage('Error: ' + E.Message);
    end;
  finally
    Free;
  end;
end;


{ TNewPOLServer }

procedure TNewPOLServer.DownloadPOLDistroClick(Sender: TObject);
var
  URL: String;
  
Begin
     URL := 'https://github.com/polserver/ModernDistro/archive/master.zip';
     FileDownload(URL, True, 'Distro.zip');
end;

procedure TNewPOLServer.DownloadPOLCoreClick(Sender: TObject);
var
  URL: String;
  
Begin
     URL := 'https://github.com/polserver/polserver/releases/download/NightlyRelease/Nightly-Windows.zip';
     FileDownload(URL, True, 'pol.zip');
end;

procedure TNewPOLServer.Button2Click(Sender: TObject);
begin
  SelectDirectoryDialog1.Title:='Please select the directory for the new POL installation:';
  if(SelectDirectoryDialog1.Execute) then
  Begin
    POLConfigurator.POLDir.Text := SelectDirectoryDialog1.FileName;
  end;;
end;

initialization
  {$I new_server.lrs}

end.

