import 'package:flutter/material.dart';

void main() {
  runApp(const DirectoryApp());
}

// Stores student information. It is not a widget and its fields never change.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded student data. The list and its Student objects are constant.
const List<Student> students = [
  Student(
    name: 'Yuhama Macoto',
    course: 'BS Information Technology',
    yearLevel: 1,
    email: 'yuhama.macoto@example.com',
  ),
  Student(
    name: 'Marivic Macoto',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'marivic.macoto@example.com',
  ),
  Student(
    name: 'Yutachi Macoto',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'yutachi.macoto@example.com',
  ),
  Student(
    name: 'Yatchica Macoto',
    course: 'BS Information Systems',
    yearLevel: 2,
    email: 'yatchica.macoto@example.com',
  ),
  Student(
    name: 'Yaohan Macoto',
    course: 'BS Information Technology',
    yearLevel: 4,
    email: 'yaohan.macoto@example.com',
  ),
];

// This widget is stateless because the app theme and home screen are fixed.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DirectoryScreen(),
    );
  }
}

// This widget is stateless because it only displays the fixed student list.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Directory')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (final student in students)
            ListTile(
              title: Text(
                student.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${student.course}\n'
                'Year Level: ${student.yearLevel}\n'
                '${student.email}',
              ),
            ),
        ],
      ),
    );
  }
}