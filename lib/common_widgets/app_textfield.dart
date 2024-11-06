import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final String? title;
  final TextEditingController? controller;
  final String? validationKey;

  final FocusNode? focusNode;
  final bool? autofocus;

  final String? labelText;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color? labelColor;
  final TextStyle? labelStyle;
  final Color? hintColor;

  final String? hintText;
  final TextStyle? hintStyle;

  final bool? readOnly;
  final bool? enabled;
  final bool isRequired;
  final bool? obscureText;
  final String obscuringCharacter;
  final String requiredLabelCharacter;
  final Color? requiredLabelColor;

  final BoxConstraints? prefixIconConstraints;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final double? suffixIconSize;
  final Color? suffixIconColor;

  final void Function(String?)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final void Function(String?)? onSave;
  final void Function(String?)? onFieldSubmit;

  final int? maxLines;
  final int? maxLength;

  final String? Function(String?)? validator;
  final String? requiredErrorMessage;
  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;

  final Color? textColor;
  final TextStyle? textStyle;

  final Color? fillColor;
  final Color? cursorColor;
  final Color? errorColor;

  final TextCapitalization? textCapitalization;

  final double height;
  final double? width;
  final double verticalPadding;

  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final Color? disableBorderColor;
  final double? borderRadius;

  final bool onTapSelectAll;

  final double? errorFontSize;
  final InputDecoration? inputDecoration;
  final bool showValidator;
  final BorderRadius? customBorderRadius;

  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.validationKey,
    this.controller,
    this.isRequired = false,
    this.requiredLabelColor,
    this.requiredLabelCharacter = '*',
    this.labelText,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.labelColor,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.prefixIconConstraints,
    this.prefixWidget,
    this.suffixIcon,
    this.suffixWidget,
    this.suffixIconSize,
    this.suffixIconColor,
    this.obscureText,
    this.obscuringCharacter = '*',
    this.onChanged,
    this.onSuffixTap,
    this.validator,
    this.requiredErrorMessage,
    this.onSave,
    this.inputFormatters,
    this.textInputAction,
    this.autofillHints,
    this.keyboardType,
    this.onEditingComplete,
    this.onFieldSubmit,
    this.readOnly,
    this.focusNode,
    this.maxLines,
    this.maxLength,
    this.fillColor,
    this.autofocus,
    this.textCapitalization,
    this.textColor,
    this.textStyle,
    this.verticalPadding = 6,
    this.width,
    this.enableBorderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.cursorColor,
    this.errorColor,
    this.onTap,
    this.height = 8,
    this.borderRadius,
    this.onTapSelectAll = false,
    this.errorFontSize,
    this.inputDecoration,
    this.disableBorderColor,
    this.enabled,
    this.showValidator = true,
    this.customBorderRadius,
    this.hintColor,
    this.title,
  })  : assert(
          initialValue == null || controller == null,
          'Use either initialValue or controller.',
        ),
        assert(
          labelStyle == null || labelColor == null,
          'Cannot provide both a labelStyle and a labelColor\n'
          'To provide custom, use "labelStyle: TextStyle()".',
        ),
        assert(
          textStyle == null || textColor == null,
          'Cannot provide both a textStyle and a textColor\n'
          'To provide custom, use "textStyle: TextStyle()".',
        ),
        assert(
          prefixWidget == null || prefixIcon == null,
          'Cannot provide both a prefixWidget and a prefixIconData\n'
          'To provide custom, use "prefixWidget".',
        ),
        assert(
          prefixWidget == null || prefixIconColor == null,
          'Cannot provide both a prefixWidget and a prefixIconColor\n'
          'To provide custom, use "prefixWidget".',
        ),
        assert(
          suffixWidget == null || suffixIcon == null,
          'Cannot provide both a suffixWidget and a suffixIconData\n'
          'To provide custom, use "suffixWidget".',
        ),
        assert(
          suffixWidget == null || suffixIconColor == null,
          'Cannot provide both a suffixWidget and a suffixIconColor\n'
          'To provide custom, use "suffixWidget".',
        ),
        assert(
          !onTapSelectAll || onTap == null,
          'Cannot provide onTap when onTapSelectAll is true.',
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            textAlign: TextAlign.left,
            // name: validationKey ?? labelText ?? '',
            controller: controller,
            cursorColor: cursorColor ?? Colors.transparent,
            cursorRadius: const Radius.circular(32),
            cursorWidth: 2,
            decoration: buildInputDecoration2(),
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            autofocus: autofocus ?? false,
            focusNode: focusNode,
            initialValue: initialValue,
            onTap: onTap ??
                (onTapSelectAll
                    ? () {
                        controller?.selection = TextSelection(
                          baseOffset: 0,
                          extentOffset: controller?.text.length ?? 0,
                        );
                      }
                    : null),
            // onSubmitted: onFieldSubmit,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            buildCounter: (
              _, {
              required currentLength,
              maxLength,
              required isFocused,
            }) =>
                null,
            scrollPadding: const EdgeInsets.all(8),
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            onEditingComplete: onEditingComplete,
            textInputAction: textInputAction,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.disabled,
            enableSuggestions: true,
            onSaved: onSave,
            validator: (value) {
              if (isRequired && showValidator) {
                if (value?.trim().isEmpty ?? true) {
                  return 'Required *';
                }

                if (validator != null) return validator!(value?.trim());
              } else {
                if ((value?.trim().isNotEmpty ?? false) && showValidator) {
                  if (validator != null) return validator!(value?.trim());
                } else if (!showValidator) {
                  return validator?.call(value?.trim());
                }
              }

              return null;
            },
            autofillHints: autofillHints,
            keyboardType: keyboardType ?? TextInputType.name,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
            obscuringCharacter: obscuringCharacter,
            enabled: enabled ?? true,
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration2() {
    return InputDecoration(
      filled: true,
      fillColor: fillColor ?? Colors.white,
      prefixIcon: prefixWidget,
      suffixIcon: suffixWidget,
      contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 20),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 1, color: Color(0xFF7D0C16)), //<-- SEE HERE
        borderRadius: BorderRadius.circular(25),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, color: Colors.transparent), //<-- SEE HERE
        borderRadius: BorderRadius.circular(25),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, color: Colors.transparent), //<-- SEE HERE
        borderRadius: BorderRadius.circular(25),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, color: Colors.transparent), //<-- SEE HERE
        borderRadius: BorderRadius.circular(25),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            width: 1, color: Colors.transparent), //<-- SEE HERE
        borderRadius: BorderRadius.circular(10.0),
      ),
      labelStyle: const TextStyle(
        color: Color.fromARGB(255, 23, 23, 23),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: Color.fromARGB(255, 155, 146, 146),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      border: InputBorder.none,
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      label: Text(
        labelText ?? '',
        style: const TextStyle(
          color: Color(0xFF64748B),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      hintText: hintText ?? '',
    );
  }
}
