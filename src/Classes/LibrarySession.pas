unit LibrarySession;

interface

type
  TUserType = (utAluno, utAdministrador, utOperador);

  TLibrarySession = class
  private
    class var FInstance: TLibrarySession;
    FLoggedInUserID: Integer;
    FUserType: TUserType;
    constructor Create;
  public
    class function GetInstance: TLibrarySession;
    function IsUserLoggedIn: Boolean;
    procedure Login(UserID: Integer; UserType: TUserType);
    procedure Logout;
    function GetLoggedInUserID: Integer;
    function GetUserType: TUserType;
  end;

implementation

{ TLibrarySession }

constructor TLibrarySession.Create;
begin
  FLoggedInUserID := 0;
  FUserType := utAluno;
end;

class function TLibrarySession.GetInstance: TLibrarySession;
begin
  if FInstance = nil then
    FInstance := TLibrarySession.Create;
  Result := FInstance;
end;

function TLibrarySession.IsUserLoggedIn: Boolean;
begin
  Result := FLoggedInUserID <> 0;
end;

procedure TLibrarySession.Login(UserID: Integer; UserType: TUserType);
begin
  FLoggedInUserID := UserID;
  FUserType := UserType;
end;

procedure TLibrarySession.Logout;
begin
  FLoggedInUserID := 0;
end;

function TLibrarySession.GetLoggedInUserID: Integer;
begin
  Result := FLoggedInUserID;
end;

function TLibrarySession.GetUserType: TUserType;
begin
  Result := FUserType;
end;

end.

