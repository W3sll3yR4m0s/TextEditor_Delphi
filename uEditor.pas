unit uEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, ToolWin, ImgList,
  WinSkinData;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    RichEdit1: TRichEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ImageList1: TImageList;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    ToolButton16: TToolButton;
    Timer1: TTimer;
    SkinData1: TSkinData;
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure RichEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    function TextoSelecionado: TTextAttributes;
    procedure AtualizaBotoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.TextoSelecionado: TTextAttributes; // Responsavel por captar o texto selecionado para aplicar efeitos de fonte.
begin
  If RichEdit1.SelLength > 0 Then Result := RichEdit1.SelAttributes
  Else Result := RichEdit1.DefAttributes;
end;

procedure TForm1.AtualizaBotoes();  // Responsavel por afundar os botões em tempo de execução (RunTime).
begin
 With RichEdit1.Paragraph Do
  Try
    ToolButton9.Down := fsBold In RichEdit1.SelAttributes.Style;
    ToolButton10.Down := fsItalic In RichEdit1.SelAttributes.Style;
    ToolButton11.Down := fsUnderline In RichEdit1.SelAttributes.Style;
    If Ord(Alignment) = 0 Then
    Begin
      ToolButton12.Down := True;
      ToolButton15.Down := False;
      ToolButton14.Down := False;
    End;
    If Ord(Alignment) = 1 Then
    Begin
      ToolButton12.Down := False;
      ToolButton15.Down := True;
      ToolButton14.Down := False;
    End;
    If Ord(Alignment) = 2 Then
    Begin
      ToolButton12.Down := False;
      ToolButton15.Down := False;
      ToolButton14.Down := True;
    End;
  Except
    Application.Terminate; // Se acontecer algum problema nas funções acima, o programa fecha.
  End;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  If ToolButton10.Down = False  Then
     TextoSelecionado.Style := TextoSelecionado.Style - [fsItalic]
  Else
     TextoSelecionado.Style := TextoSelecionado.Style + [fsItalic];
end;

procedure TForm1.ToolButton11Click(Sender: TObject);
begin
  If ToolButton11.Down = False Then
     TextoSelecionado.Style := TextoSelecionado.Style - [fsUnderline]
  Else
     TextoSelecionado.Style := TextoSelecionado.Style + [fsUnderline];
end;

procedure TForm1.ToolButton12Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := TAlignment(0);
end;

procedure TForm1.ToolButton14Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := TAlignment(2);
end;

procedure TForm1.ToolButton15Click(Sender: TObject);
begin
  RichEdit1.Paragraph.Alignment := TAlignment(1);
end;

procedure TForm1.ToolButton17Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  RichEdit1.Clear;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  If opendialog1.Execute Then
  Begin
    Richedit1.Lines.LoadFromFile(opendialog1.FileName);
    Richedit1.SetFocus;
  End;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  If Savedialog1.Execute Then
  Begin
    RichEdit1.Lines.SavetoFile(Savedialog1.FileName);
    RichEdit1.SetFocus;
  End;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
  RichEdit1.PasteFromClipboard;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  RichEdit1.CopyToClipboard;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
  RichEdit1.CutToClipboard;
end;

procedure TForm1.ToolButton9Click(Sender: TObject);
begin
  If ToolButton9.Down = False Then
     TextoSelecionado.Style := TextoSelecionado.Style - [fsBold]
  Else
     TextoSelecionado.Style := TextoSelecionado.Style + [fsBold];
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  AtualizaBotoes();
end;

procedure TForm1.RichEdit1Change(Sender: TObject);
begin
  AtualizaBotoes();
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  // Para evitar fraudes.
  If Form1.Caption <> 'WRaizenEditor v1.0' Then
  Close;
end;

end.
