import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/forgotpassword.dart';
import 'package:test/pages/signup.dart';
import 'package:test/widget/widget_support.dart';

import 'bottomnav.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email="",password="";

  final _formkey= GlobalKey<FormState>();
  TextEditingController userpasswordcontroller = new TextEditingController();

  TextEditingController useremailcontroller = new TextEditingController();

  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottomnav()));

    }on FirebaseAuthException catch(e){
      if(e.code=='user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No User Found for that email",style: TextStyle(fontSize :18,color: Colors.black))));
      }else if(e.code=='wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password Provided By User",style: TextStyle(fontSize :18,color: Colors.black))));
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child:Stack(children: [
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2.5,
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFff5c30),Color(0xFFe74b1a),
                ])),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
          height: MediaQuery.of(context).size.height/2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
          child: Text(""),
        ),

        Container(
          margin: EdgeInsets.only(top: 30,left: 20,right: 20),
          padding: EdgeInsets.only(left: 20,right: 20),
          child:
          SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Center(
                    child: Image.asset("images/logo.png",width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        email=useremailcontroller.text;
                        password=userpasswordcontroller.text;
                      });
                    }
                    userLogin();
                  },
                  child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                        child:Form(
                          key: _formkey,
                          child: Column(children: [
                            SizedBox(height: 60,),
                            Text("Login",style: AppWidget.HeadLineTextFieldStyle(),),
                            TextFormField(
                              controller: useremailcontroller,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return ' Please Enter Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(hintText: 'Email',hintStyle: AppWidget.semiBoldTextFieldStyle(),prefixIcon: Icon(Icons.email_outlined)),
                            ),
                            SizedBox(height: 30,),
                            TextFormField(
                              obscureText: true,
                              controller: userpasswordcontroller,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return ' Please Enter Password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(hintText: 'Password',hintStyle: AppWidget.semiBoldTextFieldStyle(),prefixIcon: Icon(Icons.password_outlined)),
                            ),
                            SizedBox(height: 20,),
                            SingleChildScrollView(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                                },
                                child: Container(
                                    alignment: Alignment.topRight,
                                    child: Text("Forgot Password?",style: AppWidget.semiBoldTextFieldStyle(),)),
                              ),
                            ),
                            SizedBox(height: 60,),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  width: 200,
                                  decoration: BoxDecoration(color: Color(0xffff5722),borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18,fontFamily: 'Poppins',fontWeight: FontWeight.bold),))),),
                          ]),
                        ),
                      )),
                ),
                SizedBox(height: 70,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUp()));
                    },
                    child: Text("Don't have an account? Sign up",style: AppWidget.semiBoldTextFieldStyle(),)),

              ],),
            ),),
        ),

      ],),
      ),
    );
  }
}