program FakeGlitchGUI;

{$mode objfpc}{$H+}

uses
      {$IFDEF UNIX}
      cthreads,
      {$ENDIF}
      {$IFDEF HASAMIGA}
      athreads,
      {$ENDIF}
      Interfaces, // this includes the LCL widgetset
      Forms, main
      { you can add units after this };

{$R *.res}

begin
      RequireDerivedFormResource := True;
      Application.Scaled := True;
      Application.{%H-}MainFormOnTaskbar := True;
      Application.Initialize;
			Application.CreateForm(TFakeGlitchWindow, FakeGlitchWindow);
      Application.Run;
end.

