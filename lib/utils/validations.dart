class Validations {
  static bool emailValidator(String email) {
    bool emailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    return emailValid;
  }

  static bool passwordValidator(String password) {
    bool passwordValidator =
    RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$').hasMatch(password);
    return passwordValidator;
  }
}
