import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({Key? key, this.enabled = true, required this.editingController, this.onFieldSubmitted, this.hintText,this.keyboardType =  TextInputType.name, this.obscureText = false, this.suffixWidget, this.validator, this.textCapitalization = TextCapitalization.words, this.autofocus = false,this.inputFormatters = const [], this.onChanged}) : super(key: key);

  final bool enabled;
  final TextEditingController editingController;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixWidget;
  final TextCapitalization textCapitalization; 
  final bool autofocus;
  final List<TextInputFormatter> inputFormatters;
 
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      obscureText: obscureText,
      enabled: enabled,
      controller: editingController,
      textAlign: TextAlign.left,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
        ),
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        suffixIcon: suffixWidget,
        filled: true,
      ),
      validator: validator,
    );

  }
}