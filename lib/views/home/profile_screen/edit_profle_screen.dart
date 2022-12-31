import 'package:emart_seller/const/const.dart';

import '../../widget/common_textfield.dart';
import '../../widget/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile, size: 18.0),
        actions: [
          TextButton(onPressed: () {}, child: boldText(text: save)),
          5.widthBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.asset(
            icProduct,
            width: 150,
          ).box.roundedFull.clip(Clip.antiAlias).make(),
          10.heightBox,
          ElevatedButton(
              onPressed: () {},
              child: normalText(text: changeImage, color: fontGrey)),
          10.heightBox,
          Divider(
            color: white,
          ),
          customTextField(label: name, hint: nameHint),
          15.heightBox,
          customTextField(label: password, hint: passHint),
          15.heightBox,
          customTextField(label: confirmpassword, hint: passHint),
        ]),
      ),
    );
  }
}
