import 'package:flutter/material.dart';

class ClinicPage extends StatefulWidget {
  const ClinicPage({super.key});

  @override
  State createState() => _ClinicPageState();
}

class _ClinicPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {}, // Implement back navigation
        ),
        title: const Text("Clinic", style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/receptionist (2).png"),
                  backgroundColor: Colors.grey[300],
                  child: Image.asset("assets/receptionist (2).png", fit: BoxFit.cover),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customButton("Edit Info"),
                    const SizedBox(width: 10),
                    _customButton("Log Out"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SectionHeader(title: "Account", subtitle: "Manage your Account Details"),
          InfoCard(title: "Receptionist", subtitle: "Phone No. 9988776655"),
           const SizedBox(height: 20),
          SectionHeader(title: "Clinic Information", subtitle: "Manage your Clinic Details"),
          MenuCard(items: [
            "Consultation Timings",
            "Appointments",
            "Medicine Inventory",
            "Eye Wear Inventory"
          ]),
           const SizedBox(height: 20),
          SectionHeader(title: "Message Settings", subtitle: "Edit and manage your message preferences"),
          MenuCard(items: ["Set Message Presets"]),
           const SizedBox(height: 20),
          SectionHeader(title: "Get Support", subtitle: "We're here to help you."),
          MenuCard(items: ["Get Support via Email", "Get Support via Call"]),
           const SizedBox(height: 20),
          SectionHeader(title: "Security & Privacy", subtitle: "Read our Privacy Policy"),
          MenuCard(items: ["Privacy Policy"]),
        ],
      ),
    );
  }

  Widget _customButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(180, 40),
        backgroundColor: Colors.cyan[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const SectionHeader({super.key, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 253, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.info, color: Colors.black),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const InfoCard({super.key, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        tileColor: Colors.white,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final List<String> items;
  const MenuCard({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: items.map((item) => Column(
          children: [
            ListTile(
              title: Text(item, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
              onTap: () {},
            ),
            if (item != items.last) 
              const Divider(height: 1, indent: 16, endIndent: 16, color: Color.fromARGB(255, 239, 239, 239)),
          ],
        )).toList(),
      ),
    );
  }
}
