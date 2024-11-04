import 'package:form_field_validator/form_field_validator.dart';


class Validators {
  static final referralCodeValidator = MultiValidator(
    _minMaxValidator(title: 'Code', min: 8, max: 50),
  );

  static final emailValidator = MultiValidator(
    [
      // ..._minMaxValidator(title: 'Email / User Name', min: 4, max: 100),
      EmailValidator(errorText: "Enter a valid email address."),
    ],
  );

  static final inviteEmailValidator = MultiValidator(
    [
      ..._minMaxValidator(title: 'Email', min: 7, max: 100),
      EmailValidator(errorText: "Enter a valid email address."),
    ],
  );

  static final passwordValidator = MultiValidator(
    [
      ..._minMaxValidator(title: 'Password', min: 8, max: 25),
      PatternValidator(
        r'(?=.*?[#?!@$%^&*-])',
        errorText: 'At least one special character.',
      )
    ],
  );

  static final groupNameValidator = MultiValidator(
    _minMaxValidator(title: 'Group name', min: 3, max: 50),
  );

  static final vendorNameValidator = MultiValidator(
    _minMaxValidator(title: 'Vendor name', min: 3, max: 40),
  );

  static final addressValidator = MultiValidator(
    _minMaxValidator(title: 'Address', min: 8, max: 65),
  );

  static final stateValidator = MultiValidator(
    _minMaxValidator(title: 'State', min: 2, max: 25),
  );

  static final cityValidator = MultiValidator(
    _minMaxValidator(title: 'City', min: 3, max: 25),
  );

  static final taxDescValidator = MultiValidator(
    _minMaxValidator(title: 'Description', min: 3, max: 25),
  );
  static final taxNumberValidator = MultiValidator(
    _minMaxValidator(title: 'Description', min: 3, max: 8),
  );

  static final mixMatchNameValidator = MultiValidator(
    _minMaxValidator(title: 'Name', min: 3, max: 40),
  );

  static final zipValidator = MultiValidator(
    _minMaxValidator(title: 'Zip', min: 5, max: 10),
  );

  static final salesmanNameValidator = MultiValidator(
    _minMaxValidator(title: 'Salesman Name', min: 5, max: 25),
  );

  static final managerNameValidator = MultiValidator(
    _minMaxValidator(title: 'Manager Name', min: 5, max: 25),
  );
  static final departNameValidator = MultiValidator(
    _minMaxValidator(title: 'Department Name', min: 3, max: 18),
  );
  static final alcoholValidator = MultiValidator(
    _minMaxValidator(title: 'Alcohol Class', min: 1, max: 4),
  );
  static final temperatureMaxValidator = MultiValidator(
    _minMaxValidator(title: 'Threshold Max (°F)', min: 1, max: 4),
  );
  static final temperatureMinValidator = MultiValidator(
    _minMaxValidator(title: 'Threshold Min (°F)', min: 1, max: 4),
  );

  static final mainDepartNameValidator = MultiValidator(
    _minMaxValidator(title: 'Main Department Name', min: 5, max: 50),
  );

  static final ageRestrictionValidator = MultiValidator(
    _rangeValidator(title: 'Age', min: 0, max: 100),
  );

  static final defaultPercentageValidator = MultiValidator(
    _rangeValidator(title: 'Percentage', min: 0, max: 100),
  );

  static final currencyValidator = MultiValidator(
    _minMaxValidator(title: 'Any Currency Field', min: 1, max: 8),
  );

  static final depart2NameValidator = MultiValidator(
    _minMaxValidator(title: 'Department 2 Name', min: 3, max: 50),
  );

  static final phoneNo = MultiValidator(
    _minMaxValidator(title: 'Phone No.', min: 10, max: 10),
  );
  static final eslTag = MultiValidator(
    _minMaxValidator(title: 'Esl Tag', min: 3, max: 25),
  );

  static final newRole = MultiValidator(
    _minMaxValidator(title: 'User Role', min: 3, max: 30),
  );
  static final workDepartment = MultiValidator(
    _minMaxValidator(title: 'Department', min: 3, max: 30),
  );
  static final note = MultiValidator(
    _minMaxValidator(title: 'Note', min: 5, max: 200),
  );
  static final firstName = MultiValidator(
    _minMaxValidator(title: 'First Name', min: 3, max: 25),
  );
  static final sensorDesp = MultiValidator(
    _minMaxValidator(title: 'Sensor Description', min: 3, max: 25),
  );
  static final templateName = MultiValidator(
    _minMaxValidator(title: 'Template Name', min: 3, max: 25),
  );
  static final lastName = MultiValidator(
    _minMaxValidator(title: 'Last Name', min: 3, max: 25),
  );
  static final accountName = MultiValidator(
    _minMaxValidator(title: 'Account name', min: 3, max: 40),
  );
  static final businessName = MultiValidator(
    _minMaxValidator(title: 'Business name', min: 3, max: 40),
  );
  static final bankName = MultiValidator(
    _minMaxValidator(title: 'Bank name', min: 3, max: 40),
  );

