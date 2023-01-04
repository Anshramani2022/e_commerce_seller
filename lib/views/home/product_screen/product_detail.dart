import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: fontGrey,
        ),
        title: boldText(text: "Product title", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
              autoPlay: true,
              height: 350,
              itemCount: 3,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              itemBuilder: (context, index) {
                return Image.asset(
                  icProduct,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(size: 16.0, text: "Product Title", color: fontGrey),
                  10.heightBox,
                  Row(
                    children: [
                      normalText(text: "category", color: fontGrey),
                      10.widthBox,
                      normalText(text: "subcategory", color: fontGrey),
                    ],
                  ),
                  VxRating(
                    isSelectable: false,
                    value: 3.0,
                    onRatingUpdate: (value) {},
                    count: 5,
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  boldText(text: "\$300.00", color: fontGrey, size: 18.0),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: "Color: ".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                2,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 4))
                                    .make(),
                              ),
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child:
                                  "Quentity: ".text.color(textfieldGrey).make(),
                            ),
                            normalText(text: "20 Items", color: fontGrey)
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.shadowSm.white.make(),
                  ),
                  Divider(),
                  10.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(
                      text: "Product description are here", color: fontGrey)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
