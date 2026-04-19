String? validateEmail(String? value) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool result = emailRegex.hasMatch(value ?? '');
  return result ? null : 'Enter Valid Email';
}

String? validatePassword(value) {
  if (value == null || value.length < 6) {
    return 'password must be at least 6 characters';
  }
  String pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return "Min 6 chars, upper, lower, number & symbol";
  }

  return null;
}
