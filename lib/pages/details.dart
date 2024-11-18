import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/service/database.dart';
import 'package:test/service/shared_pref.dart';
import 'package:test/widget/widget_support.dart';

class Details extends StatefulWidget {
  String image, name, detail , price;
  Details({required this.detail, required this.image, required this.name , required this.price});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a=1, total=0;
  String? id;

getthesharedpref()async{
  id=await SharedPreferenceHelper().getUserId();
  setState(() {

  });
}

ontheload()async{
  await getthesharedpref();
  setState(() {

  });
}

  @override
  void initState() {
    super.initState();
    ontheload();
    total=int.parse(widget.price);
  }
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(

        body:Container(

          margin: EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined,color:Colors.black)),
              Image.network(widget.image,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height/3,fit:BoxFit.fill),
              SizedBox(height: 15,),

              Row(

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,style: AppWidget.semiBoldTextFieldStyle(),),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: (){
                      if(a>1){
                        --a;
                        total=total-int.parse(widget.price);
                      }

                      setState(() {

                      });
                    },
                    child: Container(

                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.remove,color: Colors.white,),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Text(a.toString(),style: AppWidget.semiBoldTextFieldStyle(),),
                  SizedBox(width:20 ,),
                  GestureDetector(
                    onTap: (){
                      ++a;
                      total=total+int.parse(widget.price);
                      setState(() {

                      });
                    },
                    child: Container(

                      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                      child: Icon(Icons.add,color: Colors.white,),
                    ),
                  )
                ],),
              SizedBox(height: 20,),
              Text(widget.detail,style:AppWidget.LightTextFieldStyle() ,
              ),
              SizedBox(height: 30,),
              Row(children: [
                Text("Delivery Time",style: AppWidget.LightTextFieldStyle(),),
                Icon(Icons.alarm,color: Colors.black54,),
                SizedBox(width: 5,),
                Text("30 min",style: AppWidget.semiBoldTextFieldStyle(),)
              ],),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price ",style: AppWidget.semiBoldTextFieldStyle(),),
                        Text("\$"+total.toString(),style: AppWidget.boldTextFieldStyle(),)
                      ],),
                    GestureDetector(
                      onTap: ()async{
                        Map<String, dynamic> addFoodToCart={
                          "Name" : widget.name,
                          "Quantity": a.toString(),
                          "Total":total.toString(),
                          "Image":widget.image
                        };
                        await DatabaseMethods().addFoodToCart(addFoodToCart, id!);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.orangeAccent,
                            content: Text(
                              "Food Added to Cart",
                              style: TextStyle(fontSize: 18.0),
                            )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.black),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'Poppins'),),
                            SizedBox(width: 40,),
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(8)),
                              child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                            )
                          ],),
                      ),
                    )
                  ],),
              )
            ],),
        )
    );
  }
}