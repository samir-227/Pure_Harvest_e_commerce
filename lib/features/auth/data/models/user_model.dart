import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity with EquatableMixin {
  UserModel({required super.email, required super.name, required super.uId});

  factory UserModel.fromFireBase(User user) {
    return UserModel(
        email: user.email ?? '', name: user.displayName ?? '', uId: user.uid);
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'] ?? '',
        name: map['name'] ?? '',
        uId: map['uId'] ?? '');
  }

  toMap() {
    return {'email': email, 'name': name, 'uId': uId};
  }
}
