
import 'package:flutter/material.dart';

class LargeRoundedTextFormField extends StatelessWidget { 
  const LargeRoundedTextFormField({Key? key,this.enabled = true , required this.editingController, this.focusNode, this.onFieldSubmitted, this.validator, this.hintText, this.keyboardType, this.textInputAction, this.suffixWidget, this.textCapitalization = TextCapitalization.sentences, this.errorStyle}) : super(key: key);

  final bool enabled;
  final TextEditingController editingController;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? suffixWidget;
  final TextCapitalization textCapitalization; 
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: validator,
      controller: editingController,
      textCapitalization: textCapitalization,
      textAlign: TextAlign.left,
      keyboardType: TextInputType.text,
      maxLines: 5,
      decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffixIcon: suffixWidget,
          filled: true,
        ),
    );
  }
}