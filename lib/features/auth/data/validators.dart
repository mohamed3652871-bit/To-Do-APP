String? validateEmail(String? value) {
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  bool result = emailRegex.hasMatch(value ?? '');
  return result ? null : 'Enter Valid Email';
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Must contain at least 1 uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Must contain at least 1 lowercase letter';
  }

  if (!RegExp(r'\d').hasMatch(value)) {
    return 'Must contain at least 1 number';
  }

  if (!RegExp(r'[@$!%*?&]').hasMatch(value)) {
    return 'Must contain at least 1 symbol';
  }

  return null;
}