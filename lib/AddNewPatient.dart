import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'HomePage_Screen.dart';



class AddPatientScreen extends StatefulWidget {
  @override
  State createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController referredByController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool notifyPatient = false;
  int selectedGenderIndex = 1; // Default: Female
  File? _profileImage;

  // Image picker function
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // Show options for image upload
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Take Photo"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Choose from Gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to validate & submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Patient Added Successfully!"),
          backgroundColor: Colors.green,
        ),
      );

      // Reset fields after adding patient
      setState(() {
        nameController.clear();
        phoneController.clear();
        ageController.clear();
        referredByController.clear();
        notifyPatient = false;
        selectedGenderIndex = 1;
        _profileImage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //backgroundColor: const Color.fromARGB(255, 255, 251, 251),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () =>  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomepageScreen()),
      )
        ),
        title: Text("Add New Patient", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Profile Picture Upload
              Center(
                child: GestureDetector(
                  onTap: _showImagePicker,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.blue.shade50,
                        backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                        child: _profileImage == null
                            ? Icon(Icons.person, size: 50, color: Colors.black54)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.purple.shade100,
                          child: Icon(Icons.camera_alt, color: Colors.black54, size: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Name Field
              Text("Name*", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextFormField(
                controller: nameController,
                decoration: _inputDecoration("Enter Name"),
                validator: (value) => value!.isEmpty ? "Name is required" : null,
              ),
              SizedBox(height: 12),

              // Mobile Number Field
              Text("Mobile No.*", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration("Enter Mobile No."),
                validator: (value) {
                  if (value!.isEmpty) return "Mobile number is required";
                  if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) return "Enter a valid 10-digit number";
                  return null;
                },
              ),
              SizedBox(height: 12),

              // Age Input
              Text("Age", style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration("Enter Age"),
                validator: (value) => value!.isEmpty ? "Age is required" : null,
              ),
              SizedBox(height: 12),

              // Gender Selection
              Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _genderButton(0, "Male"),
                  _genderButton(1, "Female"),
                  _genderButton(2, "Others"),
                ],
              ),
              SizedBox(height: 12),

              // Referred By
              Text("Referred By", style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(
                controller: referredByController,
                decoration: _inputDecoration("Enter Referrer Name"),
              ),
              SizedBox(height: 80),

              // Notify Checkbox
              CheckboxListTile(
                value: notifyPatient,
                onChanged: (value) {
                  setState(() {
                    notifyPatient = value!;
                  });
                },
                title: Text("Notify Patient Through SMS and WhatsApp"),
                controlAffinity: ListTileControlAffinity.leading,
              ),

              // Add Patient Button
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 39, 255), 
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: _submitForm,
                  child: Text("Add Patient", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper for Input Decoration
  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.lightBlue.shade50,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    );
  }

  // Gender Selection Buttons
  Widget _genderButton(int index, String label) {
    return Expanded(
      child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: 
          ElevatedButton.styleFrom(
            backgroundColor: selectedGenderIndex == index ? const Color.fromARGB(255, 1, 39, 255): Colors.white,
            foregroundColor: selectedGenderIndex == index ? Colors.white : Colors.black,
            side: BorderSide(color:const Color.fromARGB(255, 1, 39, 255), ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            setState(() {
              selectedGenderIndex = index;
            });
          },
          child: Text(label),
        ),
      ),
    );
  }
}
