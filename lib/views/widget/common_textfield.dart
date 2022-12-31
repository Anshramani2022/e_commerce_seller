import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:flutter/services.dart';

Widget customTextField({label, hint, controller, isdesc = false}) {
  return TextFormField(
    maxLines: isdesc ? 4 : 1,
    decoration: InputDecoration(
        label: normalText(text: label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: white),
        ),
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(color: lightGrey),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: white))),
  );
}
