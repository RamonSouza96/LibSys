program LibSys;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.Skia,
  FMX.Dialogs,
  Login.View in 'FormLogin\Login.View.pas' {FormLogin},
  Main.View in 'FormMain\Main.View.pas' {FormMain},
  User.View in 'FormUser\User.View.pas' {FormUser},
  BookManager.View in 'FormBookManager\BookManager.View.pas' {FormBookManager},
  Movement.View in 'FormMovement\Movement.View.pas' {FormMovement},
  Main.Settings in 'FormMain\Main.Settings.pas',
  Login.Settings in 'FormLogin\Login.Settings.pas',
  Login.Controller in 'FormLogin\Login.Controller.pas',
  Dm in '..\DataModule\Dm.pas' {Dm1: TDataModule},
  Dm.Script in '..\DataModule\Dm.Script.pas',
  Dm.Utils in '..\DataModule\Dm.Utils.pas',
  Helpers.HelpsAll in '..\Helpers\Helpers.HelpsAll.pas',
  User.Settings in 'FormUser\User.Settings.pas',
  User.Controller in 'FormUser\User.Controller.pas',
  BookManager.Settings in 'FormBookManager\BookManager.Settings.pas',
  BookManager.Controller in 'FormBookManager\BookManager.Controller.pas',
  LibrarySession in '..\Classes\LibrarySession.pas',
  Movement.Settings in 'FormMovement\Movement.Settings.pas',
  Movement.Controller in 'FormMovement\Movement.Controller.pas',
  Widgets in 'FormWidgets\Widgets.pas' {FormWidgets},
  Movement.List in 'FormMovement\Movement.List.pas';

{$R *.res}

begin
  GlobalUseSkia := True;
  var AssetsPath: string := THelpsAll.GetAssetsPath;
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-Bold.ttf');
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-ExtraBold.ttf');
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-ExtraLight.ttf');
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-Light.ttf');
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-Medium.ttf');
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-Regular.ttf');
  TSkDefaultProviders.RegisterTypeface(AssetsPath + 'Poppins-SemiBold.ttf');
  Application.Initialize;
  Application.CreateForm(TDm1, Dm1);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormWidgets, FormWidgets);
  Application.Run;
end.
