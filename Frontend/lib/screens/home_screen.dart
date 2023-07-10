import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      // mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Container(
          // padding: const EdgeInsets.only(left: 10,),
          // margin: const EdgeInsets.only(top: 0),
          alignment: Alignment.topLeft,
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height/2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("asset/images/welcome.png"))),
          // child: InkWell(
          //     onTap: () {
          //       Get.back();
          //     },
          //     child: Icon(
          //       Icons.arrow_back,
          //       color: AppColors.smallTextColor,
          //     )),
        ),
      ]),
    );
  }
}
