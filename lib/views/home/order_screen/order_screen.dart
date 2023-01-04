import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home/order_screen/order_detail.dart';
import 'package:emart_seller/views/widget/appbar_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../widget/text_style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: orders),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(20, (index) {
              return ListTile(
                tileColor: textfieldGrey,
                onTap: () {
                  Get.to(() => const OrderDetail());
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: boldText(text: "765567890987654", color: purpleColor),
                subtitle: Column(
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: fontGrey,
                        ),
                        5.widthBox,
                        boldText(
                            text:
                                intl.DateFormat.yMMMd().format(DateTime.now()),
                            color: fontGrey)
                      ],
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.payment,
                          color: fontGrey,
                        ),
                        5.widthBox,
                        boldText(text: "UnPaid", color: red)
                      ],
                    ),
                  ],
                ),
                trailing:
                    boldText(text: "\$40.0", color: purpleColor, size: 16.0),
              ).box.margin(EdgeInsets.only(bottom: 4)).make();
            }),
          ),
        ),
      ),
    );
  }
}