  static List<TextFieldValidator> _rangeValidator({
    required String title,
    required num min,
    required num max,
  }) =>
      [
        RangeValidator(
          min: min,
          max: max,
          errorText: '$title must be between $min to $max.',
        )
      ];

  static List<TextFieldValidator> _minMaxValidator({
    required String title,
    required int min,
    required int max,
  }) =>
      [
        _minValidator(title: title, min: min),
        _maxValidator(title: title, max: max),
      ];

  static TextFieldValidator _minValidator({
    required String title,
    required int min,
  }) =>
      MinLengthValidator(
        min,
        errorText: '$title must be at least $min characters',
      );

  static TextFieldValidator _maxValidator({
    required String title,
    required int max,
  }) =>
      MaxLengthValidator(
        max,
        errorText: '$title should not be greater than $max characters.',
      );

  static bool isUserId(String text) {
    return RegExp(r'^([a-zA-Z\d]{4,})$').hasMatch(text);
  }

  static String? emailValidation(String? value) {
    if (value.toString().isNotEmpty) {
      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value!)) {
        return 'Enter valid Email';
      }
    }
    return null;
  }
}

class UnMatchValidator {
  final String errorText;

  UnMatchValidator({required this.errorText});

  String? validateMatch(String? value, String? value2) {
    if ((value?.isEmpty ?? false) || (value2?.isEmpty ?? false)) return null;

    return value != value2 ? null : errorText;
  }
}

// class DateValidatorX {
//   final String errorText;

//   DateValidatorX({required this.errorText});

//   String? afterMatch(
//     DateTime? start,
//     DateTime? end, {
//     bool checkEndDate = true,
//   }) {
//     if ((start == null) || (end == null)) return null;

//     return start.isAfter(end)
//         ? errorText
//         : checkEndDate
//             ? end.isBefore(DateTime.now())
//                 ? "Invalid date time because time is already passed"
//                 : null
//             : null;
//   }

//   String? beforeMatch(DateTime? start, DateTime? end) {
//     if ((start == null) || (end == null)) return null;

//     return start.isSameDateAndTime(end)
//         ? "Start date and End date can't be same"
//         : start.isBefore(end)
//             ? null
//             : errorText;
//   }

//   static String? rangeValidator(
//     DateTimeRange? first,
//     String? end, {
//     bool checkDayCount = false,
//     String pattern = "MMM dd, yyyy",
//   }) {
//     if (first == null || end == null) return null;

//     if (end.toDateTime(format: pattern)?.isBefore(first.end) ?? false) {
//       return 'Clone To date should be after clone from range.';
//     }

//     return null;
//   }

//   static String? rangeValidatorX(
//     DateTimeRange? first,
//     DateTimeRange? second, {
//     bool checkDayCount = false,
//   }) {
//     if (first == null || second == null) return null;

//     if (checkDayCount) {
//       int firstDayCount = first.start.difference(first.end).inDays;
//       int secondDayCount = second.start.difference(second.end).inDays;

//       if (firstDayCount != secondDayCount) {
//         return 'Clone From and Clone To days count must be same.';
//       }
//     }

//     if (first.start.isBefore(second.end) && second.start.isBefore(first.end)) {
//       return 'Clone From and Clone To range is overlapping.';
//     }

//     if (first.end.isAfter(second.start)) {
//       return 'Clone From Range must be before Clone To Range.';
//     }

//     return null;
//   }
// }

class ThresholdValidator {
  final String errorText;

  ThresholdValidator({required this.errorText});

  String? thresholdMinValidator({
    String? min,
    String? max,
  }) {
    if (min == null || max == null) return null;

    if (num.parse(min) > num.parse(max)) {
      return 'Threshold Min cannot be greater then Threshold Max.';
    }

    return null;
  }

  String? thresholdMaxValidator({
    String? min,
    String? max,
  }) {
    if (min == null || max == null) return null;

    if (num.parse(min) > num.parse(max)) {
      return 'Threshold Max cannot be less then Threshold Min.';
    }

    return null;
  }
}