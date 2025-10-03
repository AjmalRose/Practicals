import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application1/Screens/provider/student_provider.dart';
import 'package:provider_application1/Screens/studentListscreen.dart';
import 'package:provider_application1/Models/student_model.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final courseCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = context.watch<StudentProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Add Student"), backgroundColor: Colors.teal),

      body: Center(
        child: prov.islog
            ? CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: nameCtrl,
                      decoration: InputDecoration(hintText: "Name"),
                    ),
                    TextField(
                      controller: ageCtrl,
                      decoration: InputDecoration(hintText: "Age"),
                    ),
                    TextField(
                      controller: courseCtrl,
                      decoration: InputDecoration(hintText: "Course"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final data = StudentModel(
                          name: nameCtrl.text,
                          age: ageCtrl.text,
                          course: courseCtrl.text,
                        );

                        await prov.addStudent(data);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentListScreen(),
                          ),
                        );
                      },
                      child: Text("Add Student"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
