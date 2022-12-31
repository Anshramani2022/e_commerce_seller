import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/widget/appbar_widget.dart';
import 'package:intl/intl.dart' as intl;
import '../../widget/text_style.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: purpleColor,
            onPressed: () {},
            child: Icon(
              Icons.add,
            )),
        appBar: appBarWidget(title: product),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: List.generate(20, (index) {
                return ListTile(
                  onTap: () {},
                  leading: Image.asset(
                    icProduct,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: boldText(text: "Product Title", color: fontGrey),
                  subtitle: normalText(text: "\$14.0", color: darkGrey),
                  trailing: VxPopupMenu(
                      child: const Icon(Icons.more_vert_rounded),
                      menuBuilder: () => Column(
                          children: List.generate(
                              popupMenuTitle.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      children: [
                                        Icon(popupMenuIconList[index]),
                                        10.widthBox,
                                        normalText(
                                            text: popupMenuTitle[index],
                                            color: darkGrey)
                                      ],
                                    ).onTap(() {}),
                                  ))).box.white.rounded.width(200).make(),
                      clickType: VxClickType.singleClick),
                );
              }),
            ),
          ),
        ));
  }
}
