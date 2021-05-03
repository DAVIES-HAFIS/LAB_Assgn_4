import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; import 'package:wc_form_validators/wc_form_validators.dart'; import 'package:passwordfield/passwordfield.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(
          285,
          285,
          285,
          1,
        ),
        fontFamily: 'Roboto',
      ),
      home: FormPage(),
    );
  }
}
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();}
class _FormPageState extends State<FormPage>{
  bool _hasBeenPressed = false; final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
@override
  Widget build(BuildContext context) {
    return Scaffold(  backgroundColor: Color.fromRGBO(18, 20, 33, 1.0),
      body:Form(autovalidateMode: AutovalidateMode.onUserInteraction,key:_formKey, child:SizedBox(
        width: 375,
        height: 812,child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                    SizedBox(
                    height: 18,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Color.fromRGBO(255,255,255,1.0),
                      ),
                    ),
                  ),  SizedBox(
                    height: 82,
                  ),
                    SizedBox(
                      height: 16,
                      child: Text(
                        'WELCOME BACK',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 11,
                          color: Color.fromRGBO(255,255,255,1.0),
                          letterSpacing: 2.56,
                        ),
                      ),
                    ),   SizedBox(
                      height: 40,
                    ), Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                      width: 296,
                      height: 48,
                      child: Card(
                        color: Color.fromRGBO(255,255,255,1.0),
                        child:TextFormField( decoration: InputDecoration( suffixIcon: Icon(Icons.verified, color:Color.fromRGBO(74,128,240,1.0), size: 15,),
                          border: OutlineInputBorder(),
                          hintText: 'email address',
                        ),  keyboardType: TextInputType.emailAddress, validator: Validators.compose([ Validators.required('Email is required'), Validators.email('Invalid email address'),]),
                                ),
                        ),
                      ), SizedBox(height:22,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            width: 296, height: 48,
                            child: Card(
                              color: Color.fromRGBO(255,255,255,1.0),
                              child: PasswordField(pattern:r'.*[@$#.*].*',errorMessage:"must contain  special character either .* @ # ",
                              ),
                            ),),
                                  SizedBox(height: 40),     Container(
                                         width: 296,
                                          height: 48,
                                    child: ElevatedButton(
                                           style: ElevatedButton.styleFrom(
                                            primary: _hasBeenPressed ? Color.fromRGBO(29,42,74,1.0):Color.fromRGBO(74,128,240,1.0),),
                                             child: Text(
                                    'Sign in',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    ),  onPressed:(){ setState(() {_hasBeenPressed = ! _hasBeenPressed;});},onLongPress:(){ launch("https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository");},
                                    ),
                                  ),          SizedBox(
                                                 height: 28,),
                                      SizedBox(
                                          height: 16,
                                          child: InkWell( onTap: () async {
                                            if (await canLaunch("https://meet.google.com/fbq-ivom-hbw")) {
                                              await launch("https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository");
                                            }
                                          },
                                                  child: Text(
                                                    'Forgot Password?',
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.normal,
                                                      fontStyle: FontStyle.normal,
                                                      color: Color.fromRGBO(255,255,255,1.0),
                                                    ),
                                                  ),
                                                ),
                                              ),SizedBox(
                                                    height: 4,
                                                  ),
                                                  SizedBox(
                                                    height: 16, child: InkWell( onTap: () async {
                                                    if (await canLaunch("https://meet.google.com/fbq-ivom-hbw")) {
                                                      await launch("https://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository");
                                                    }
                                                  },
                                                    child: Text(
                                                      'Reset Password',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: 'Raleway',
                                                        fontWeight: FontWeight.normal,
                                                        fontStyle: FontStyle.normal,
                                                        color: Color.fromRGBO(
                                                          74,
                                                          128,
                                                          240,
                                                          1.0,
                                                        ),
                                                      ),
                                                    ),),),
                                                ],),),),),
          );
      } }

      launchURL() async { const url ='https://flutter.io'; if (await canLaunch(url)){ await launch(url);}
      }
