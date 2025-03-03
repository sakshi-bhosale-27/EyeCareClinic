import 'package:eyecareclinic/DashboardPage.dart';
import 'package:flutter/material.dart';

import 'AddNewPatient.dart';
import 'NewAppointment1.dart';


class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: _buildAppBar(context),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppointmentCard(),
            SizedBox(height: 16),
            _buildUpcomingAppointments(context),
            SizedBox(height: 16),
            _buildSection("Quick Actions", [
             
    _buildIconCard("New\nPatient", Icons.person_add_alt_1_rounded, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPatientScreen()),
      );
    }),
    _buildIconCard("Add\nAppointment", Icons.calendar_month_rounded, () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewAppointmentScreen()),
      );
    }),
    _buildIconCard("Print\nRX", Icons.receipt_long_rounded, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
  


            ]),
            SizedBox(height: 16),
            _buildSection("Services", [
            
              _buildIconCard("Medicine\nService", Icons.medical_services_rounded, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
              _buildIconCard("Eye wear\nService", Icons.remove_red_eye_rounded, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
              _buildIconCard("Explore\nMore", Icons.add_circle_outline, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
            ]),
            SizedBox(height: 16),
            _buildSection("Get Help", [
          
              _buildIconCard("Email\nSupport", Icons.email_rounded, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
              _buildIconCard("Call\nSupport", Icons.support_agent_rounded, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
              _buildIconCard("Explore\nMore", Icons.add_circle_outline, () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => PrintPrescriptionScreen()),
      // );
    }),
            ]),
          ],
        ),
           ),
          
        
      
     
    );
  }

  // App Bar
  AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 1, 39, 255), // Background color
    elevation: 0,
    // leading: IconButton(
    //   icon: Icon(Icons.arrow_back, color: Colors.white),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   }, 
    // ),
    title: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.3),
          child:IconButton(
        icon: Icon(Icons.person, color: Colors.white),
        onPressed: () {
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboardpage()),
      );
        },
      ),
        ),
        SizedBox(width: 8), // Space between avatar and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome,", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 14)),
            Text("Mr. Jon", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
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


  // Book Your First Appointment Card
  Widget _buildAppointmentCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _boxDecoration(lightBlue: true),
      child: Row(
        children: [
          Image.asset("assets/doc.png", height: 100, width: 100), // Use your own image asset
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Book your First Appointment",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue[900])),
                Text("Check out how easy it is to book appointment with doctors",
                    style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600, color: Colors.black54)),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(120, 30),
                    backgroundColor:  Color.fromARGB(255, 1, 39, 255),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text("Start", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Upcoming Appointments Card
Widget _buildUpcomingAppointments(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Title Row with "View All"
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Upcoming Appointments",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Navigate to appointment list screen
               
              },
              child: Text(
                "View All",
                style: TextStyle(color: Color.fromARGB(255, 1, 39, 255),fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      
      // No Appointments Box
      Container(
        width: double.infinity, // Makes it take the full screen width
        //margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Image.asset("assets/calender.png", height: 60, width: 60), 
            SizedBox(height: 10),
            Text(
              "No Upcoming Appointments",
              style: TextStyle(color: Color.fromARGB(255, 1, 39, 255), fontSize: 14),
            ),
          ],
        ),
      ),
    ],
  );
}

  // Sections for Quick Actions, Services, Help
  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ],
    );
  }

 // Icon Cards with Navigation
Widget _buildIconCard(String text, IconData icon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Color.fromARGB(255, 1, 39, 255), size: 30),
        ),
        SizedBox(height: 5),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color:  Color.fromARGB(255, 1, 39, 255), fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}


  // Bottom Navigation Bar
 

  // Box Decoration for Cards
  BoxDecoration _boxDecoration({bool lightBlue = false}) {
    return BoxDecoration(
      color: lightBlue ? Colors.blue.shade50 : Colors.white,
     // border:Border.all(color:const Color.fromARGB(255, 117, 117, 117)),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: const Color.fromARGB(255, 245, 242, 242), blurRadius: 4)],
    );
  }
}
