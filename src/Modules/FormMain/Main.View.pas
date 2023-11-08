﻿unit Main.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Skia,
  FMX.Layouts, FMX.Effects, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.TabControl;

type
  TFormMain = class(TForm)
    RectBackground: TRectangle;
    SkLabel1: TSkLabel;
    LayActions: TLayout;
    SkLabel31: TSkLabel;
    GridPanelActions: TGridPanelLayout;
    RectGLivro: TRectangle;
    SkLabel9: TSkLabel;
    SkSvg5: TSkSvg;
    ShadowEffect1: TShadowEffect;
    SkSvgHeader: TSkSvg;
    RectGUsuario: TRectangle;
    SkLabel2: TSkLabel;
    SkSvg2: TSkSvg;
    RectGEmprestimo: TRectangle;
    SkLabel3: TSkLabel;
    SkSvg3: TSkSvg;
    ShadowEffect2: TShadowEffect;
    Layout1: TLayout;
    Circle1: TCircle;
    SkLblNameUser: TSkLabel;
    BtnLogout: TSpeedButton;
    SkSvg1: TSkSvg;
    Line1: TLine;
    Rectangle1: TRectangle;
    TabCon: TTabControl;
    TabMain: TTabItem;
    TabForm2: TTabItem;
    procedure FormCreate(Sender: TObject);
    procedure RectGUsuarioClick(Sender: TObject);
    procedure RectGLivroClick(Sender: TObject);
    procedure RectGEmprestimoClick(Sender: TObject);
    procedure BtnLogoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses User.Settings, Main.Settings, BookManager.Settings, Movement.Settings,
  LibrarySession;

procedure TFormMain.BtnLogoutClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  TmpMain: ^TCustomForm;
begin
  TmpMain  := @Application.Mainform; //muda o main em runtimer
  TmpMain^ := Self;
end;

procedure TFormMain.RectGEmprestimoClick(Sender: TObject);
begin
  TMovementSettings.OpenFormMovement;
end;

procedure TFormMain.RectGLivroClick(Sender: TObject);
begin
  if TLibrarySession.GetInstance.GetUserType <> TUserType.utAdministrador then
  begin
    ShowMessage('Você precisa de permissão de administrador!');
    Exit;
  end;
  TBookManager_Settings.OpenFormBookManager;
end;

procedure TFormMain.RectGUsuarioClick(Sender: TObject);
begin
 if TLibrarySession.GetInstance.GetUserType <> TUserType.utAdministrador then
  begin
    ShowMessage('Você precisa de permissão de administrador!');
    Exit;
  end;
  TUser_Settings.OpenFormUser;
end;

end.
