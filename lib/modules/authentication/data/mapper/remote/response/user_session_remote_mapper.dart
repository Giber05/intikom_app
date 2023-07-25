import 'package:intikom_app/infrastructure/types/mapper/json_mapper.dart';
import 'package:intikom_app/modules/authentication/domain/model/user_session.dart';
import 'package:intikom_app/modules/user/domain/models/user.dart';

class UserSessionRemoteResMapper implements FromJSONMapper<UserSession> {
  @override
  UserSession toModel(json) {
    final userJSON = json["user"];
    return UserSession(
      token: json["token"],
      user: User(
        id: userJSON['id'],
        userName: userJSON['userName'],
      ),
      expiredTime: DateTime(2024),
    );
  }
}
