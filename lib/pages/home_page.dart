import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalogapp/models/cart.dart';
import 'package:flutter_catalogapp/pages/home_details_page.dart';
import 'package:flutter_catalogapp/utils/routes.dart';
import 'package:flutter_catalogapp/widgets/MyTheme.dart';
import 'package:flutter_catalogapp/widgets/drawer.dart';
import 'package:flutter_catalogapp/models/catalog.dart';
import 'package:flutter_catalogapp/widgets/item_widget.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async
  {
      await Future.delayed(Duration(seconds: 2));
      var catalogjson = await rootBundle.loadString("assets/files/catalog.json");
      var decodedData = jsonDecode(catalogjson);
      var productsData = decodedData["products"];
      CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.CartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.shopping_cart,color: Colors.white,),
      ).py0(),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CatalogHeader(),
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                Center(child: CircularProgressIndicator()).expand()
            ],
          ),
        ),
      )
    );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context,index){
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(
              catalog: catalog,
            ))),
              child: CatalogItem(catalog: catalog)
          );

        }
    );
  }
}

class CatalogItem extends StatelessWidget {

  final Item catalog;

  const CatalogItem({Key key,@required this.catalog}) : assert(catalog != null),super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).box.rounded.p8.color(context.canvasColor).make().p16().w40(context)
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalog.name.text.lg.color(context.theme.accentColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      _AddToCart(catalog: catalog)
                    ],
                  ).pOnly(right: 8.0)
                ],
              )
          )
        ],
      )
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalog;

  const _AddToCart({
    Key key, this.catalog,
}) : super(key: key);

  @override
  __AddToCartState createState() => __AddToCartState();
}

class __AddToCartState extends State<_AddToCart> {

   bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        isAdded = isAdded.toggle();

        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {

        });
      },
      child: isAdded? Icon(Icons.done): "Add To Cart".text.make(),
      color: context.theme.buttonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ).w(100);
  }
}





