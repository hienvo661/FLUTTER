import 'package:flutter/material.dart';

class CutomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String hintText;
  final bool isSecret;

  CutomTextField(
      {Key? key,
      required this.icon,
      required this.label,
      required this.hintText,
      this.isSecret = false})
      : super(key: key);

  @override
  State<CutomTextField> createState() => _CutomTextFieldState();
}

class _CutomTextFieldState extends State<CutomTextField> {
  bool isObscure = false;
  @override
  void initState() {
    isObscure = widget.isSecret;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        suffixIcon: widget.isSecret
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null, //hiện icon hiển thị pass ở mục password
        labelText: widget.label,
        hintText: widget.hintText,
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      ),
    );
  }
}
