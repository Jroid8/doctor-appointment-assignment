class EmailValidator {
  static final _emailRegex = RegExp(
    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  static bool isValid(String? input) {
    if (input == null || input.isEmpty) {
      return false;
    } else {
      return _emailRegex.hasMatch(input);
    }
  }

  static String? validate(String? input) {
    return isValid(input) ? null : "Invalid Email";
  }
}
