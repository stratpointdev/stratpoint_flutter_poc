class PasswordValidator {

  static bool isPasswordValid(String password){
    if(password.length > 8 && hasAtleastOnSpecialChar(password) &&
        RegExp(r".*[0-9]").hasMatch(password)&& RegExp(r".*[A-Z]").hasMatch(password)
        &&PasswordValidator.notContainsInvalidCharacter(password)){
      return true;
    }else{
      return false;
    }
  }


  static bool isPasswordTooShort(String pass, int minLength) {
    if (pass.length < minLength) {
      return true;
    }
    return false;
  }

  static bool notContainsInvalidCharacter(String pass) {
    if (RegExp(r'.*[\\"]').hasMatch(pass)|RegExp(r".*[\//']").hasMatch(pass)) {
      return false;
    }
    return true;
  }

  static bool hasAtleastOnSpecialChar(String pass) {
    if (RegExp(r".*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~.!@#$&*]").hasMatch(pass)) {
      return true;
    }
    return false;
  }

  static bool hasAtLeastANumber(String pass) {
    if (RegExp(r".*[0-9]").hasMatch(pass)) {
      return true;
    }
    return false;
  }

  static bool hasAtLeastOneUpperCase(String pass) {
    if (RegExp(r".*[A-Z]").hasMatch(pass)) {
      return true;
    }
    return false;
  }
}