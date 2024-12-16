class ValidationHelper {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@')) {
      return 'Email must contain "@"';
    } else if (!value.contains('.')) {
      return 'Email must contain a "." after "@"';
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Enter a valid email address, e.g., name@example.com';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Password is required';
    return null;
  }
}
