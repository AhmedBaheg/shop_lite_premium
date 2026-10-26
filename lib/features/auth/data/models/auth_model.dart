import 'package:shop_lite_premium/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String? email;
  final String? password;
  final String? name;

  UserModel({required this.email, required this.password, this.name});

  factory UserModel.fromEntity(UserEntity entity){
    return UserModel(email: entity.email, password: entity.password, name: entity.name);
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
    };
  }
}