import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test/pages/contentmodel.dart';
import 'package:test/pages/signup.dart';
import 'package:test/widget/widget_support.dart';
class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex=0;
  late PageController _controller;

  @override
  void initState(){
    _controller= PageController(initialPage: 0);

    super.initState();
  }

  void dispose(){
    super.dispose();
    _controller.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [
        Expanded(
          child:  PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index){
                setState(() {
                  currentIndex= index;
                });
              },
              itemBuilder: (_,i){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(contents[i].animationPath,height:350,width: MediaQuery.of(context).size.width/1 ,fit: BoxFit.cover,),
                    SizedBox(height: 80,),
                    Text(contents[i].title,style: AppWidget.semiBoldTextFieldStyle(),),
                    SizedBox(height: 60,),
                    Text(contents[i].description,style: AppWidget.LightTextFieldStyle(),)

                  ],
                );
              }),
        ),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length,(index)=> buildDot(index,context),
              ),
            )),
        GestureDetector(
          onTap: (){
            if(currentIndex==contents.length-1){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
            }
            _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
            height: 60,
            margin: EdgeInsets.all(40),
            width: double.infinity,
            child: Center(child: Text(
              currentIndex==contents.length-1?"Start":"Next",style: TextStyle(color: Colors.white,fontSize: 20,
                fontWeight: FontWeight.bold),)),
          ),
        )
      ],) ,
    );
  }
  Container  buildDot( int index, BuildContext context){
    return Container(
      height: 10,
      width: currentIndex==index?18:7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
    );
  }

}