class Validators {
  // Simple Iranian phone number regex: +98xxxxxxxxxx or 09xxxxxxxx
  static bool isIranianPhoneNumber(String phone) {
    final regex = RegExp(r'^(\+98|0)?9\d{9}$');
    return regex.hasMatch(phone);
  }
}