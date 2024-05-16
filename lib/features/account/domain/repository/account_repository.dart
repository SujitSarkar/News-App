import '../model/user_model.dart';

abstract class AccountRepository {
  Future<UserModel?> getCurrentUser();
}
