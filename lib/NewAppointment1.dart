import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AddNewAppointment.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
 State createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  int? _selectedSlotIndex;
  bool isInPerson = true; // Default mode: In Person

  List<String> timeSlots = [
    "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM",
    "11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM",
    "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM",
    "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM",
    "05:00 PM", "05:30 PM", "06:00 PM", "06:30 PM",
    "07:00 PM", "07:30 PM"
  ];

  DateTime now = DateTime.now();

  // Function to parse 12-hour formatted time string into DateTime
  DateTime _parseTime(String time) {
    String todayDate = DateFormat('yyyy-MM-dd').format(now);
    return DateFormat('yyyy-MM-dd hh:mm a').parse('$todayDate $time');
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
        elevation: 0,
        //backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📅 Date Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mon, 10 Feb", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    _buildDateButton("Today"),
                    SizedBox(width: 8),
                    _buildDateButton("Tomorrow"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),

            // 🏥 Mode Selection
            Text("Mode :", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Row(
              children: [
                _buildModeButton("In Person", isInPerson),
                SizedBox(width: 8),
                _buildModeButton("Tele-Consult", !isInPerson),
              ],
            ),
            SizedBox(height: 16),

            // 📍 Clinic & Timings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Eye Vision Clinic", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("09:00 AM - 08:00 PM", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(height: 16),

            // 🕑 Time Slots Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: timeSlots.length,
                itemBuilder: (context, index) {
                  DateTime slotTime = _parseTime(timeSlots[index]);
                  bool isPast = slotTime.isBefore(now);

                  return GestureDetector(
                    onTap: isPast
                        ? null // Disable past slots
                        : () {
                            setState(() {
                              _selectedSlotIndex = index;
                            });
                          },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isPast
                            ? Colors.grey.shade300 // Greyed out for past slots
                            : (_selectedSlotIndex == index
                                ? Color.fromARGB(255, 1, 39, 255)// Selected slot
                                : Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isPast
                              ? Colors.grey // Past slots border
                              : (_selectedSlotIndex == index
                                  ?  Color.fromARGB(255, 1, 39, 255)
                                  : Colors.grey),
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        timeSlots[index],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isPast
                              ? Colors.grey.shade600 // Past slot text color
                              : (_selectedSlotIndex == index
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // ✅ Confirm Appointment Button
            SizedBox(height: 12),
            ElevatedButton(
              // Inside your previous screen (where time is selected)
onPressed: () {
  if (_selectedSlotIndex != null) {
    String selectedDateTime = "${DateFormat('EEEE, dd MMM').format(now)}, ${timeSlots[_selectedSlotIndex!]}";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewAppointment(
          selectedDateTime: selectedDateTime,
          mode: isInPerson ? "In-Person" : "Tele-Consult",
          doctorName: "Dr. Jon Doe",
        ),
      ),
    );
  }
},


              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromARGB(255, 1, 39, 255),
                disabledBackgroundColor: Colors.grey.shade400,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Confirm Appointment", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  // 📅 Date Button Widget
  Widget _buildDateButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
      ),
      child: Text(label),
    );
  }

  // 🏥 Mode Button Widget
  Widget _buildModeButton(String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isInPerson = label == "In Person";
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ?  Color.fromARGB(255, 1, 39, 255): Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
