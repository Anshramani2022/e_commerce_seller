import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widget/text_style.dart';

Widget ProductDropdown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: "Choose Category", color: fontGrey),
      value: null,
      isExpanded: true,
      items: [],
      onChanged: (value) {},
    ),
  ).box.rounded.white.make();
}
