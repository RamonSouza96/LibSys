object Dm1: TDm1
  OnCreate = DataModuleCreate
  Height = 154
  Width = 348
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 218
    Top = 40
  end
  object FdCon: TFDConnection
    AfterConnect = FdConAfterConnect
    BeforeConnect = FdConBeforeConnect
    Left = 42
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FdCon
    Left = 106
    Top = 40
  end
end
