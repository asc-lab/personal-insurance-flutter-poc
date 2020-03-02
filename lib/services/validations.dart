class Validations {
  static String required(dynamic value) {
    if (value == null || value == "") {
      return "Field required";
    }

    return null;
  }
}
