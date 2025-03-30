unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Process;

type

  { TFakeGlitchWindow }

  TFakeGlitchWindow = class(TForm)
				Fstring: TEdit;
				Sfolder: TButton;
				Startws: TButton;
	  Startwp: TButton;
		FakeGlitch: TLabel;
		OpenDialog: TOpenDialog;
	procedure SfolderClick(Sender: TObject);
 procedure FormCreate(Sender: TObject);
  procedure StartwsGlitch(Sender: TObject);
  procedure StartwpGlitch(Sender: TObject);
  private

  public

  end;

var
  FakeGlitchWindow: TFakeGlitchWindow;

implementation

{$R *.lfm}

{ TFakeGlitchWindow }

procedure TFakeGlitchWindow.StartwpGlitch(Sender: TObject);
var
  GProcess: TProcess;
begin
  if OpenDialog.FileName <> '' then
  begin
    GProcess := TProcess.Create(nil);
    Gprocess.Executable := 'FakeGlitch';
    Gprocess.Parameters.Add(OpenDialog.FileName);
    GProcess.Execute;
    GProcess.Free;
  end;
end;

procedure TFakeGlitchWindow.StartwsGlitch(Sender: TObject);
var
  GProcess: TProcess;
begin
  GProcess := TProcess.Create(nil);
  Gprocess.Executable := 'FakeGlitch';
  GProcess.Execute;
  GProcess.Free;
end;

procedure TFakeGlitchWindow.FormCreate(Sender: TObject);
begin
  OpenDialog.InitialDir := 'C:\';
end;

procedure TFakeGlitchWindow.SfolderClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    Fstring.Text := OpenDialog.FileName;
  end;
end;

end.

