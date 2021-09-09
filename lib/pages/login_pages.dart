import 'package:flutter/material.dart';
import 'package:flutter_catalogapp/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    String name="";
    final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: new SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/undraw_secure_login_pdn4.png",fit: BoxFit.cover),
              SizedBox(
                height: 20,
              ),

              Text("Welcome $name ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter User Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.5
                        ))
                      ),
                    validator: (value) {
                        if(value.isEmpty)
                          {
                            return "Please enter UserName";
                          }
                        return null;
                    },
                    onChanged: (value){
                        name = value;
                        setState(() {

                        });
                    },
                    ),
                    Padding(padding: const EdgeInsets.only(top: 20)),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 1.5
                              ))
                      ),
                      validator: (value) {
                        if(value.isEmpty)
                        {
                          return "Please enter Password";
                        }
                        else if(value.length < 6)
                        {
                          return "Password length should be atleast 6";
                        }
                          return null;
                      },
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: RaisedButton(
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  child: Text("Login"),
                  onPressed: () {
                    if(_formkey.currentState.validate()){
                      Navigator.pushNamed(context, MyRoutes.HomeRoute);
                    }
                  },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

