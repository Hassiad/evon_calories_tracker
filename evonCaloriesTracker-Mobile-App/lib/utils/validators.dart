class Validator {
  static bool isValidEmail(String email) {
    if (email == null || email.isEmpty) return false;
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool isValidPassword(String password) {
    if (password == null || password.isEmpty) return false;
    if (password.contains(' ')) return false;
    return password.length >= 8 ? true : false;
  }

  static bool isValidField(String text) {
    if (text == null || text.isEmpty) return false;
    return text.trim().length >= 2 ? true : false;
  }

  static String emailValidator(String val) {
    if (val == null || val.isEmpty) return 'Email cannot be empty';
    if (!isValidEmail(val))
      return 'Invalid email';
    else
      return '';
  }

  static String passwordValidator(String val) {
    if (val == null) {
      return 'Password cannot be empty';
    }
    if (val.length < 8) {
      return 'Password must be 8 character long';
    }
    if (!isValidPassword(val))
      return 'Invalid password';
    else
      return '';
  }

  static String usernameValidator(String val) {
    if (val == null) {
      return 'Username cannot be empty';
    }
    if (val.contains(' ')) return 'You can\'t enter space';
    if (val.length < 2) return 'username is too short';
    return '';
  }

  static String confirmPasswordValidator(String password, String cPassword) {
    if (password == null) {
      return 'Password cannot be empty';
    }
    // print('Validator.confirmPasswordValidator: $password, $cPassword');
    if (!isValidPassword(cPassword)) return 'Invalid password';
    if (password != cPassword) return 'Password don\'t match';
    return '';
  }

  static String nameValidator(String val) {
    if (val == null || val.isEmpty) {
      return 'Name cannot be empty';
    }
    if (val.length < 2) return 'Invalid name';
    return '';
  }

  static String dateValidator(String val) {
    // print('val: date of birth: $val');
    String message;
    // print('1 => ${val == null || val.isEmpty}');
    // print('2  => ${val.isEmpty}');
    // print('3 => ${val == null}');

    if (val == null || val.isEmpty) {
      return 'Date of birth cannot be empty';
    } else {
      return '';
    }
    // print('Validator.dateValidator message: $message');
    // return message;
  }

  static String expireDateValidator(String val) {
    String message;
    if (val == null || val.isEmpty) {
      return 'Expire date cannot be empty';
    } else {
      return '';
    }
    // return message;
  }

  static String bankNameValidator(String val) {
    if (val == null || val.isEmpty) {
      return 'Bank name cannot be empty';
    }
    if (val.length < 2) return 'Invalid bank name';
    return '';
  }

  static String surnameValidator(String val) {
    if (val == null || val.isEmpty) {
      return 'Surname cannot be empty';
    }
    if (val.length < 2) return 'Invalid surname';
    return '';
  }

  static String addressValidator(String val) {
    // print('address: $val');
    if (val == null || val.isEmpty) {
      return 'Address cannot be empty';
    }
    if (val.length < 2) return 'Invalid address';
    return '';
  }

  static String amountDollarValidator(String val) {
    double amount = double.tryParse(val) ?? 0;
    // String message;
    if (val == null || val.isEmpty) {
      return 'Amount cannot be empty';
    } else if (amount < 20 || amount > 999) {
      return 'You can enter amount in range \$20-\$999';
    } else {
      return '';
    }
    // print('Validator.amountDollarValidator: $message');
    // return message;
  }

  static String amountNiraValidator(String val, String amount) {
    if (val == null || val.isEmpty) {
      return 'Amount cannot be empty';
    }
    if (double.tryParse(amount)! < 20 || double.tryParse(amount)! > 999) {
      return 'You can enter amount in range \$20-\$999';
    }
    if (val.length < 2) return 'Invalid amount';
    return '';
  }

  static String CCVValidator(String val) {
    if (val == null || val.isEmpty) {
      return 'CVV cannot be empty';
    }
    if (val.length != 3) return 'Invalid ccv';
    return '';
  }

  static String accountNumberValidator(String val) {
    if (val == null || val.isEmpty) {
      return 'Account number cannot be empty';
    }
    if (val.length == 16 || val.length == 15) return '';
    return 'Invalid Account number';
  }

  static String myAccountNumberValidator(String val) {
    if (val?.isEmpty ?? false) {
      return 'Account number cannot be empty';
    }
    if (val?.trim()?.length == 10) return '';
    return 'Invalid Account number';
  }

  static String phoneNumberValidator(String val) {
    if (val == null || val.isEmpty) {
      return 'Phone number cannot be empty';
    }
    if (val.length < 2) return 'Invalid phone number';
    return '';
  }

  static String questionValidator(String val) {
    if (val?.trim()?.isEmpty ?? true) {
      return 'Question cannot be empty';
    }
    if (val.length <= 5) return 'Question is too short!';
    return '';
  }

  static String answerValidator(String val) {
    if (val?.trim()?.isEmpty ?? true) {
      return 'Answer cannot be empty';
    }
    if (val.length <= 5) return 'Answer is too short!';
    return '';
  }

  static String websiteValidator(String val) {
    if (!RegExp(
            r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
        .hasMatch(val)) return 'Invalid Url';
    // !Uri.parse(_adVertData.webLink).isAbsolute; return 'Invalid Url';
    return '';
  }

  static String socialLinkValidator(String val) {
    if (val.contains(' ')) return 'You can\'t enter space';
    if (val.length < 2) return 'Invalid value';
    return '';
  }
}
