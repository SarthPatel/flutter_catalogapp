import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalogapp/models/cart.dart';
import 'package:flutter_catalogapp/widgets/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make().px(104),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {

  //final scafflodkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      //key: scafflodkey,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalprice}".text.xl5.color(context.accentColor).make(),
          30.widthBox,
          RaisedButton(
              child: "Buy".text.white.make(),
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Buying is not available yet")));
                //scafflodkey.currentState.showSnackBar(SnackBar(content: "Buying is not available yet".text.make()));
              },
              color: context.theme.buttonColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ).wh(100,50)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items?.length,
        itemBuilder: (context,index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: (){},
        ),
          title: _cart.items[index].name.text.make(),
        ),
    );
  }
}
