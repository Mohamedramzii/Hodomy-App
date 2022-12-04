import 'package:flutter/material.dart';

import 'custom_text.dart';

class Custom_TextFormField extends StatelessWidget {
  // final String headerText;
  final String hinttext;
  final Color hintcolor;
  final FormFieldSetter<String> onsave;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardtype;
  final Icon icon;
  final bool obsecure;
  final Widget icon2;
  // final TextEditingController controller;
  const Custom_TextFormField({
    Key? key,
    required this.hinttext,
    this.hintcolor = Colors.grey,
    required this.onsave,
    required this.validator,
    this.keyboardtype = TextInputType.text,
    required this.icon,
    required this.icon2, required this.obsecure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
        TextFormField(
        // maxLength: 10,
      
          onSaved:  onsave,
          validator: validator,
          keyboardType: keyboardtype,
          obscureText: obsecure,
          decoration: InputDecoration(
              prefixIcon: icon,
              suffixIcon: icon2,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)
              ),
              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)
              ),
              hintText: hinttext,
              hintStyle: TextStyle(color: hintcolor),
              fillColor: Colors.grey[200],
              filled: true),
        ),
      ],
    );
  }
}
