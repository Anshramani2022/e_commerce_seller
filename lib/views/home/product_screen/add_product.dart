import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home/product_screen/component/product_drop_down.dart';
import 'package:emart_seller/views/home/product_screen/component/product_images.dart';
import 'package:emart_seller/views/widget/common_textfield.dart';
import 'package:emart_seller/views/widget/text_style.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: boldText(text: "Add Product", color: white, size: 16.0),
        actions: [
          TextButton(
              onPressed: () {},
              child: boldText(text: "Save", size: 16.0, color: white)),
          10.widthBox
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(hint: "eg. BMW", label: "Product Name"),
              10.heightBox,
              customTextField(
                  hint: "eg. Nice Product", label: "Description", isdesc: true),
              10.heightBox,
              customTextField(hint: "eg. \$100", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. Quentity", label: "Quentity"),
              10.heightBox,
              ProductDropdown(),
              10.heightBox,
              ProductDropdown(),
              10.heightBox,
              normalText(text: "Choose Product images"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => ProductImages(label: "${index + 1}")),
              ),
              5.heightBox,
              normalText(
                  text: "First Image will be your display image",
                  color: lightGrey),
              5.heightBox,
              normalText(text: "choose product color", color: lightGrey),
              5.heightBox,
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                    9,
                    (index) => Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            VxBox()
                                .color(Vx.randomPrimaryColor)
                                .roundedFull
                                .size(50, 50)
                                .make(),
                            Icon(
                              Icons.done,
                              color: white,
                            )
                          ],
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
