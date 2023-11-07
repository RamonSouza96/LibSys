﻿unit Movement.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Skia,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Effects, FMX.ListView, FMX.TabControl, FMX.Edit, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.ComboEdit, FMX.ListBox, FMX.DateTimeCtrls;

type
  TFormMovement = class(TForm)
    RectBookMBackgraund: TRectangle;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Line1: TLine;
    SkLabel1: TSkLabel;
    TabConMoviment: TTabControl;
    TabOverview: TTabItem;
    TabRecord: TTabItem;
    Rectangle3: TRectangle;
    SkLabel5: TSkLabel;
    ScrollMoviment: TVertScrollBox;
    SkSvgFormMovimentBack: TSkSvg;
    BtnNewMSaveM: TSpeedButton;
    SkSvgActionAddSave: TSkSvg;
    Rectangle4: TRectangle;
    EdtUsuarios: TEdit;
    SkSvg6: TSkSvg;
    Rectangle6: TRectangle;
    SkLabel6: TSkLabel;
    ShadowEffect5: TShadowEffect;
    SkSvgUserArrowDawn: TSkSvg;
    SkLblTit: TSkLabel;
    SkLabel7: TSkLabel;
    Rectangle5: TRectangle;
    EdtLivro: TEdit;
    SkSvg8: TSkSvg;
    Rectangle7: TRectangle;
    SkLabel8: TSkLabel;
    ShadowEffect3: TShadowEffect;
    SkSvgBookArrowAdd: TSkSvg;
    SkLabel9: TSkLabel;
    Layout3: TLayout;
    Rectangle8: TRectangle;
    SkSvg10: TSkSvg;
    Rectangle9: TRectangle;
    SkSvg11: TSkSvg;
    SkLabel10: TSkLabel;
    Rectangle10: TRectangle;
    MemObs: TMemo;
    CbxUsuarios: TComboBox;
    CbxLivros: TComboBox;
    DataSaida: TDateEdit;
    DataPrevRetorno: TDateEdit;
    Layout4: TLayout;
    Rectangle11: TRectangle;
    LvLivroSaida: TListView;
    ScrollRegister: TVertScrollBox;
    BtnAddBook: TSpeedButton;
    StyleBook1: TStyleBook;
    Layout5: TLayout;
    Layout7: TLayout;
    SkLabel16: TSkLabel;
    SkLabel17: TSkLabel;
    SkLabel18: TSkLabel;
    SkLabel19: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    LayMargim: TLayout;
    Line5: TLine;
    ListBoxItem1: TListBoxItem;
    procedure SkSvgFormMovimentBackClick(Sender: TObject);
    procedure BtnNewMSaveMClick(Sender: TObject);
    procedure EdtUsuariosClick(Sender: TObject);
    procedure CbxUsuariosClosePopup(Sender: TObject);
    procedure CbxLivrosClosePopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SkSvgUserArrowDawnClick(Sender: TObject);
    procedure BtnAddBookClick(Sender: TObject);
    procedure LvLivroSaidaItemClickEx(const Sender: TObject; ItemIndex: Integer;
      const LocalClickPos: TPointF; const ItemObject: TListItemDrawable);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMovement: TFormMovement;

implementation

{$R *.fmx}

uses Movement.Settings, Movement.List, Helpers.HelpsAll;

procedure TFormMovement.BtnAddBookClick(Sender: TObject);
begin
  case SkSvgBookArrowAdd.tag of
    0 : CbxLivros.DropDown;
    1 : TMovementSettings.AddItemLvLivros;
  end;
end;

procedure TFormMovement.BtnNewMSaveMClick(Sender: TObject);
begin
  TMovementSettings.NewMoviment;
end;

procedure TFormMovement.CbxLivrosClosePopup(Sender: TObject);
begin
  if CbxLivros.ItemIndex <> -1 then
  begin
    EdtLivro.Text := CbxLivros.ListItems[CbxLivros.ItemIndex].Text;
    EdtLivro.Tag := CbxLivros.ListItems[CbxLivros.ItemIndex].Tag;
    SkSvgBookArrowAdd.tag := 1;
  end;
  SkSvgBookArrowAdd.Svg.Source := TMovementSettings.SvgChecked;
end;

procedure TFormMovement.CbxUsuariosClosePopup(Sender: TObject);
begin
  if CbxUsuarios.ItemIndex <> -1 then
  begin
    EdtUsuarios.Text := CbxUsuarios.ListItems[CbxUsuarios.ItemIndex].Text;
    EdtUsuarios.Tag := CbxUsuarios.ListItems[CbxUsuarios.ItemIndex].Tag;
  end;
end;

procedure TFormMovement.EdtUsuariosClick(Sender: TObject);
begin
  CbxUsuarios.DropDown;
end;

procedure TFormMovement.FormCreate(Sender: TObject);
begin
  THelpsAll.SoftScroll(FormMovement.ScrollMoviment);
  THelpsAll.SoftScroll(FormMovement.ScrollRegister);
end;

procedure TFormMovement.FormShow(Sender: TObject);
begin
  TabConMoviment.ActiveTab := TabOverview;
end;

procedure TFormMovement.LvLivroSaidaItemClickEx(const Sender: TObject;
  ItemIndex: Integer; const LocalClickPos: TPointF;
  const ItemObject: TListItemDrawable);
begin
  TMovementSettings.DeleteItemLvLivros(Sender, ItemObject);
end;

procedure TFormMovement.SkSvgFormMovimentBackClick(Sender: TObject);
begin
  TMovementSettings.FormMovementClose;
end;

procedure TFormMovement.SkSvgUserArrowDawnClick(Sender: TObject);
begin
  CbxUsuarios.DropDown;
end;

end.
