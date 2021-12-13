import 'package:flutter/material.dart';
import 'package:sample_vid/utils/colors.dart';
import 'package:sample_vid/utils/styles.dart';

class CommonTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool obscureText;
  final Widget? prefix;
  final Widget? sufix;
  final String? errorText;
  final FormFieldValidator? validator;
  final FormFieldSetter? onSaved;
  final ValueChanged? onChanged;
  final TextInputType? keyboardtype;
  final TextEditingController? textEditingController;
  final double hPadding;
  final bool lines;
  final int? minline;
  final int? maxline;

  // ignore: use_key_in_widget_constructors
  const CommonTextField({
    this.title,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
    this.onSaved,
    this.prefix,
    this.sufix,
    this.textEditingController,
    this.validator,
    this.hint,
    this.keyboardtype,
    this.lines = false,
    this.hPadding = 40,
    this.minline,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding,
      ),
      child: SizedBox(
        height: 45,
        width: 326,
        child: TextFormField(
          keyboardType: keyboardtype,
          obscureText: obscureText,
          controller: textEditingController,
          validator: validator,
          onChanged: onChanged,
          onSaved: onSaved,
          style: tsS14Black,
          decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: sufix,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 14.0, color: color707173),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            errorText: errorText,
            errorStyle: tsS12fc0404,
            fillColor: colorffffff,
            filled: true,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
