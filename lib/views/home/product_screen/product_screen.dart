import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controller/product_controller.dart';
import 'package:emart_seller/services/store_services.dart';
import 'package:emart_seller/views/home/product_screen/add_product.dart';
import 'package:emart_seller/views/home/product_screen/product_detail.dart';
import 'package:emart_seller/views/widget/appbar_widget.dart';
import 'package:emart_seller/views/widget/loading_indicator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../widget/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: purpleColor,
          onPressed: () async {
            await controller.getCategories();
            controller.popularCategories();
            Get.to(() => AddProduct());
          },
          child: Icon(
            Icons.add,
          )),
      appBar: appBarWidget(title: product),
      body: StreamBuilder(
        stream: StoreServices.getProduct(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(data.length, (index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => ProductDetail(
                              data: data[index],
                            ));
                      },
                      leading: Image.network(
                        data[index]['p_images'][0],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      title: boldText(
                          text: "${data[index]['p_name']}", color: fontGrey),
                      subtitle: Row(
                        children: [
                          normalText(
                              text: "\$${data[index]['p_prices']}",
                              color: darkGrey),
                          10.widthBox,
                          boldText(
                              text: data[index]['is_featured'] == true
                                  ? "Featured"
                                  : "",
                              color: green)
                        ],
                      ),
                      trailing: VxPopupMenu(
                          child: const Icon(Icons.more_vert_rounded),
                          menuBuilder: () => Column(
                              children: List.generate(
                                  popupMenuTitle.length,
                                  (i) => Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              popupMenuIconList[i],
                                              color: data[index]
                                                              ['featured_id'] ==
                                                          currentUser!.uid &&
                                                      i == 0
                                                  ? green
                                                  : darkGrey,
                                            ),
                                            10.widthBox,
                                            normalText(
                                                text: popupMenuTitle[i],
                                                color: darkGrey)
                                          ],
                                        ).onTap(() {}),
                                      ))).box.white.rounded.width(200).make(),
                          clickType: VxClickType.singleClick),
                    );
                  }),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
