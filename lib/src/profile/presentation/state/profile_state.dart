import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spotify/src/profile/domain/profile.dart';

mixin NameValidator {
  final StringValidator fullnameValidator = NameEditingRegexValidator();
  final StringValidator minLengthValidator = MinLengthStringValidator(3);
  final StringValidator nonEmptyStringValidator = NonEmptyStringValidator();
}

class ProfileState {
  ProfileState({
    this.profile = const AsyncValue.data(null),
  });

  final AsyncValue<Profile?> profile;

  bool get isLoading => profile.isLoading;

  ProfileState copyWith({
    AsyncValue<Profile>? profile,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
    );
  }
}

/// The code below contains some helper functions used for string validation.

abstract class StringValidator {
  bool isValid(String value);
}

class RegexValidator implements StringValidator {
  RegexValidator({required this.regexSource});
  final String regexSource;

  @override
  bool isValid(String value) {
    try {
      final RegExp regex = RegExp(regexSource);
      final Iterable<Match> matches = regex.allMatches(value);
      for (final match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      // Invalid regex
      assert(false, e.toString());
      return true;
    }
  }
}

class ValidatorInputFormatter implements TextInputFormatter {
  ValidatorInputFormatter({required this.editingValidator});
  final StringValidator editingValidator;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final bool oldValueValid = editingValidator.isValid(oldValue.text);
    final bool newValueValid = editingValidator.isValid(newValue.text);
    if (oldValueValid && !newValueValid) {
      return oldValue;
    }
    return newValue;
  }
}

class NameEditingRegexValidator extends RegexValidator {
  NameEditingRegexValidator() : super(regexSource: '^(|\\S)+\$');
}

class NonEmptyStringValidator extends StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class MinLengthStringValidator extends StringValidator {
  MinLengthStringValidator(this.minLength);
  final int minLength;

  @override
  bool isValid(String value) {
    return value.length >= minLength;
  }
}
