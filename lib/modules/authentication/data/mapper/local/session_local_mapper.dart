import 'package:intikom_app/infrastructure/architecutre/local_mapper.dart';
import 'package:intikom_app/modules/authentication/domain/model/user_session.dart';
import 'package:intikom_app/modules/user/domain/models/user.dart';

class SessionLocalMapper extends LocalMapper<UserSession, dynamic> {
  SessionLocalMapper();

  @override
  UserSession toDomain(entity) {
    final userJSON = entity["user"];
    return UserSession(
      token: entity["token"],
      expiredTime: DateTime.parse(entity["expiredTime"]),
      user: User(
        id: userJSON['id'],
        userName: userJSON['userName'],
        
      ),
    );
  }

  @override
  toEntity(UserSession domain) {
    return {
      "token": domain.token,
      "expiredTime": domain.expiredTime.toString(),
      "user": {
        'id': domain.user.id,
        'userName': domain.user.userName,
        
      }
    };
  }
}
