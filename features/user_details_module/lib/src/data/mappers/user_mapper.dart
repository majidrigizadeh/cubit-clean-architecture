import 'package:user_details_module/src/data/models/user_model.dart';
import 'package:user_details_module/src/domain/entities/user.dart';

/// Mapper for transforming [UserModel] <-> [User].
class UserMapper {
  /// Convert a [UserModel] to a [User] entity.
  static User toEntity(UserModel model) {
    return User(
      name: model.name,
      email: model.email,
    );
  }

  /// Convert a [User] entity to a [UserModel].
  static UserModel toModel(User entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
    );
  }
}