import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    this.passwordField = false,
  }) : super(key: key);

  final String labelText;
  final bool passwordField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hideText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hideText,
      decoration: InputDecoration(
        filled: true,
        labelText: widget.labelText,
        labelStyle: GoogleFonts.ptSans(color: Colors.black),
        fillColor: const Color(0xffF5F5F7),
        suffixIcon: widget.passwordField
            ? IconButton(
                onPressed: () => setState(() => hideText = !hideText),
                icon: Icon(
                  hideText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
