
import "package:flutter/material.dart";
import "HomePage_Screen.dart";
import "Login_Screen.dart";

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State {
  TextEditingController name = TextEditingController();
  TextEditingController mobileno = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Create your Account",
          style: TextStyle(
            color:  Color(0xFF4325D8),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login_Screen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            customTextField(name, "Username", Icons.person_2_rounded, "Enter Your Name"),
            customTextField(mobileno, "Mobile No.", Icons.phone_android_rounded, "Enter Your Mobile No"),
            customTextField(gmail, "Gmail", Icons.mail_outline_rounded, "Enter Your Gmail"),
            customPasswordField(password, "Password", "Enter Your Password"),
            customPasswordField(confirmpassword, "Confirm Password", "Confirm Password"),
            
            // Sign In Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const HomepageScreen(),));
                  // Handle Sign In

                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(380, 50),
                  backgroundColor:  Color(0xFF4325D8),
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            // OR Divider
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR', style: TextStyle(color: Colors.black)),
                ),
                Expanded(child: Divider(color: Colors.grey, thickness: 1)),
              ],
            ),

            // Google Sign-In Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Handle Google Sign In
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250, 50),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset("assets/google_logo.png"),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),

            // Log In Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Screen()),
                    );
                  },
                  child: const Text("Log In",style:TextStyle(color: Color(0xFF4325D8),)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField Widget
  Widget customTextField(
      TextEditingController controller, String label, IconData icon, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 8,
              color: Color.fromRGBO(210, 210, 210, 1),
            )
          ],
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            prefixIcon: Icon(icon, color: Colors.grey),
            hintText: hintText,
            hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
            labelText: label,
            labelStyle: TextStyle(fontSize: 14),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  // Reusable Password Field Widget
  Widget customPasswordField(TextEditingController controller, String label, String hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 2),
              blurRadius: 8,
              color: Color.fromRGBO(210, 210, 210, 1),
            )
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            hintText: hintText,
            hintStyle: TextStyle(color: Color.fromARGB(255, 222, 222, 222)),
            labelText: label,
            labelStyle: TextStyle(fontSize: 14),
            border: InputBorder.none,
            suffixIcon: Icon(Icons.remove_red_eye_rounded, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
