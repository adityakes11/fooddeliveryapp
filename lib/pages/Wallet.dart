import 'package:flutter/material.dart';
import 'package:test/widget/widget_support.dart';
class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          margin: EdgeInsets.only(top: 60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Material(
                  elevation: 2,
                  child: Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Center(child: Text("Wallet",style: AppWidget.HeadLineTextFieldStyle(),)))),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
                  child: Row(
                    children: [
                      Image.asset("images/wallet.png",height: 60,width: 60,fit: BoxFit.cover,),
                      SizedBox(width: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Your Wallet",style: AppWidget.LightTextFieldStyle(),),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "\$" + "100",
                            style: AppWidget.boldTextFieldStyle(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Add money",
                    style: AppWidget.HeadLineTextFieldStyle(),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE9E2E2)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "\$" + "100",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE9E2E2)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "\$" + "500",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE9E2E2)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "\$" + "1000",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFE9E2E2)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "\$" + "2000",
                          style: AppWidget.semiBoldTextFieldStyle(),
                        ),
                      ),
                    ]),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 12,),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF008080),borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text('Add Money',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Poppins',fontWeight: FontWeight.bold),),),
                )
              ]),
        ));
  }
}