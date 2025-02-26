
import 'package:flutter/material.dart';

import 'AddNewPatient.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  // Sample Patient Data
  List<Map<String, String>> allPatients = [
    {"name": "Demo Patient", "phone": "9988776655"},
    {"name": "John Doe", "phone": "9876543210"},
    {"name": "Jane Smith", "phone": "9123456789"},
  ];

  List<Map<String, String>> filteredPatients = [];

  @override
  void initState() {
    super.initState();
    filteredPatients = List.from(allPatients); // Initially show all patients
  }

  // 🔍 Search Function
  void searchPatient(String query) {
    setState(() {
      filteredPatients = allPatients
          .where((patient) =>
              patient["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              patient["phone"]!.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: Colors.white,
        title: Text("Eye Care Clinic",style:TextStyle(fontSize:20,fontWeight: FontWeight.w800)),
        actions: [
          // 📂 Import Patients Button
          IconButton(
            icon: Icon(Icons.file_copy_outlined,color:Colors.black,),
            onPressed: () {
              // Implement patient import functionality
              
              
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 🔍 Search Bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search Name or Phone No",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: searchPatient,
            ),
          ),

          // 📋 Patient List
          Expanded(
            child: ListView.builder(
              itemCount: filteredPatients.length,
              itemBuilder: (context, index) {
                final patient = filteredPatients[index];
                return ListTile(
                  leading: Icon(Icons.person,color:Colors.blueGrey),
                  title: Text(patient["name"]!,style:TextStyle(fontSize:14,fontWeight: FontWeight.w600)),
                  subtitle: Text(patient["phone"]!),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.message, color: Color.fromARGB(255, 1, 39, 255)), // View Patient
                      SizedBox(width: 10),
                      Icon(Icons.note_add, color:  Color.fromARGB(255, 1, 39, 255)), // Add Note
                    ],
                  ),
                  onTap: () {
                    // Handle patient selection
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Selected: ${patient["name"]}")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      // 👤 Floating Add Patient Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to Add Patient Screen
          
          Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPatientScreen()),
      );
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.person_add,color: Color.fromARGB(255, 1, 39, 255)),
      ),
    );
  }
}
