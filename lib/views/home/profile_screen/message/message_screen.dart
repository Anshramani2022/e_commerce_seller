import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home/profile_screen/message/chat_screen.dart';
import 'package:emart_seller/views/widget/text_style.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: message, size: 18.0, color: fontGrey),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            20,
            (index) => ListTile(
              onTap: () {
                Get.to(() => const ChatScreen());
              },
              leading: const CircleAvatar(
                backgroundColor: purpleColor,
                child: Icon(
                  Icons.person,
                  color: white,
                ),
              ),
              title: boldText(text: "Username", color: fontGrey),
              subtitle: normalText(text: "Last msg", color: darkGrey),
              trailing: normalText(text: "10:45 PM", color: darkGrey),
            ),
          ),
        ),
      ),
    );
  }
}
