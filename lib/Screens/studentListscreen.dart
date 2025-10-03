import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_application1/Screens/add_student.dart';
import 'package:provider_application1/Screens/provider/student_provider.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<StudentProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => AddStudentScreen()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),

      body: ListView.builder(
        itemCount: provider.studentlist.length,
        itemBuilder: (context, index) {
          final student = provider.studentlist[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text("${student.age} | ${student.course}"),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                provider.deleteData(index);
              },
            ),
          );
        },
      ),
    );
  }
}
