unit Movement.List;

interface

uses FMX.Layouts, FMX.Objects, FMX.Skia, FMX.Types, FMX.Graphics,
     System.UITypes, FMX.Controls, System.Types, System.SysUtils,
     System.Classes, Movement.Controller, FMX.Effects;

type
  TListMoviment = class
  Private
    class var RectCountainer: TRectangle;
    class var ShadowCard: TShadowEffect;
    class var SvgBorderLeft: TSkSvg;
    class var LayAgroupTop: TLayout;
    class var LayAgroupBody: TLayout;
    class var LayAgroupButton: TLayout;
    class var LineBottom: TLine;
    class var LblNameAluno: TSkLabel;
    class var LblDate: TSkLabel;
    class var LblDatePrevReturn: TSkLabel;
    class var LblDateReturn: TSkLabel;
    class var SvgStatus: TSkSvg;
    class var LblStatus: TSkLabel;
    class var LblMulta: TSkLabel;
    class var LblBookName: TSkLabel;
    class var SvgPointGreen: TSkSvg;
    class var SvgCirlceBlue: TSkSvg;
    class var SvgButtonReceive: TSkSvg;
    class var SvgButtonDelete: TSkSvg;
    class procedure OnClickReceved(Sender: TObject);
    class procedure OnClickDelete(Sender: TObject);
  Public
    class procedure CreateCard(AScroll: TVertScrollBox; AId: Integer;
      ANomeAluno, AData, APrevRetorno, ARetorno, AStatus: string; AMulta: Float32;
      AColorStatus: TAlphaColor; AListaLivro: TArray<TBookData>);
    class procedure ClearList(AScroll: TVertScrollBox);
  end;

implementation

uses Widgets, Movement.Settings;

class procedure TListMoviment.ClearList(AScroll: TVertScrollBox);
var
  I: Integer;
begin
  for I := AScroll.Content.ChildrenCount - 1 downto 0 do
  begin
    if AScroll.Content.Children[I] is TRectangle then
    begin
     if TRectangle(AScroll.Content.Children[I]).TagString = 'Card' then
       AScroll.Content.RemoveObject(AScroll.Content.Children[I]);
    end;
  end;
end;

class procedure TListMoviment.CreateCard(AScroll: TVertScrollBox; AId: Integer;
      ANomeAluno, AData, APrevRetorno, ARetorno, AStatus: string; AMulta: Float32;
      AColorStatus: TAlphaColor; AListaLivro: TArray<TBookData>);
