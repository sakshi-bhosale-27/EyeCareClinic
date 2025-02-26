import 'package:eyecareclinic/AddNewPatient.dart';
import 'package:flutter/material.dart';

class AddNewAppointment extends StatefulWidget {
  final String selectedDateTime;
  final String mode;
  final String doctorName;
  final Map<String, dynamic>? patientData; // Accept patient data

  const AddNewAppointment({
    Key? key,
    required this.selectedDateTime,
    required this.mode,
    required this.doctorName,
    this.patientData, // Optional parameter
  }) : super(key: key);

  @override
  _AddNewAppointmentState createState() => _AddNewAppointmentState();
}

class _AddNewAppointmentState extends State<AddNewAppointment> {
  final TextEditingController _searchController = TextEditingController();
  Map<String, dynamic>? selectedPatient; // Store selected patient details

  @override
  void initState() {
    super.initState();
    // If patient data is passed from previous screen, set it automatically
    if (widget.patientData != null) {
      selectedPatient = widget.patientData;
    }
  }

  // Function to search patient (simulated database query)
  void searchPatient(String query) {
    if (query.toLowerCase() == "demo patient") {
      setState(() {
        selectedPatient = {
          "name": "Demo Patient",
          "gender": "Male",
          "age": 40,
        };
      });
    } else {
      setState(() {
        selectedPatient = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("New Appointment", style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 251, 251),
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📅 Date & Time
            Text("Date & Time", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            SizedBox(height: 4),
            Text(widget.selectedDateTime, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),

            // 🏥 Mode & Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mode", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text(widget.mode, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Type", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
                    SizedBox(height: 4),
                    Text("Consultation", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // 👨‍⚕️ Doctor Name
            Text("Doctor", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
            SizedBox(height: 4),
            Text(widget.doctorName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 16),

            // 🔍 Search Patient Field
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search patient",
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
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // Open a new screen to add a patient
                     Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPatientScreen()),
      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    minimumSize: Size(60, 50),
                  ),
                  child: Text("New"),
                ),
              ],
            ),

            SizedBox(height: 16),

            // 📌 Show Patient Card if Found
            if (selectedPatient != null)
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.account_circle, size: 40, color: Colors.blue),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedPatient!["name"],
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${selectedPatient!["gender"]}, ${selectedPatient!["age"]}",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          selectedPatient = null;
                          _searchController.clear();
                        });
                      },
                    ),
                  ],
                ),
              ),

            Spacer(),

            // 🚀 Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      shape:BeveledRectangleBorder(),
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.black),
                    ),
                    child: Text("Cancel", style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                   
                    onPressed: () {
                      if (selectedPatient == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please select a patient!")),
                        );
                      } else {
                        print("Appointment Confirmed for ${selectedPatient!["name"]}");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape:BeveledRectangleBorder(),
                      backgroundColor: Colors.greenAccent,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Add Appointment",style: TextStyle(color:Colors.black)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
