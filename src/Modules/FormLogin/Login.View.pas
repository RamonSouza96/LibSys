unit Login.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Effects,
  FMX.Skia, FMX.StdCtrls;

type
  TFormLogin = class(TForm)
    SkSvgHeader: TSkSvg;
    SkLabel1: TSkLabel;
    ShadowEffect2: TShadowEffect;
    Layout1: TLayout;
    RectLoginBackground: TRectangle;
    Layout2: TLayout;
    RectUser: TRectangle;
    EdtLogin: TEdit;
    SkSvg1: TSkSvg;
    RectPass: TRectangle;
    EdtSenha: TEdit;
    SkSvg2: TSkSvg;
    SkSvgViewPassword: TSkSvg;
    SkLabel4: TSkLabel;
    RectEntrar: TRectangle;
    BtnEntrar: TSpeedButton;
    StyleBook1: TStyleBook;
    procedure BtnEntrarClick(Sender: TObject);
    procedure SkSvgViewPasswordClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.fmx}

uses Login.Settings;

procedure TFormLogin.BtnEntrarClick(Sender: TObject);
begin
  TLogin_Settings.SignIn;
end;

procedure TFormLogin.SkSvgViewPasswordClick(Sender: TObject);
begin
  if EdtSenha.Password = true then
  begin
    EdtSenha.Password := False;
    SkSvgViewPassword.Svg.OverrideColor := $FF9B9B9B;
  end
  else
  begin
    EdtSenha.Password := True;
    SkSvgViewPassword.Svg.OverrideColor := $FF016CB5;
  end;
end;

end.
