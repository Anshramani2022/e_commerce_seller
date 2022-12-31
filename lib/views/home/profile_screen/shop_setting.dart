import 'package:emart_seller/const/const.dart';

import 'package:emart_seller/const/const.dart';

import '../../widget/common_textfield.dart';
import '../../widget/text_style.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: const BackButton(color: white),
        title: boldText(text: shopSetting, size: 18.0),
        actions: [
          TextButton(onPressed: () {}, child: boldText(text: save)),
          5.widthBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          customTextField(label: shopName, hint: nameHint),
          10.heightBox,
          customTextField(label: address, hint: shopAddressHint),
          10.heightBox,
          customTextField(label: mobile, hint: shopMobileHint),
          10.heightBox,
          customTextField(label: website, hint: shopWebsiteHint),
          10.heightBox,
          customTextField(label: description, hint: shopDescHint, isdesc: true),
        ]),
      ),
    );
  }
}
