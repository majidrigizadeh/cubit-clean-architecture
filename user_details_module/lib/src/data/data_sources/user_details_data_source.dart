import 'package:user_details_module/src/data/models/user_model.dart';

abstract class UserDetailsDataSource {
  Future<UserModel> fetchUserDetails();
  Future<bool> submitPhoneNumber(String phoneNumber);
}