begin
  RectCountainer := TRectangle.Create(nil);
  RectCountainer.Height := 133;
  RectCountainer.Align := TAlignLayout.Top;
  RectCountainer.Margins.Left := 20;
  RectCountainer.Margins.Right := 20;
  RectCountainer.Margins.Top := 20;
  RectCountainer.HitTest := True;
  RectCountainer.Fill.Color := TAlphaColors.White;
  RectCountainer.Stroke.Kind := TBrushKind.None;
  RectCountainer.Position.Y := AScroll.Content.Height + 500;
  AScroll.Content.Height := AScroll.Content.Height + RectCountainer.Height;
  RectCountainer.TagString := 'Card';
  RectCountainer.XRadius := 10;
  RectCountainer.YRadius := 10;

  ShadowCard := TShadowEffect.Create(RectCountainer);
  ShadowCard.Distance := 3;
  ShadowCard.Direction := 45;
  ShadowCard.Softness := 0.3;
  ShadowCard.Opacity := 0.100000001490116100;
  ShadowCard.ShadowColor := TAlphaColors.Black;
  ShadowCard.Parent := RectCountainer;

  LayAgroupTop := TLayout.Create(RectCountainer);
  LayAgroupTop.Height := 39;
  LayAgroupTop.Margins.Bottom := 5;
  LayAgroupTop.Align := TAlignLayout.MostTop;
  LayAgroupTop.Parent := RectCountainer;

  LineBottom := TLine.Create(LayAgroupTop);
  LineBottom.Height := 1;
  LineBottom.Align := TAlignLayout.MostBottom;
  LineBottom.LineType := TLineType.Bottom;
  LineBottom.Stroke.Thickness := 0.2;
  LineBottom.Stroke.Color := $FF595959;
  LineBottom.Parent := LayAgroupTop;

  LblNameAluno := TSkLabel.Create(LayAgroupTop);
  LblNameAluno.Align := TAlignLayout.MostLeft;
  LblNameAluno.Margins.Left := 20;
  LblNameAluno.AutoSize := False;
  LblNameAluno.Text := '      ' + ANomeAluno;
  LblNameAluno.Width := 180;
  LblNameAluno.TextSettings.Font.Families := 'Poppins';
  LblNameAluno.TextSettings.Font.Size := 16;
  LblNameAluno.TextSettings.FontColor := TAlphaColors.Black;
  LblNameAluno.TextSettings.Font.Weight := TFontWeight.Regular;
  LblNameAluno.Parent := LayAgroupTop;

  LblDate := TSkLabel.Create(LayAgroupTop);
  LblDate.Align := TAlignLayout.None;
  LblDate.HitTest := False;
  LblDate.Margins.Left := 10;
  LblDate.AutoSize := False;
  LblDate.Text := '      ' + AData;
  LblDate.Width := 124;
  LblDate.TextSettings.Font.Families := 'Poppins';
  LblDate.TextSettings.Font.Size := 16;
  LblDate.TextSettings.FontColor := TAlphaColors.Black;
  LblDate.TextSettings.Font.Weight := TFontWeight.Regular;
  LblDate.Parent := LayAgroupTop;

  LblDatePrevReturn := TSkLabel.Create(LayAgroupTop);
  LblDatePrevReturn.Align := TAlignLayout.None;
  LblDatePrevReturn.HitTest := False;
  LblDatePrevReturn.Margins.Left := 20;
  LblDatePrevReturn.AutoSize := False;
  LblDatePrevReturn.Text := '      ' + APrevRetorno;
  LblDatePrevReturn.Width := 124;
  LblDatePrevReturn.TextSettings.Font.Families := 'Poppins';
  LblDatePrevReturn.TextSettings.Font.Size := 16;
  LblDatePrevReturn.TextSettings.FontColor := TAlphaColors.Black;
  LblDatePrevReturn.TextSettings.Font.Weight := TFontWeight.Regular;
  LblDatePrevReturn.Parent := LayAgroupTop;

  LblDateReturn := TSkLabel.Create(LayAgroupTop);
  LblDateReturn.HitTest := False;
  LblDateReturn.Margins.Left := 10;
  LblDateReturn.AutoSize := False;
  if ARetorno = '30/12/1899' then
   LblDateReturn.Text := '      AR'
  else
  LblDateReturn.Text := '      ' + ARetorno;
  LblDateReturn.Width := 124;
  LblDateReturn.TextSettings.Font.Families := 'Poppins';
  LblDateReturn.TextSettings.Font.Size := 16;
  LblDateReturn.TextSettings.FontColor := TAlphaColors.Black;
  LblDateReturn.TextSettings.Font.Weight := TFontWeight.Regular;
  LblDateReturn.Parent := LayAgroupTop;

  SvgStatus := TSkSvg.Create(LayAgroupTop);
  SvgStatus.Align := TAlignLayout.Right;
  SvgStatus.Margins.Right := 20;
  SvgStatus.Margins.Left := 10;
  SvgStatus.Margins.Top := 12;
  SvgStatus.Margins.Bottom := 5;
  SvgStatus.Width := 125;
  SvgStatus.Svg.OverrideColor := AColorStatus;
  SvgStatus.Svg.Source := FormWidgets.SkSvgStatus.Svg.Source;
  SvgStatus.Parent := LayAgroupTop;

  LblStatus := TSkLabel.Create(SvgStatus);
  LblStatus.Align := TAlignLayout.Client;
  LblStatus.AutoSize := False;
  LblStatus.Text := AStatus;
  LblStatus.TextSettings.Font.Families := 'Poppins';
  LblStatus.TextSettings.Font.Size := 14;
  LblStatus.TextSettings.Font.Weight := TFontWeight.SemiLight;
  LblStatus.TextSettings.HorzAlign := TSkTextHorzAlign.Center;
  LblStatus.TextSettings.FontColor := TAlphaColors.White;
  LblStatus.Parent := SvgStatus;

  LblMulta := TSkLabel.Create(LayAgroupTop);
  LblMulta.Align := TAlignLayout.Right;
  LblMulta.HitTest := False;
  LblMulta.Margins.Left := 10;
  LblMulta.Margins.Right := 10;
  LblMulta.AutoSize := False;
  LblMulta.Text := FormatFloat('R$ #,##0.00', AMulta);
  LblMulta.Width := 72;
  LblMulta.TextSettings.Font.Families := 'Poppins';
  LblMulta.TextSettings.Font.Size := 16;
  LblMulta.TextSettings.FontColor := TAlphaColors.Black;
  LblMulta.TextSettings.Font.Weight := TFontWeight.Regular;
  LblMulta.Parent := LayAgroupTop;

  SvgCirlceBlue := TSkSvg.Create(LblNameAluno);
  SvgCirlceBlue.Align := TAlignLayout.Left;
  SvgCirlceBlue.Width := 17;
  SvgCirlceBlue.Svg.Source := FormWidgets.SkSvgCircleBlue.Svg.Source;
  SvgCirlceBlue.Parent := LblNameAluno;

  SvgCirlceBlue := TSkSvg.Create(LblDatePrevReturn);
  SvgCirlceBlue.Align := TAlignLayout.Left;
  SvgCirlceBlue.Width := 17;
  SvgCirlceBlue.Svg.Source := FormWidgets.SkSvgCircleBlue.Svg.Source;
  SvgCirlceBlue.Parent := LblDatePrevReturn;

  SvgCirlceBlue := TSkSvg.Create(LblDate);
  SvgCirlceBlue.Align := TAlignLayout.Left;
  SvgCirlceBlue.Width := 17;
  SvgCirlceBlue.Svg.Source := FormWidgets.SkSvgCircleBlue.Svg.Source;
  SvgCirlceBlue.Parent := LblDate;

  SvgCirlceBlue := TSkSvg.Create(LblDateReturn);
  SvgCirlceBlue.Align := TAlignLayout.Left;
  SvgCirlceBlue.Width := 17;
  SvgCirlceBlue.Svg.Source := FormWidgets.SkSvgCircleBlue.Svg.Source;
  SvgCirlceBlue.Parent := LblDateReturn;

  LayAgroupBody := TLayout.Create(RectCountainer);
  LayAgroupBody.Align := TAlignLayout.Client;
  LayAgroupBody.Parent := RectCountainer;

  LayAgroupButton := TLayout.Create(LayAgroupBody);
  LayAgroupButton.Align := TAlignLayout.MostRight;
  LayAgroupButton.Margins.Right := 15;
  LayAgroupButton.Width := 108;
  LayAgroupButton.Parent := LayAgroupBody;

  for var I := 0 to Length(AListaLivro) - 1 do
  begin
    LblBookName := TSkLabel.Create(LayAgroupBody);
    LblBookName.Align := TAlignLayout.Top;
    LblBookName.HitTest := False;
    LblBookName.Margins.Left := 20;
    LblBookName.Margins.Top := 5;
    LblBookName.AutoSize := False;
    LblBookName.Text := '      ' + AListaLivro[I].NomeLivro;
    LblBookName.Tag := AListaLivro[I].Id;
    LblBookName.Height := 15;
    LblBookName.TextSettings.Font.Families := 'Poppins';
    LblBookName.TextSettings.Font.Size := 13;
    LblBookName.TextSettings.FontColor := TAlphaColors.Black;
    LblBookName.TextSettings.Font.Weight := TFontWeight.SemiLight;
    LblBookName.Parent := LayAgroupBody;

    SvgPointGreen := TSkSvg.Create(LblBookName);
    SvgPointGreen.Align := TAlignLayout.Left;
    SvgPointGreen.Width := 17;
    SvgPointGreen.Svg.Source := FormWidgets.SkSvgPointGreen.Svg.Source;
    SvgPointGreen.Svg.OverrideColor := $FF1CAF77;
    SvgPointGreen.Parent := LblBookName;
  end;

  SvgButtonReceive := TSkSvg.Create(LayAgroupButton);
  SvgButtonReceive.Align := TAlignLayout.MostTop;
  SvgButtonReceive.HitTest := True;
  SvgButtonReceive.Height := 36;
  SvgButtonReceive.Svg.Source := FormWidgets.SkSvgReceived.Svg.Source;
  SvgButtonReceive.tag := AId;
  SvgButtonReceive.OnClick := OnClickReceved;
  SvgButtonReceive.Parent := LayAgroupButton;

  SvgButtonDelete := TSkSvg.Create(LayAgroupButton);
  SvgButtonDelete.Align := TAlignLayout.Top;
  SvgButtonDelete.HitTest := True;
  SvgButtonDelete.Height := 36;
  SvgButtonDelete.Svg.Source := FormWidgets.SkSvgDeleteCard.Svg.Source;
  SvgButtonDelete.tag := AId;
  SvgButtonDelete.OnClick := OnClickDelete;
  SvgButtonDelete.Parent := LayAgroupButton;

  LblDateReturn.Align := TAlignLayout.Left;
  LblDatePrevReturn.Align := TAlignLayout.Left;
  LblDate.Align := TAlignLayout.Left;
  LblMulta.Align := TAlignLayout.Right;


  RectCountainer.Parent := AScroll;
  RectCountainer.Align  := TAlignLayout.Top;

end;

class procedure TListMoviment.OnClickDelete(Sender: TObject);
begin
  TMovementSettings.DeleteItemCard(Sender);
end;

class procedure TListMoviment.OnClickReceved(Sender: TObject);
begin
  TMovementSettings.ReceivedBooks(Sender);
end;

end.
