import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widget/appbar_widget.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:intl/intl.dart' as intl;

import '../../widget/dashboard_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,
                    title: product, count: "60", icon: icProducts),
                dashBoardButton(context,
                    title: orders, count: "20", icon: icOrders)
              ],
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashBoardButton(context,
                    title: rating, count: "4.1", icon: icStar),
                dashBoardButton(context,
                    title: totalSell, count: "45", icon: icShopSetting)
              ],
            ),
            10.heightBox,
            Divider(
              thickness: 2,
            ),
            10.heightBox,
            boldText(text: popular, size: 15.0, color: fontGrey),
            20.heightBox,
            ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(3, (index) {
                return ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    imgProduct,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(text: "Product Title", color: fontGrey),
                  subtitle: normalText(text: "\$14.0", color: darkGrey),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
