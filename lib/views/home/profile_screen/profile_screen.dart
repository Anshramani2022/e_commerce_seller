import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home/profile_screen/edit_profle_screen.dart';
import 'package:emart_seller/views/home/profile_screen/shop_setting.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:get/get.dart';

import '../../widget/appbar_widget.dart';
import 'message/message_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: setting, size: 18.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
              icon: const Icon(
                Icons.edit,
                color: white,
              )),
          TextButton(onPressed: () {}, child: boldText(text: logout)),
          5.widthBox
        ],
      ),
      body: Column(children: [
        ListTile(
          leading: Image.asset(icLogo).box.rounded.clip(Clip.antiAlias).make(),
          title: boldText(text: "vendor name"),
          subtitle: normalText(text: "vendor@email.com"),
        ),
        Divider(),
        10.heightBox,
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: List.generate(
                2,
                (index) => ListTile(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Get.to(() => const ShopSetting());
                            break;
                          case 1:
                            Get.to(() => const MessageScreen());
                            break;
                        }
                      },
                      leading: Icon(
                        profileButtonIconList[index],
                        color: white,
                      ),
                      title: normalText(text: profileButtonTitle[index]),
                    )),
          ),
        )
      ]),
    );
  }
}
