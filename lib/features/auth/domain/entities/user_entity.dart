import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String name;
  final String uId;

  const UserEntity(
      {required this.email, required this.name, required this.uId});

  @override
  List<Object?> get props => throw UnimplementedError();
}
