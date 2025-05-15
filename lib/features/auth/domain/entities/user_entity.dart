import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String name;
  final String uId;
  final String? imageUrl;

  const UserEntity( 
      {this.imageUrl, required this.email, required this.name, required this.uId});

  @override
  List<Object?> get props => throw UnimplementedError();
}
