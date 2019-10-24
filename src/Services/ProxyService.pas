unit ProxyService;

interface

uses
  REST.Client, REST.Types, System.JSON, System.Classes, System.SysUtils,
  Vcl.Forms;

type
  TProxyService = class
    private
      RestClient : TRESTClient;
      Request: TRESTRequest;
      Response: TRESTResponse;
      BaseURL: string;
      Token: string;
      procedure AfterConstruction; override;
      procedure Auth;
    public
      constructor Create(AServidor, APorta: string);

  end;

implementation

{ TProxyService }

procedure TProxyService.AfterConstruction;
begin
  inherited;
  RestClient := TRESTClient.Create(nil);
  Request    := TRESTRequest.Create(nil);
  Response   := TRESTResponse.Create(nil);

  Request.Client   := RestClient;
  Request.Response := Response;

  Self.Auth;
end;

procedure TProxyService.Auth;
const
  _username = 'estagiario';
  _passwd = '@D5estagio2019';
  _authRoute = 'autenticacao';
var
  jsObj, jsObjRecord: TJSONObject;
  jsStream: TStringStream;
begin
  RestClient.BaseURL := Self.BaseURL + '/' + _authRoute;
  RestClient.AddParameter('username', _username);
  RestClient.AddParameter('password', _passwd);

  Request.Method := rmGET;

  try
    Request.Execute;
  except on E: Exception do
    Application.MessageBox('Erro ao executar método de autenticação', '.: ERRO :.', 64);
  end;

  jsStream := TStringStream.Create(Response.JSONText);
  jsObj := TJSONObject.Create;
  jsObj.Parse(jsStream.Bytes, 0);

  Self.Token := jsObj.GetValue('token').Value;
end;

constructor TProxyService.Create(AServidor, APorta: string);
begin
  BaseURL := 'http://' + AServidor + ':' + APorta;
end;

end.
