import 'package:flutter/material.dart';
import 'package:flutter_catalogapp/models/catalog.dart';
import 'package:flutter_catalogapp/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {

  final Item catalog;

  const HomeDetailPage({Key key,@required this.catalog}) :assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red500.make(),
            RaisedButton(
              onPressed: (){},
              child: "Add To Cart".text.make(),
              color: context.theme.buttonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      backgroundColor: context.theme.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context).p16(),
            Expanded(
                child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                           children: [
                             catalog.name.text.xl4.color(context.accentColor).bold.make(),
                             catalog.desc.text.lg.textStyle(context.captionStyle).xl.bold.make(),
                             10.heightBox,
                             "A catalog is a list or record of items. It sometimes spelled catalogue. It commonly refers to a list of things being offered, such as items for sale or buy. It is a list or record of items."
                                 .text.textStyle(context.captionStyle).lg.make().p16()
                           ]
                      ).py64(),
                    )
                )
            )
          ],
        ),
      ),
    );
  }
}
