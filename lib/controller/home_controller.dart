import 'package:emart_seller/const/firebase_const.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserName();
  }

  var navIndex = 0.obs;
  var userName = '';
  getUserName() async {
    var n = await firestore
        .collection(vendorController)
        .where('id', isEqualTo: auth.currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendor_name'];
      }
    });
    userName = n;
  }
}
