import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home_screen/home.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:get/get.dart';

import '../widget/ourButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              normalText(text: welcome, size: 18.0),
              20.heightBox,
              Row(
                children: [
                  Image.asset(
                    icLogo,
                    height: 70,
                    width: 70,
                  )
                      .box
                      .border(color: white)
                      .rounded
                      .padding(EdgeInsets.all(8))
                      .make(),
                  10.widthBox,
                  boldText(text: appname, size: 20.0)
                ],
              ),
              40.heightBox,
              Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: purpleColor,
                      ),
                      border: InputBorder.none,
                      hintText: emailHint,
                    ),
                  ),
                  10.heightBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: purpleColor,
                      ),
                      border: InputBorder.none,
                      hintText: passHint,
                    ),
                  ),
                  10.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: normalText(
                            text: forgotPassword, color: purpleColor)),
                  ),
                  20.heightBox,
                  SizedBox(
                      width: context.screenWidth - 100,
                      child: commonButton(
                          title: login,
                          onPress: () {
                            Get.to(() => const Home());
                          }))
                ],
              )
                  .box
                  .rounded
                  .white
                  .outerShadowMd
                  .padding(const EdgeInsets.all(8))
                  .make(),
              10.heightBox,
              Center(child: normalText(text: anyProblem, size: 10.0)),
              const Spacer(),
              Center(
                child: boldText(text: credit),
              ),
              20.heightBox
            ],
          ),
        ),
      ),
    );
  }
}
