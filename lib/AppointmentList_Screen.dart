import 'package:eyecareclinic/HomePage_Screen.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
           Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomepageScreen()),
      );
          },
        ),
        title: Text(
          "Eye Care Clinic",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search Name or Phone No",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Date & Filter Buttons
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.black54),
                SizedBox(width: 8),
                Text(
                  "Mon, 10 Feb",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                _dateFilterButton("Today - 2"),
                SizedBox(width: 10),
                _dateFilterButton("Tomorrow - 0"),
              ],
            ),
            SizedBox(height: 16),
             Text("Upcoming Appointments", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 16),
            // Appointments List
            Expanded(
              child: ListView(
                children: [
                  AppointmentCard(
                    name: "Ana Watson",
                    gender: "Female",
                    age: 22,
                    phone: "9988776655",
                    timeSlot: "12:20 - 12:30 PM",
                  ),
                  AppointmentCard(
                    name: "John Doe",
                    gender: "Male",
                    age: 30,
                    phone: "9876543210",
                    timeSlot: "01:00 - 01:10 PM",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue.shade50,
        onPressed: () {
          // Action for adding an appointment
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  // Date Filter Button
  Widget _dateFilterButton(String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      onPressed: () {},
      child: Text(text, style: TextStyle(fontSize: 14)),
    );
  }
}

// Appointment Card Widget
class AppointmentCard extends StatelessWidget {
  final String name;
  final String gender;
  final int age;
  final String phone;
  final String timeSlot;
  
  const AppointmentCard({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    required this.phone,
    required this.timeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: Colors.cyan.shade50, // Light cyan background
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Material(
        color: Colors.transparent, // Prevents unwanted background changes
        child: InkWell(
          borderRadius: BorderRadius.circular(12), // Ripple effect within shape
          onTap: () {
            showAppointmentModal(context);
          },
          // child: Padding(
          //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Colored Side Indicator
          Container(
            width: 8,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.cyan.shade300, // Cyan color indicator
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: 8), // Spacing

          // Patient Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name ($gender, $age)", // Name, Gender, Age
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  phone, // Phone Number
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Time Slot
          Text(
            timeSlot,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
          ),
        ),
    
    );
  }
}
void showAppointmentModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Row (Profile & Close Button)
            Row(
              children: [
                CircleAvatar(child: Icon(Icons.person, size: 30)),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ana Watson", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("(Female, 27y)", style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Appointment Card
            Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.event, color: Colors.blue),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tue, 11 February • 11:50 AM", style: TextStyle(fontSize: 14)),
                      Text("🟢 In Person", style: TextStyle(color: Colors.green)),
                    ],
                  ),
                  Spacer(),
                  IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () {}),
                  IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () {}),
                ],
              ),
            ),
            Divider(),

            // Action List Tiles
            ListTile(
              leading: Icon(Icons.message, color: Colors.blue),
              title: Text("Message Patient"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.blue),
              title: Text("Create New Appointment"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text("Mark as Complete"),
              onTap: () {},
            ),
            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
