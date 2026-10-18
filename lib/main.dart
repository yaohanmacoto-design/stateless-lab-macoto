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
      // Customization 1: Use a light theme with readable plum accents.
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF7B1E5A),
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFFFF8FC),
        useMaterial3: true,
      ),
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
      appBar: AppBar(
        title: const Text(
          'Campus Directory',
          style: TextStyle(color: Color(0xFF5C1745)),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 244, 146, 201),
        foregroundColor: const Color(0xFF5C1745),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: 'Students'),
          const SizedBox(height: 8),
          for (final student in students)
            StudentCard(student: student),
        ],
      ),
    );
  }
}

// This widget is stateless because its heading comes from its title parameter.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF6D1B50),
              ),
        ),
        const Divider(thickness: 1.5),
      ],
    );
  }
}

// This widget is stateless because its icon and text are supplied by its parent.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Theme.of(context).colorScheme.primary,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}

// This widget is stateless because it only displays the supplied Student data.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 2: Rounded card corners.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      // Customization 3: Add space inside each student card.
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              // Customization 4: Use a light teal avatar background.
              backgroundColor: const Color(0xFFF0D9E7),
              child: Text(
                student.name[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5C1745),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(student.course),
                  const SizedBox(height: 8),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 4),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}