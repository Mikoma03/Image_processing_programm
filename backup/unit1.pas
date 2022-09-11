unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
     down:boolean;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button10Click(Sender: TObject);
var
  bm:tbitmap;
begin
   OpenDialog1.Execute;
  PaintBox1.Canvas.Clear;
  image1.Picture.SaveToFile(OpenDialog1.FileName);
  PaintBox1.Canvas.Draw(0,0,image1.Picture.Bitmap);

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  paintbox1.Refresh;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin

end;

procedure TForm1.Button6Click(Sender: TObject);
var
  text1,text2:integer;
begin
  text1:=strtoint(edit1.text);
  text2:=strtoint(edit2.text);
  if text1= text1 then
  begin
  PaintBox1.Canvas.Pen.Width:=text1;
  end;

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  PaintBox1.Canvas.Clear;
  image1.Picture.LoadFromFile(OpenDialog1.FileName);
  PaintBox1.Canvas.Draw(0,0,image1.Picture.Bitmap);
end;

procedure TForm1.PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  down:=true;
  PaintBox1.Canvas.MoveTo(x,y);
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if down then
  begin

  PaintBox1.Canvas.Pen.Width:=5;
  PaintBox1.Canvas.LineTo(x,y);

  end;
end;

procedure TForm1.PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  down:=false;
end;


end.

