unit CAtribEntity;

interface

// nome da tabela
type
  TableName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

// rota na API para acessar o cadastro
type
  Route = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(aName: string);
    property Name: string read FName write FName;
  end;

  // campo chave(codigo)
type
  KeyField = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(aName: string);
    property Name: string read FName write FName;
  end;

  // nome do campo
type
  FieldName = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(aName: string);
    property Name: string read FName write FName;
  end;


implementation

constructor TableName.Create(aName: string);
begin
  FName := aName;
end;

constructor KeyField.Create(aName: string);
begin
  FName := aName;
end;

constructor FieldName.Create(aName: string);
begin
  FName := aName;
end;

constructor Route.Create(aName: string);
begin
  FName := aName;
end;

end.
