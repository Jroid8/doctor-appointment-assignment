class IncorrectPasswordResetCode implements Exception {
  @override
  String toString() {
    return "Invalid verification code";
  }
}

