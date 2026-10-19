import 'package:flutter/cupertino.dart';

class Validation {
  static String? validateName(String value) {
    if (value.isEmpty || value == null) {
      return 'Please enter your name';
    }
    return null;
  }

  static bool _isEmailValid(String email) {
    // Basic email validation using regex
    // You can implement more complex validation if needed
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!_isEmailValid(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String value,
      {TextEditingController? passwordController}) {
    if (value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (value != passwordController?.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!_isValidPhoneNumber(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static bool _isValidPhoneNumber(String phoneNumber) {
    // Define the regex pattern for a valid phone number
    const pattern = r'^[+]?[0-9]{10,13}$';
    final regex = RegExp(pattern);

    // Check if the phone number matches the pattern
    return regex.hasMatch(phoneNumber);
  }

  static String? validateDropdown(String? value) {
    if (value == null) {
      return 'Please select an option';
    }
    return null; // Valid selection
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required';
    }
    if (!RegExp(r'^\d$').hasMatch(value)) {
      return 'Must be a digit';
    }
    return null; // Valid input
  }
}
