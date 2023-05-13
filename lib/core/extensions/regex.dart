extension EmailValidator on String? {
  bool emailValid() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this ?? '');
  }

  bool nameValid() {
    return RegExp(r'[(a-zA-Z)]').hasMatch(this ?? "");
  }

  bool urlValid() {
    return RegExp(
            r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?")
        .hasMatch(this ?? '');
  }

  bool phoneValid() {
    return RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(this ?? "");
  }

  bool passwordValid() {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(this ?? '');
  }
}
