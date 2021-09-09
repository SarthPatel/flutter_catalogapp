import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text("Sarth Patel"),
                    accountEmail: Text("SarthPatel7760@gmail.com"),
                    currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("assets/images/imagess.jpeg"),),
                )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
              title: Text("Home",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
              title: Text("Profile",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail,color: Colors.white,),
              title: Text("Email Me",style: TextStyle(color: Colors.white),textScaleFactor: 1.2,),
            )
          ],
        ),
      ),
    );
  }
}
