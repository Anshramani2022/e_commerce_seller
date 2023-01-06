import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controller/auth_controller/auth_controller.dart';
import 'package:emart_seller/controller/profile_controller.dart';
import 'package:emart_seller/services/store_services.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:emart_seller/views/home/profile_screen/edit_profle_screen.dart';
import 'package:emart_seller/views/home/profile_screen/shop_setting.dart';
import 'package:emart_seller/views/widget/loading_indicator.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:get/get.dart';

import '../../widget/appbar_widget.dart';
import 'message/message_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: setting, size: 18.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => EditProfileScreen(
                      username: controller.snapshotData['vendor_name'],
                    ));
              },
              icon: const Icon(
                Icons.edit,
                color: white,
              )),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
                Get.offAll(() => const LoginScreen());
              },
              child: boldText(text: logout)),
          5.widthBox
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circlecolor: white);
          } else {
            controller.snapshotData = snapshot.data!.docs[0];
            return Column(children: [
              ListTile(
                leading: controller.snapshotData['imageUrl'] == ''
                    ? Image.asset(
                        imgProduct,
                        fit: BoxFit.cover,
                        width: 115,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.network(
                        controller.snapshotData['imageUrl'],
                        fit: BoxFit.cover,
                        width: 115,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                title:
                    boldText(text: "${controller.snapshotData['vendor_name']}"),
                subtitle:
                    normalText(text: "${controller.snapshotData['email']}"),
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
                                  Get.to(() => MessageScreen());
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
            ]);
          }
        },
      ),
    );
  }
}
