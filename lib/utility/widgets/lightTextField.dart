import 'package:flutter/material.dart';

class LightTextField extends StatelessWidget {
  final String hintText;
  final bool enabled;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool suffix;
  final bool obscure;
  final inputFormatter;
  final Color hintColor;
  final int minLines;
  final int maxLines;
  final IconData suffixIcon;
  final Function suffixFunc;
  LightTextField({
    @required this.hintText,
    this.enabled = true,
    this.suffix = false,
    this.obscure = false,
    this.inputFormatter,
    this.minLines = 1,
    this.suffixFunc,
    this.suffixIcon = Icons.cancel,
    this.maxLines = 10,
    this.textInputType = TextInputType.text,
    this.hintColor,
    @required this.controller
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Stack(
        children: [
          TextField(
            keyboardType: textInputType,
            inputFormatters: inputFormatter,
            controller: controller,
            enabled: enabled,
            minLines: minLines,
            obscureText: obscure,
            maxLines: obscure ? 1 :  maxLines,
            decoration: InputDecoration(
                labelText: hintText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD2D2D2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD2D2D2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD2D2D2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD2D2D2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,

                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffD2D2D2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5)
            ),
          ),
          suffix ? Positioned(
            right: 10,
            child: IconButton(
              onPressed: suffixFunc == null ? (){controller.clear();} : suffixFunc,
              icon: Icon(
                Icons.cancel,
                color: Color(0xffD2D2D2),
              ),
            ),
          ) : SizedBox()
        ],
      ),
    );
  }
}
