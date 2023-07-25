import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String userName;


  const User({
    required this.id,
    required this.userName,
  });

  @override
  List<Object?> get props =>
      [id, userName];
}
