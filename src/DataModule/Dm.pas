unit Dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite,
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TDm1 = class(TDataModule)
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FdCon: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FdConAfterConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FdConBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm1: TDm1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Dm.Utils;

{$R *.dfm}

procedure TDm1.DataModuleCreate(Sender: TObject);
begin
  FdCon.Connected:= True;
  FdCon.Connected:= False;
end;

procedure TDm1.FdConAfterConnect(Sender: TObject);
begin
 TDataUtils.CheckDataBase(FDQuery1, FdCon);
end;

procedure TDm1.FdConBeforeConnect(Sender: TObject);
 var
  LPath: string;
begin
  LPath := TDataUtils.GetPathData+'\Data.db';
  if LPath = '' then
    raise Exception.Create('Não foi possível obter o caminho para o banco de dados');

  // Configurar os parâmetros de conexão
  with FDCon do
  begin
    Params.Add('LockingMode=Normal');
    Params.Add('DriverID=SQLite');
    Params.Add('SharedCache=False');
    LoginPrompt := False;
    Params.Values['Database'] := LPath;
  end;
end;

end.
