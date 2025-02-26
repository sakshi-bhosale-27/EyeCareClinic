import 'package:flutter/material.dart';
import 'Login_Screen.dart';

// ignore: camel_case_types
class Splash_Screen extends StatefulWidget{

  const Splash_Screen({super.key});
  @override
  State createState() => _SplashScreenState();

}
class _SplashScreenState extends State{


@override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,

      body:
      Center(
        child:
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
              //const Spacer(),
               const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Welcome to",
                     style: TextStyle(color: Colors.black,
                     fontWeight: FontWeight.bold,
                     fontSize: 30,
                     ),
                     ),
                     Text("Vision Eye Care",
                     style: TextStyle( color:Color(0xFF4325D8),
                     fontWeight: FontWeight.bold,
                     fontSize: 30,
                     ),
                     ),
                   ],
                 ),

              GestureDetector(
                onTap: () {
                   Navigator.push<void>(
                    context,MaterialPageRoute<void>(
                                builder: (BuildContext context) => const Login_Screen(),
                            ),
                          );
                },
             

              child:Container(
                height:500,
                width:500,
                
                decoration:
                const BoxDecoration(
                  shape: BoxShape.circle,
                //color:Color.fromRGBO(155, 149, 195, 1),
          
                ),
                child:Image.asset("assets/splashimage.png")
                 ),
              ),
             // const Spacer(),

          
                 
          
                 const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [

                         Text("Get Started",
                         style: TextStyle(color: Colors.black,
                         fontWeight: FontWeight.bold,
                         fontSize: 30,
                         ),
                         ),
                         SizedBox(width:5),
                         Icon(
                          size:30,
                          Icons.arrow_forward)
                       ],
                     ),
                   ],
                 )
          ],
          ),
        )
      )
    );
  }
}