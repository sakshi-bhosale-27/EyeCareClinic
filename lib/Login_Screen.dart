import 'package:flutter/material.dart';
import 'Register_Screen.dart';
import 'HomePage_Screen.dart';


// ignore: camel_case_types
class Login_Screen extends StatefulWidget{

  const Login_Screen({super.key});
  @override
  State createState() => _LoginScreenState();

}
 class _LoginScreenState extends State {


  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context){

    return Scaffold( 
      backgroundColor: Colors.white,
      body:
       Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
        const SizedBox(height: 20,),
            
            SizedBox(
              height:100,
              width:100,
              child: Image.asset("assets/receptionist (2).png",)),
                  const SizedBox(height: 20,),
        
                const Padding(
                  padding:  EdgeInsets.all(20),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
        
                          Text("Welcome Back",
                       style:TextStyle(color: Color(0xFF4325D8),
                       fontSize: 30,
                       fontWeight: FontWeight.bold,
                       ) 
                        ),
                          Text("Login to your Account",
                           style:TextStyle(color:Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                           ) 
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
          
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                //height:60,
                    
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                  color:Colors.white,
                  boxShadow:[
                   
                            BoxShadow( 
                          offset:Offset(1, 2),
                          blurRadius: 8,
                          color: Color.fromRGBO(210, 210, 210, 1),
                          )
                    
                  ],
                  
                 
                ),
                child:
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                    controller: name,
                    decoration: const InputDecoration(
                      icon:Icon(Icons.person_2_rounded),
                      hintText: "Enter Your Name",
                      hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                      border: InputBorder.none,
                     label:  Text(" UserName",
                     style:TextStyle(fontSize:14,
                      )
                     ),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.all(Radius.circular(12)),
                      //   borderSide: BorderSide(color:Colors.white)
                      // )
                    ),
                      
                  ),
              ),
                
                    
              ),
            ),
            //const SizedBox(height: 20,),
        
        
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                //height:60,
                    
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                  color:Colors.white,
                  boxShadow:[
                  
                            BoxShadow( 
                          offset:Offset(1, 2),
                          blurRadius: 8,
                          color: Color.fromARGB(255, 222, 222, 222),
                          )
                    
                  ],
                  
                 
                ),
                child:
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      icon:Icon(Icons.password_rounded),
                   hintText: "Enter Your Password",
                   hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
                     label:  Text(" Password",
                     style:TextStyle(fontSize: 14)
                     ),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.remove_red_eye_rounded)
                    ),
                      
                  ),
              ),
                
                    
              ),
            ),
            const SizedBox(height: 10,),
        
            Padding(
              padding: const EdgeInsets.all(12),
              child: ElevatedButton(onPressed: (){
        
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomepageScreen(),));
              }, 
              style:const ButtonStyle(
                
              fixedSize:  WidgetStatePropertyAll<Size?>(Size.fromWidth(450),),
              backgroundColor:WidgetStatePropertyAll(  Color(0xFF4325D8),)
        ),
              
              child: const Text (" Sign in",
              
              style:TextStyle(color: Colors.white,
              )),
              ),
            ),
            const SizedBox(height: 5,),
        
             Padding(
               padding: const EdgeInsets.all(1),
               child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account?"),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register_Screen(),));
                        },
                        child:const Text("Sign up",style:TextStyle(color: Color(0xFF4325D8),)),
                        )
                      ],
                    ),
             ),
            
        
        
        
          ]),
      
    );
  }
   
 }