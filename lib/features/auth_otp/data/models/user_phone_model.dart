import 'package:awoke_learning_app/features/auth_otp/domain/entities/user_phone_entity.dart';

class UserPhoneModel extends UserPhoneEntity {
  UserPhoneModel({required super.phone});

  Map<String, dynamic> toJson() => {"phone": phone};
}
