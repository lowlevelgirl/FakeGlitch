unit main;

{$mode objfpc}{$H+}

interface

uses
      Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Process;

type

			{ TFakeGlitchWindow }

      TFakeGlitchWindow = class(TForm)
						Start: TButton;
						FakeGlitch: TLabel;
						OpenDialog: TOpenDialog;
						procedure StartGlitch(Sender: TObject);
      private

      public

      end;

var
      FakeGlitchWindow: TFakeGlitchWindow;

implementation

{$R *.lfm}

{ TFakeGlitchWindow }

procedure TFakeGlitchWindow.StartGlitch(Sender: TObject);
var
  GProcess: TProcess;
begin
  GProcess:= TProcess.Create(nil);
  Gprocess.Executable:= 'FakeGlitch';
  Gprocess.Parameters.Add('lain.png');
  GProcess.Execute;
  GProcess.Free;
end;

end.

