import 'dart:convert';

import 'package:fruits_hub/core/constants/constants.dart';
import 'package:fruits_hub/core/helpers/cache_helper.dart';
import 'package:fruits_hub/features/auth/data/models/user_model.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';


UserEntity getUserDataFromCache() {
  var jsonString =  CacheHelper.getString(key: kUserData) ;
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}