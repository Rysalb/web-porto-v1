// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _skillsScrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mainScrollController.dispose();
    _skillsScrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_skillsScrollController.hasClients) {
        final maxScroll = _skillsScrollController.position.maxScrollExtent;
        final currentScroll = _skillsScrollController.offset;
        if (currentScroll >= maxScroll) {
          _skillsScrollController.jumpTo(0);
        } else {
          _skillsScrollController.animateTo(
            currentScroll + 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e',
            ),
            fit: BoxFit.cover,
            opacity: 0.05,
          ),
        ),
        child: SingleChildScrollView(
          controller: _mainScrollController, // Use main scroll controller here
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ).animate()
                .fadeIn(duration: 600.ms)
                .slideX(begin: -0.2),
              const SizedBox(height: 20),
              const Text(
                'Hi my name is Rysa Laksana. I am particularly interested in mobile app development using Flutter and have a keen desire to delve into web programming using React JS. My commitment to staying updated with the latest trends in technology showcases my dedication to continuous learning.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ).animate()
                .fadeIn(delay: 200.ms)
                .slideY(begin: 0.2),
              const SizedBox(height: 30),
              Text(
                'Skills',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ).animate()
                .fadeIn(delay: 400.ms),
              const SizedBox(height: 20),
              SingleChildScrollView(
                controller: _skillsScrollController, // Use skills scroll controller here
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SkillChip(skill: 'Flutter').animate()
                      .fadeIn(delay: 500.ms)
                      .slideX(begin: -1, end: 0, delay: 500.ms),
                    const SkillChip(skill: 'Dart').animate()
                      .fadeIn(delay: 600.ms)
                      .slideX(begin: -1, end: 0, delay: 600.ms),
                    const SkillChip(skill: 'Java').animate()
                      .fadeIn(delay: 700.ms)
                      .slideX(begin: -1, end: 0, delay: 700.ms),
                    const SkillChip(skill: 'Python').animate()
                      .fadeIn(delay: 800.ms)
                      .slideX(begin: -1, end: 0, delay: 800.ms),
                    const SkillChip(skill: 'HTML/CSS').animate()
                      .fadeIn(delay: 900.ms)
                      .slideX(begin: -1, end: 0, delay: 900.ms),
                    const SkillChip(skill: 'JavaScript').animate()
                      .fadeIn(delay: 1000.ms)
                      .slideX(begin: -1, end: 0, delay: 1000.ms),
                    const SkillChip(skill: 'Laravel').animate()
                      .fadeIn(delay: 1100.ms)
                      .slideX(begin: -1, end: 0, delay: 1100.ms),
                    const SkillChip(skill: 'React').animate()
                      .fadeIn(delay: 1200.ms)
                      .slideX(begin: -1, end: 0, delay: 1200.ms),
                    const SkillChip(skill: 'PHP').animate()
                      .fadeIn(delay: 1300.ms)
                      .slideX(begin: -1, end: 0, delay: 1300.ms),
                    const SkillChip(skill: 'CSS').animate()
                      .fadeIn(delay: 1400.ms)
                      .slideX(begin: -1, end: 0, delay: 1400.ms),
                    const SkillChip(skill: 'Git').animate()
                      .fadeIn(delay: 1500.ms)
                      .slideX(begin: -1, end: 0, delay: 1500.ms),
                    const SkillChip(skill: 'SQL').animate()
                      .fadeIn(delay: 1600.ms)
                      .slideX(begin: -1, end: 0, delay: 1600.ms),
                  ].map((chip) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: chip,
                  )).toList(),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Education',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ).animate()
                .fadeIn(delay: 1300.ms),
              const SizedBox(height: 20),
              const EducationCard(
                university: 'University of Muhammadiyah Malang',
                degree: 'Bachelor of Computer Science',
                year: '2020-2025',
                gpa: '3.88',
              ).animate()
                .fadeIn(delay: 1400.ms)
                .slideX(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({super.key, required this.skill});

  String _getLogoUrl(String skill) {
    switch (skill.toLowerCase()) {
      case 'flutter':
        return 'https://cdn.iconscout.com/icon/free/png-256/flutter-2752187-2285004.png';
      case 'dart':
        return 'https://img.icons8.com/color/48/dart.png';
      case 'java':
        return 'https://cdn.iconscout.com/icon/free/png-256/java-43-569305.png';
      case 'python':
        return 'https://cdn.iconscout.com/icon/free/png-256/python-3521655-2945099.png';
      case 'html/css':
        return 'https://cdn.iconscout.com/icon/free/png-256/html5-40-1175193.png';
      case 'javascript':
        return 'https://cdn.iconscout.com/icon/free/png-256/javascript-1-225993.png';
      case 'git':
        return 'https://cdn.iconscout.com/icon/free/png-256/git-225996.png';
      case 'sql':
        return 'https://cdn.iconscout.com/icon/free/png-256/sql-4-190807.png';
      case 'laravel':
        return 'https://cdn.iconscout.com/icon/free/png-256/laravel-226015.png';
      case 'react':
        return 'https://cdn.iconscout.com/icon/free/png-256/react-3-1175109.png';
      case 'php':
        return 'https://cdn.iconscout.com/icon/free/png-256/php-2752101-2284918.png';
      case 'css':
        return 'https://cdn.iconscout.com/icon/free/png-256/css3-11-1175239.png';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          // ignore: duplicate_ignore
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              _getLogoUrl(skill),
              height: 24,
              width: 24,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(width: 24);
              },
            ),
            const SizedBox(width: 8),
            Text(
              skill,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String university;
  final String degree;
  final String year;
  final String gpa;

  const EducationCard({
    super.key,
    required this.university,
    required this.degree,
    required this.year,
    required this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              university,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              degree,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Year: $year',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'GPA: $gpa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
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