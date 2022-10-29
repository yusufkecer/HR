extension EmailValidator on String? {
  bool emailValid() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this ?? '');
  }

  bool nameValid() {
    return RegExp(r'[(a-zA-Z)]').hasMatch(this ?? "");
  }

  bool passwordValid() {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?).{8,}$';
    //özel karakter regexi [!@#\$&*~.]
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(this ?? '');
  }
}
