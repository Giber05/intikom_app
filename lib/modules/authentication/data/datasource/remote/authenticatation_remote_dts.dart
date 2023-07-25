import 'package:injectable/injectable.dart';
import 'package:intikom_app/infrastructure/client/api_client.dart';
import 'package:intikom_app/modules/authentication/data/mapper/remote/request/login_request_mapper.dart';
import 'package:intikom_app/modules/authentication/data/mapper/remote/response/user_session_remote_mapper.dart';
import 'package:intikom_app/modules/authentication/domain/model/user_session.dart';
import 'package:intikom_app/modules/user/domain/models/user.dart';

abstract class AuthenticationRemoteDTS {
  Future<APIResult<UserSession>> login(
      {required String username, required String password});

  Future<APIResult<int>> logout(
      {required String username, required String token});
}

@Injectable(as: AuthenticationRemoteDTS)
class AuthenticationRemoteDTSImpl implements AuthenticationRemoteDTS {
  final APIClient _ufClient;

  AuthenticationRemoteDTSImpl(this._ufClient);
  final mockLogin = {
    "message": "Login Berhasil",
    "status": true,
    "data": {
      "user": {"id": '1', "userName": 'Gilang'},
      "token": "mockUserTokenForTestPurpose"
    }
  };
  final mockLogout = {
    "message": "Logout Berhasil",
    "status": true,
    "data": {"logoutStatus": 1}
  };
  @override
  Future<APIResult<UserSession>> login(
          {required String username, required String password}) =>
      _ufClient.post(
          path: '/Account/Login',
          shouldPrint: true,
          body: LoginRemoteReqMapper((password: password, username: username))
              .toJSON(),
          mapper: (json) => UserSessionRemoteResMapper().toModel(json["data"]),
          mockResult: MockedResult(result: mockLogin));

  @override
  Future<APIResult<int>> logout(
          {required String username, required String token}) =>
      _ufClient.post(
          path: '/logout',
          token: token,
          body: {"username": username},
          mapper: (json) => json["data"]["logoutStatus"],
          mockResult: MockedResult(result: mockLogout));
}
