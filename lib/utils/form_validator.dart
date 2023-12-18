import 'package:quizzy_app/utils/validation.dart';

class FormValidator {
  static FormValidator? _instance;
  static FormValidator get instance => _instance ??= FormValidator._();
  FormValidator._();

  /// The error message for invalid email input.
  final String _invalidEmailError = 'Please enter a valid email address';
  final String _invalidPhoneError = 'Please enter a valid phone number';

  /// The error message for empty email input.
  final String _emptyEmailInputError = 'Please enter an email';
  final String _emptyPhoneInputError = 'Please enter an phone';
  final String _emptyEmailOrPhoneInputError =
      'Please enter an email or Password';
  final String _invalidEmailOrPhoneInputError =
      'Please enter an valid email or Password';

  /// The error message for empty password input.
  final String _emptyPasswordInputError = 'Please enter a password';

  /// The error message for invalid confirm password input.
  final String _invalidConfirmPwError = "Passwords don't match";

  /// The error message for invalid current password input.
  final String _invalidCurrentPwError = 'Invalid current password!';

  /// The error message for invalid new password input.
  final String _invalidNewPwError = "Current and new password can't be same";

  /// The error message for invalid name input.
  final String _invalidNameError = 'Please enter a valid Name ';
  final String _invalidAnyTextForm = 'Please enter a Valid ';

  /// A method containing validation logic for email input.
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return _emptyEmailInputError;
    } else if (!Validation.instance.isEmail(email: email)) {
      return _invalidEmailError;
    }
    return null;
  }

  String? contactsValidator(String? contact, {bool startPlusCode = false}) {
    if (contact == null || contact.isEmpty) {
      return _emptyPhoneInputError;
    } else if (!Validation.instance
        .isContacts(contact: contact, startPlusCode: startPlusCode)) {
      return _invalidPhoneError;
    }
    return null;
  }

  /// A method containing validation logic for password input.
  String? passwordValidator(String? password) {
    if (password!.isEmpty) return _emptyPasswordInputError;
    return null;
  }

  /// A method containing validation logic for confirm password input.
  String? confirmPasswordValidator(String? confirmPw, String inputPw) {
    if (confirmPw == inputPw) return null;
    return _invalidConfirmPwError;
  }

  /// A method containing validation logic for current password input.
  String? currentPasswordValidator(String? inputPw, String currentPw) {
    if (inputPw == currentPw) return null;
    return _invalidCurrentPwError;
  }

  /// A method containing validation logic for new password input.
  String? newPasswordValidator(String? newPw, String currentPw) {
    if (newPw!.isEmpty) {
      return _emptyPasswordInputError;
    } else if (newPw == currentPw) {
      return _invalidNewPwError;
    }
    return null;
  }

  /// A method containing validation logic for name input.
  String? nameValidator(String? name) {
    if (name != null && Validation.instance.isName(name: name)) return null;
    return _invalidNameError;
  }

  String? anyTextFormValidator(String? value, String nameOfTextField) {
    if (value == null || value.isEmpty) {
      return "$_invalidAnyTextForm $nameOfTextField";
    }

    return null;
  }

  String? validatePhoneOrEmail(String? value, {bool startPlusCode = false}) {
    if (value == null || value.isEmpty) {
      return _emptyEmailOrPhoneInputError;
    } else if (!(Validation.instance.isEmail(email: value) ||
        Validation.instance
            .isContacts(contact: value, startPlusCode: startPlusCode))) {
      return _invalidEmailOrPhoneInputError;
    }
    return null;
  }

  void clear() {
    _instance = null;
  }
}
