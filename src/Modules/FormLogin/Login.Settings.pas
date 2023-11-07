﻿unit Login.Settings;

interface

uses
  System.Hash, System.SysUtils, FMX.Dialogs, Login.Controller, FMX.Forms;

type
  TLogin_Settings = class
  Private
  Public
    class procedure SignIn;
    class procedure OpenFormMain(ADateSet: TUserData);
  end;

implementation

{ TLogin_Settings }

uses Login.View, Main.View, LibrarySession;

class procedure TLogin_Settings.OpenFormMain(ADateSet: TUserData);
begin
  if not Assigned(FormMain) then
  begin
    Application.CreateForm(TFormMain, FormMain);
    FormMain.SkLblNameUser.Words[0].text := ADateSet.Nome;
    FormMain.SkLblNameUser.Words[1].text := sLineBreak + ADateSet.Tipo;
    FormMain.SkLblNameUser.tag := ADateSet.Id;
    FormMain.Show;
    FormLogin.Close;
  end;
end;

class procedure TLogin_Settings.SignIn;
var
  LData: TUserData;
  LUser: string;
  LPassword: string;
  LHash: string;
  LSaltedPassword: string;
begin
  if (FormLogin.EdtLogin.Text.IsEmpty) or (FormLogin.EdtSenha.Text.IsEmpty) then
  begin
    ShowMessage('Usuário ou senha em branco!!');
    exit;
  end;
  LUser := FormLogin.EdtLogin.Text;
  LPassword := FormLogin.EdtSenha.Text;
  LData := TLoginController.GetUserData(LUser);
  try

    if (LData.Status <> EmptyStr) and (LData.Tipo <> 'Aluno')then
    begin
      LHash := THashSHA2.GetHMAC(LPassword, LData.Salt,
        THashSHA2.TSHA2Version.SHA256);
      //Se a senha com hash corresponder à senha com hash do banco de dados
      if LHash = LData.Senha then
      begin
        if LData.Tipo = 'Operador' then
         TLibrarySession.GetInstance.Login(LData.Id, TUserType.utOperador)
        else if LData.Tipo = 'Administrador' then
         TLibrarySession.GetInstance.Login(LData.Id, TUserType.utAdministrador);
        TLogin_Settings.OpenFormMain(LData);
      end
      else
      begin
        ShowMessage('Usúario incorreto!!');
      end;
    end
    else
    begin
      ShowMessage('Usúario incorreto!!');
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message);
    end;
  end;
end;

End.