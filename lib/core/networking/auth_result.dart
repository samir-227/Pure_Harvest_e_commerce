import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

class SocialSignInResult {
  final UserEntity user;
  final bool isNewUser;

  SocialSignInResult({required this.user, required this.isNewUser});
}