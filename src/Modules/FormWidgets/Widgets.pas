unit Widgets;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Skia, FMX.Skia;

type
  TFormWidgets = class(TForm)
    SkSvgBackStatus: TSkSvg;
    SkSvgBorderLvMoviment: TSkSvg;
    SkSvgCircleBlue: TSkSvg;
    SkSvgDelete: TSkSvg;
    SkSvgStatus: TSkSvg;
    SkLabel27: TSkLabel;
    SkSvgPointGreen: TSkSvg;
    SkSvgReceived: TSkSvg;
    SkSvgDeleteCard: TSkSvg;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWidgets: TFormWidgets;

implementation

{$R *.fmx}

end.
