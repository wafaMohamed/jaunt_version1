
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaunt/utilities/themes/apptheme.dart';
import 'package:jaunt/view/pages/Auth/loginScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';


class unloginBookingScreen extends StatefulWidget {
  const unloginBookingScreen({Key? key}) : super(key: key);

  @override
  State<unloginBookingScreen> createState() => _unloginBookingScreenState();
}

class _unloginBookingScreenState extends State<unloginBookingScreen> {
  List<String> tabs = [
    "Pending",
    "Ongoing",
    "History",
  ];
  int current = 0;
  double changePositionedOfLine(){
    switch (current){
      case 0:
        return 9;
      case 1:
        return 118;
      case 2:
        return 229;
      default:
        return 0;

    }
  }
  double changeContainerWidth(){
    switch (current){
      case 0:
        return 72;
      case 1:
        return 75;
      case 2:
        return 66;
      default:
        return 0;

    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              '               Your',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: AppTheme.purplewight,
                  shadows: [
                    Shadow(color: AppTheme.purpleDark),
                  ]),
            ),
            Text(
              '  Booking',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Montserrat',
                  color: AppTheme.purpleMedium),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false ,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppTheme.purpleLight, AppTheme.purplewight],
                begin: Alignment.topLeft,
                end: Alignment.topRight),
          ),
        ),
      ),

      // Custom Tab Bar
      body:
      SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child:SizedBox(
                      height: size.height * 0.04,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tabs.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: Padding(
                              padding:  EdgeInsets.only(top: 10,left:  index==0?37:43),
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: current == index ? 16 : 14,
                                  fontWeight: current == index
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: current ==index?AppTheme.purpleMedium:AppTheme.purpleDark,
                                  fontFamily: 'Montserrat',

                                ),
                              ),
                            ),
                          );
                        },),

                    ) ,
                  ),
                  AnimatedPositioned(
                    bottom: 0,
                    left: changePositionedOfLine(),
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: const Duration(milliseconds: 200),
                    child: AnimatedContainer(
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: const EdgeInsets.only(left: 30),
                      duration: const Duration(milliseconds: 500),
                      width: changeContainerWidth(),
                      height: size.height * 0.003,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppTheme.purpleMedium,
                      ),
                    ),

                  ),

                ],
              ),

            ),
            Padding(
                padding:  EdgeInsets.only(top: 12.h),
                child: Column(
                  children: [
                    LottieBuilder.network(
                      'https://assets5.lottiefiles.com/packages/lf20_7vph1npx.json',
                      height: 300,
                      fit: BoxFit.cover,
                      reverse: true,
                      repeat: true,
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.center ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Please login to view your ${tabs[current]} ',style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        Text('and #GetThingsDone',style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                      ],
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen(),
                            ));
                      },
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppTheme.purpleMedium,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ]),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                  ],
                )
            ),
          ],
        ),
      ),

    );
  }
}
