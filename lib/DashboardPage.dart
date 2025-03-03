import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget{

  const Dashboardpage({super.key});

  @override
  State createState() => _DashboardPageState();

}
class _DashboardPageState extends State{

  @override

  Widget build(BuildContext context){

    return Scaffold( appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: _buildAppBar(context),
      ),
    );
  }
       
       
  AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 1, 39, 255), // Background color
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {
        Navigator.pop(context);
      }, 
    ),
    title: Row(
      children: [
         
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dashboard,", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 14)),
          //  Text("Mr. Jon", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.notifications, color: Colors.white),
        onPressed: () {
          // Handle notification tap
        },
      ),
    ],
  );
}
}