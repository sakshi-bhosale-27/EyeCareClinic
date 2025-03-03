import 'package:eyecareclinic/ClinicPage.dart';
import 'package:flutter/material.dart';
import 'AppointmentList_Screen.dart';
import 'HomePageContent.dart';
import 'PatientListScreen.dart';
// Import other screens here
// import 'PatientScreen.dart';
// import 'ClinicScreen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0; // Track the selected tab

  // List of pages/screens corresponding to each BottomNavigationBar item
  final List<Widget> _screens = [
    HomePageContent(), // Home Screen content (to avoid rebuilding the entire scaffold)
    AppointmentPage(), // Appointment Screen
    PatientListScreen(),
    ClinicPage(), // Uncomment when implemented
    // ClinicScreen(), // Uncomment when implemented
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _screens[_selectedIndex], // Show the selected screen
      bottomNavigationBar: BottomNavigationBar(
       // backgroundColor: const Color.fromARGB(255, 255, 253, 253),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:  Color.fromARGB(255, 1, 39, 255),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded), label: "Appointment"),
          BottomNavigationBarItem(icon: Icon(Icons.accessible_rounded), label: "Patient"),
          BottomNavigationBarItem(icon: Icon(Icons.local_hospital_rounded), label: "Clinic"),
        ],
      ),
    );
  }
}
