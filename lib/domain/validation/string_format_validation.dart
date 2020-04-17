
import 'package:finished_notes_firebase_ddd_course/domain/validation/password_validator.dart';

class StringFormatValidation{

  static String validateEmail(String email) {
    if(email.isEmpty){
      return "Please enter email";
    }else if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return null;
    }else{
      return "Please enter a vaild email";
    }
  }

  static String validatePassword(String password) {
    if(password.isEmpty){
      return "Please enter password";
    }else if (PasswordValidator.isPasswordTooShort(password, 8)) {
      return "Password must be at least 8 characters";
    } else if (!PasswordValidator.hasAtLeastANumber(password)) {
      return "Password must contain at least one number.";
    } else if (!PasswordValidator.hasAtLeastOneUpperCase(password)) {
      return "Password must contain at least one upper case";
    } else if (!PasswordValidator.hasAtleastOnSpecialChar(password)) {
      return "Password must contain at least one special character.";
    } else if (!PasswordValidator.notContainsInvalidCharacter(password)) {
      return "Allowed special characters are ~!@#\$%^&*()`_+<>.,:;=-?.";
    }
    return null;
  }
}