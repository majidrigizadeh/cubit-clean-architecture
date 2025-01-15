import 'package:user_details_module/src/data/data_sources/user_details_data_source.dart';
import 'package:user_details_module/src/data/models/user_model.dart';

class UserDetailsLocalDataSourceImpl implements UserDetailsDataSource {
  @override
  Future<UserModel> fetchUserDetails() async {
    // For demo, let's return a mock.
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(name: 'John Doe', email: 'john.doe@example.com');
  }

  @override
  Future<bool> submitPhoneNumber(String phoneNumber) async {
    // For demonstration, imagine sending the phone number to a remote server.
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}
