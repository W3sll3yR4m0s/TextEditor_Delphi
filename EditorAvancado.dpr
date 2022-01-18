program EditorAvancado;

uses
  Forms,
  uEditor in 'uEditor.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WRaizenEditor v1.0';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
