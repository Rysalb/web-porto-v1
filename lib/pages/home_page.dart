import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        image: DecorationImage(
          image: const NetworkImage(
            'https://images.unsplash.com/photo-1557683316-973673baf926',
          ),
          fit: BoxFit.cover,
          opacity: isDark ? 0.05 : 0.08,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  backgroundImage: AssetImage(
                    isDark 
                        ? 'assets/images/foto_profile_dark.jpeg' 
                        : 'assets/images/foto_profile.png',
                  ),
                ),
              ).animate()
                .fadeIn(duration: 800.ms)
                .scale(delay: 200.ms, curve: Curves.easeOutBack),
              
              const SizedBox(height: 32),
              
              Text(
                'Rysa Laksana',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                  color: isDark ? Colors.white : Colors.black87,
                ),
                textAlign: TextAlign.center,
              ).animate()
                .fadeIn(duration: 600.ms, delay: 300.ms)
                .slideY(begin: 0.3, end: 0, delay: 300.ms),
                
              const SizedBox(height: 16),
              
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flutter Developer',
                      speed: const Duration(milliseconds: 80),
                      cursor: '|',
                    ),
                    TypewriterAnimatedText(
                      'Web Developer',
                      speed: const Duration(milliseconds: 80),
                      cursor: '|',
                    ),
                    TypewriterAnimatedText(
                      'Mobile Developer',
                      speed: const Duration(milliseconds: 80),
                      cursor: '|',
                    ),
                    TypewriterAnimatedText(
                      'Full Stack Developer',
                      speed: const Duration(milliseconds: 80),
                      cursor: '|',
                    ),
                     TypewriterAnimatedText(
                      'Digital Creator',
                      speed: const Duration(milliseconds: 80),
                      cursor: '|',
                    ),
                  ],
                  repeatForever: true,
                  pause: const Duration(milliseconds: 1000),
                ),
              ),
              
              const SizedBox(height: 48),
              
              Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                          'https://drive.google.com/file/d/1LbzodLMWeKQlKFR4N8mRTcf7pcjuajJz/view?usp=sharing'
                      );
                      if (!await launchUrl(url)) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not download CV'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.download_rounded),
                    label: const Text('Download CV'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                    ),
                  ).animate()
                    .fadeIn(delay: 600.ms)
                    .slideX(begin: -0.2, end: 0, delay: 600.ms),
                    
                  OutlinedButton.icon(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                          'https://wa.me/6283111778069?text=Hello%20Rysa%2C%20I%20want%20to%20ask%20about...'
                      );
                      if (!await launchUrl(url)) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Could not open WhatsApp'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    icon: const Icon(Icons.chat_bubble_outline_rounded),
                    label: const Text('Contact Me'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 18,
                      ),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                    ),
                  ).animate()
                    .fadeIn(delay: 800.ms)
                    .slideX(begin: 0.2, end: 0, delay: 800.ms),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.black.withOpacity(0.8)
        : Colors.white.withOpacity(0.8),
    flexibleSpace: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(color: Colors.transparent),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 16 : 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: isSelected 
                    ? Colors.white 
                    : isDark ? Colors.white70 : Colors.black87,
                size: 20,
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}