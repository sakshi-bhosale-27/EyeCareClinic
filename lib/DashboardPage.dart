import 'package:flutter/material.dart';

class Dashboardpage extends StatefulWidget{

  const Dashboardpage({super.key});

  @override
  State createState() => _DashboardPageState();

}
class _DashboardPageState extends State{

  @override

  Widget build(BuildContext context){

    return Scaffold( 
        backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: _buildAppBar(context),
      ),
       body: SingleChildScrollView(
       padding: EdgeInsets.all(12),
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildStatCard('Appointments', '100', Icons.calendar_today),
                _buildStatCard('Eye Wear Inventory', '100', Icons.remove_red_eye),
                _buildStatCard('Medicine Inventory', '100', Icons.local_pharmacy),
                _buildStatCard('Revenue', '\$100', Icons.attach_money),
              ],
            ),
            SizedBox(height: 20),
            _buildClinicInfoCard(),
            SizedBox(height: 20),
            _buildClinicDetails(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0), // Adjust outer padding
    child: Card(
      color: Colors.blue.shade50,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(0.0), // Balanced inner padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Color.fromARGB(255, 1, 39, 255)), // Slightly smaller for balance
            SizedBox(height: 6), // Adjust spacing
            Text(
              title,
              textAlign: TextAlign.center, // Ensure center alignment
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 6), // Slightly reduce spacing
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}


 Widget _buildClinicInfoCard() {
  return 
   Container(
      decoration: BoxDecoration(
        color: Colors.blue[50], // Light blue background
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.call, color: Colors.black54),
                  SizedBox(width: 5),
                  Text(
                    '+91 9988776655',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Icon(Icons.share, color: Colors.black54), // Share Icon
            ],
          ),
          SizedBox(height: 5),
          Text(
            'My Eye Care Clinic',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 13, 85),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Row(
              children: [
                Icon(Icons.language, color: Colors.white, size: 16),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Virtual Clinic: https://eyevision.in/EVL188900',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Demo clinic, Your clinic address will appear here once you set it up',
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    
  );
}

  Widget _buildClinicDetails( BuildContext context) {
  return 
  MediaQuery.removePadding(
    context: context,
  removeLeft: true, // Removes only top padding
  removeRight: true,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Clinic Info Header
        Container(
          width:double.infinity,
          //padding: EdgeInsets.zero,
          color: Color.fromARGB(255, 0, 13, 85),
          child: Text(
            '  Clinic Info',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Clinic Info Content
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _clinicInfoTile(Icons.business, 'Eye Care Clinic'),
              _clinicInfoTile(Icons.phone, '+91 9988776655'),
              _clinicInfoTile(Icons.image, 'Clinic Images'),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _clinicInfoTile(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, color: Color.fromARGB(255, 1, 39, 255)),
    title: Text(title),
    dense: true, // Reduces padding
  );
}

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
            Text("Dashboard", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 20)),
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
