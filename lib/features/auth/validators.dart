import 'package:to_do_app/core/utils/shared_packages.dart';

String? validateEmail (String? value) {
RegExp emailRegex = RegExp(
r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
bool result = emailRegex.hasMatch(value ?? '');
return result ? null : 'Enter Valid Email';
}


String? validatePassword (value) {
if (value == null || value.length < 6) {
return 'password must be at least 6 characters';
}
String pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
RegExp regExp = RegExp(pattern);

if (!regExp.hasMatch(value)) {
return "Missing 1 Uppercase, 1 Lowercase, 1 Number";
}

return null;
}
