import 'package:test/features/user_details/data/models/user_model.dart';

abstract class UserDetailsDataSource {
  Future<UserModel> fetchUserDetails();
  Future<bool> submitPhoneNumber(String phoneNumber);
}