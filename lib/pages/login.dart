import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../widgets/circle.dart';
import '../widgets/input_text.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey= GlobalKey<FormState>();

  @override
  void initState() {

    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }
  _submit(){
    _formKey.currentState.validate();

  }

  @override
  Widget build(BuildContext context) {

    final size= MediaQuery.of(context).size;
    return Scaffold(

      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[

              Positioned(
                  right: -size.width*0.22,
                  top: -size.width*0.36,
                  child: Circle(
                    radius: size.width*0.45,
                    colors: [
                      Colors.pink,
                      Colors.pinkAccent
                    ],
                  )
              ),
              Positioned(
                  left: -size.width*0.15,
                  top: -size.width*0.35,
                  child: Circle(
                    radius: size.width*0.35,
                    colors: [
                      Colors.orange,
                      Colors.deepOrange
                    ],
                  )
              ),
              SingleChildScrollView(
                  child:  Container(
                    width: size.width,
                    height: size.height,
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                width: 90,
                                height: 90,
                                margin: EdgeInsets.only(top:size.width*0.3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(color: Colors.black26,blurRadius: 25)
                                    ]),
                              ),
                              SizedBox(height: 30),
                              Text("Hello again.\nWelcome back",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 340,
                                  minWidth: 340,
                                ),
                                child: Form(child: Column(
                                  key: _formKey,
                                  children: <Widget>[
                                    InputText(label: "Email ADDRESS",
                                        inputType: TextInputType.emailAddress,
                                        validator:(String text){
                                          if(text.contains("@")){
                                            return null;
                                          }
                                          return "Invalid Email";
                                        }
                                    ),
                                    SizedBox(height: 30,),
                                    InputText(label: "PASSWORD",
                                      isSecure: true,
                                      validator: (String text){
                                        if(text.isNotEmpty && text.length>5){
                                          return null;
                                        }
                                        return "Invalid Password";
                                      }
                                    )
                                  ],
                                )),
                              ),
                              SizedBox(height: 50),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 340,
                                  minWidth: 340,
                                ),
                                child: CupertinoButton(
                                  padding: EdgeInsets.symmetric(vertical: 17),
                                  color: Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(5),
                                  onPressed: ()=>_submit(),
                                  child: Text("Sign in",
                                      style: TextStyle(fontSize: 20)
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("New to Friendly Desi?",
                                      style: TextStyle(fontSize: 16,color: Colors.black54)),
                                  CupertinoButton(
                                    onPressed: ()=>Navigator.pushNamed(context, "singup"),
                                    child: Text("Sign up",
                                        style: TextStyle(fontSize: 16, color: Colors.pinkAccent)),
                                  )
                                ],
                              ),
                              SizedBox(height: size.height*0.1 )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
      );

  }
}
