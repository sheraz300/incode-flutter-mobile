

// Remember Input Formatters can be chained so their order matters
// means output of 1st formatter is used in 2nd formatter.
import 'package:flutter/services.dart';

class InputFormat {
  static final numberFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(
      8,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final itemNoFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(
      8,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final quantityFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(
      5,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final storeDocFileNameFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),
    LengthLimitingTextInputFormatter(
      76,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];
  static final memoFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]")),
    LengthLimitingTextInputFormatter(
      76,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final decimalNumberFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
    LengthLimitingTextInputFormatter(
      15,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
    // OR
    // FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d*'))
  ];

  static final changePrice = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'^[-,+]?\d*\.?\d{0,2}'))
  ];

  static final taxPercentage = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'^[-,+]?\d*\.?\d{0,2}')),
    LengthLimitingTextInputFormatter(
      6,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final phoneNumberFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^\+?\d*')),
    LengthLimitingTextInputFormatter(
      10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final emailFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(RegExp(r'[/\\]')),
    LengthLimitingTextInputFormatter(
      100,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  // Only allow 2 decimal place number
  static final priceInput = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
    LengthLimitingTextInputFormatter(
      10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  // Only allow 3 decimal place number
  static final price3dp = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,3})')),
    LengthLimitingTextInputFormatter(
      10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final checkAmountInput = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
    LengthLimitingTextInputFormatter(
      9,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final cost = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,4})')),
  ];

  static final mixMatchCost = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,4})')),
    LengthLimitingTextInputFormatter(
      14,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final mathExpression = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp("[0-9-+/*]")),
    LengthLimitingTextInputFormatter(
      20,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final denySpace = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(RegExp(r'\s')),
  ];

  static final denyStartSpace = <TextInputFormatter>[NoLeadingSpaceFormatter()];
  static final temperatureFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'^[-,+]?\d*\.?\d{0,2}')),
    LengthLimitingTextInputFormatter(
      6,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];
  static final alcoholFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      4,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];
  static final nameFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      40,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];
  static final businessNameFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      40,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];
  static final firstNameFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];
  static final lastNameFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final faxFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(
      15,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final addressFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      65,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final cityFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final stateFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final zipFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(
      10,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final accountNumFormatter = <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final salesmanNameFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final managerNameFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      25,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final noteFormatter = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(
      4000,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final checkInput = <TextInputFormatter>[
    FilteringTextInputFormatter.deny(',', replacementString: '.'),
    FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
    LengthLimitingTextInputFormatter(
      9,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
  ];

  static final ipAddress = <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp("[0-9.]")),
    LengthLimitingTextInputFormatter(
      15,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
    ),
    IpAddressInputFormatter(),
  ];
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String trimedText = newValue.text.trimLeft();

      return TextEditingValue(
        text: trimedText,
        selection: TextSelection(
          baseOffset: trimedText.length,
          extentOffset: trimedText.length,
        ),
      );
    }

    return newValue;
  }
}

class IpAddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    int dotCounter = 0;
    var buffer = StringBuffer();
    String ipField = "";

    for (int i = 0; i < text.length; i++) {
      if (dotCounter < 4) {
        if (text[i] != ".") {
          ipField += text[i];
          if (ipField.length < 3) {
            buffer.write(text[i]);
          } else if (ipField.length == 3) {
            if (int.parse(ipField) <= 255) {
              buffer.write(text[i]);
            } else {
              if (dotCounter < 3) {
                buffer.write(".");
                dotCounter++;
                buffer.write(text[i]);
                ipField = text[i];
              }
            }
          } else if (ipField.length == 4) {
            if (dotCounter < 3) {
              buffer.write(".");
              dotCounter++;
              buffer.write(text[i]);
              ipField = text[i];
            }
          }
        } else {
          if (dotCounter < 3) {
            buffer.write(".");
            dotCounter++;
            ipField = "";
          }
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}