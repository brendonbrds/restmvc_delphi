program restMVC;

uses
  Vcl.Forms,
  CAtribEntity in 'core\DAO\CAtribEntity.pas',
  UEntity in 'core\DAO\UEntity.pas',
  BaseModel in 'src\Models\BaseModel.pas',
  ProxyService in 'src\Services\ProxyService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
