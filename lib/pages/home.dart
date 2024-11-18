import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/details.dart';
import 'package:test/service/database.dart';
import 'package:test/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream=false,pizza=false,Salad=false,Burger=false;

Stream? fooditemStream;

ontheload()async{
  fooditemStream=await DatabaseMethods().getFoodItem("Pizza");
  setState(() {

  });
}

@override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(stream: fooditemStream, builder: (context, AsyncSnapshot snapshot){
      return snapshot.hasData? ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            DocumentSnapshot ds=snapshot.data.docs[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(detail: ds["Detail"],name:ds["Name"],price:ds["Price"],image: ds["Image"],)));
              },
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(right: 20,bottom: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(ds["Image"],height: 120,width: 120,fit: BoxFit.cover,)),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(ds["Name"],style: AppWidget.semiBoldTextFieldStyle(),),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("Fresh and Healthy",style: AppWidget.LightTextFieldStyle(),),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text("\$"+ds["Price"],style: AppWidget.semiBoldTextFieldStyle(),),
                              ),
                            ],
                          )
                        ]
                      ),
                    ),
                  ),
                ),
              ),
            );
          }): CircularProgressIndicator();
    });
  }

  @override
  Widget allItems() {
  return StreamBuilder(stream: fooditemStream, builder: (context, AsyncSnapshot snapshot){
    return snapshot.hasData? ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: snapshot.data.docs.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
    DocumentSnapshot ds=snapshot.data.docs[index];
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(detail: ds["Detail"],name:ds["Name"],price:ds["Price"],image: ds["Image"],)));
      },
      child: Container(
        margin: EdgeInsets.all(4),
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(ds["Image"],height: 150,width: 150,fit: BoxFit.cover,)),
                Text(ds["Name"],style: AppWidget.semiBoldTextFieldStyle(),),
                SizedBox(height: 5.0,),
                Text("Fresh and Healthy",style: AppWidget.LightTextFieldStyle(),),
                SizedBox(height: 5.0,),
                Text("\$"+ds["Price"],style:AppWidget.semiBoldTextFieldStyle() ,)
              ],),
          ),
        ),
      ),
    );
    }): CircularProgressIndicator();
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0,left: 20.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello, Buddy",
                    style: AppWidget.boldTextFieldStyle(),),
                  Container(
                    margin: EdgeInsets.only(right: 20.0),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.shopping_cart,color: Colors.white,),
                  )
                  //change1
                  //change2

                ],
              ),
              SizedBox(height: 30.0,),
              Text("Delicious Food",
                style: AppWidget.HeadLineTextFieldStyle(),),
              Text("Discover and Get Great Food",
                style: AppWidget.LightTextFieldStyle(),),
              SizedBox(height: 20.0,),
              Container(
                  margin: EdgeInsets.only(right: 20.0),
                  child: showItem()),
              SizedBox(height: 30.0,),
              Container(
                height: 270,
                  child: allItems()),
              SizedBox(height: 30,),
              allItemsVertically(),
            ],
        ),
            ),
      ),
    );
  }
  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ()async{
            icecream=true;
            pizza=false;
            Salad=false;
            Burger=false;
          fooditemStream= await DatabaseMethods().getFoodItem("Ice-cream");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: icecream?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/ice-cream.png",height: 40,width: 40,fit: BoxFit.cover,color: icecream?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async{
            icecream=false;
            pizza=true;
            Salad=false;
            Burger=false;
            fooditemStream= await DatabaseMethods().getFoodItem("Pizza");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: pizza?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/pizza.png",height: 40,width: 40,fit: BoxFit.cover,color: pizza?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()async{
            icecream=false;
            pizza=false;
            Salad=true;
            Burger=false;
            fooditemStream= await DatabaseMethods().getFoodItem("Salad");
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: Salad?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset("images/Salad.png",height: 40,width: 40,fit: BoxFit.cover,color: Salad?Colors.white:Colors.black,),
            ),
          ),
        ),
        GestureDetector(
            onTap: ()async{
              icecream=false;
              pizza=false;
              Salad=false;
              Burger=true;
              fooditemStream= await DatabaseMethods().getFoodItem("Burger");
              setState(() {

              });
            },
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(color: Burger?Colors.black:Colors.white,borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(8),
                child: Image.asset("images/Burger.png",height: 40,width: 40,fit: BoxFit.cover,color: Burger?Colors.white:Colors.black,),
              ),
            )
        ),
      ],
    );
  }
}