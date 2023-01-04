import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home/order_screen/component/order_placed_detail.dart';
import 'package:emart_seller/views/widget/ourButton.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetail extends StatelessWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: boldText(text: "Order Detail", color: fontGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child:
            commonButton(color: green, title: "Confirm order", onPress: () {}),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              //order delivery section
              Visibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: "Order Status: ", size: 16.0, color: fontGrey),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Confirmed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "On delivered", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Delivered", color: fontGrey),
                    ),
                  ],
                ).box.outerShadowSm.white.border(color: lightGrey).make(),
              ),
              //order detail saction
              Column(
                children: [
                  orderPlaceDetails(
                      d1: "data['order_code']",
                      d2: "data['shipping_method']",
                      title1: "Order Code",
                      title2: "Shipping Method"),
                  orderPlaceDetails(
                      // d1: intl.DateFormat()
                      //     .add_yMMMEd()
                      //     .format(("data['order_date'].toDate()")),
                      d1: "data['payment_method']",
                      d2: "data['payment_method']",
                      title1: "Order Date",
                      title2: "Payment Method"),
                  orderPlaceDetails(
                      d1: "UnPaid",
                      d2: "Order Placed",
                      title1: "Payment Status",
                      title2: "Delivery Status"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Shipping Address".text.fontFamily(semibold).make(),
                            boldText(text: "Shipping Adress", color: fontGrey),
                            "{data['order_by_name']}".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            "{data['order_by_postelcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          height: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "total Amount", color: purpleColor),
                              boldText(
                                  text: "\$3000.00", color: red, size: 16.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).box.outerShadowSm.white.border(color: lightGrey).make(),
              Divider(),
              10.heightBox,
              boldText(text: "Ordered Product", color: fontGrey),
              10.heightBox,
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return Column(
                    children: [
                      orderPlaceDetails(
                          d1: "data['order_code']",
                          d2: "data['shipping_method']",
                          title1: "Order Code",
                          title2: "Shipping Method"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 20,
                          width: 30,
                          color: Colors.red,
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(EdgeInsets.only(bottom: 4))
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}
