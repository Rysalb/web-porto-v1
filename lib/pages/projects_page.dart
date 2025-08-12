// ignore_for_file: deprecated_member_use

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 1 : width < 900 ? 2 : 3;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(width < 600 ? 16 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: width < 600 ? 24 : 32,
            ),
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2),
          SizedBox(height: width < 600 ? 20 : 30),
          Expanded(
            child: GridView.count(
              physics: const ClampingScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: width < 600 ? 16 : 20,
              mainAxisSpacing: width < 600 ? 16 : 20,
              childAspectRatio: width < 600 ? 0.8 : 1.0,
              children: [
                ProjectCard(
                  title: 'Sistem Pengajuan PKN (Praktek Kerja Nyata)',
                  description: 'Sistem pengajuan PKN (Praktek Kerja Nyata) menggunakan koneksi Database mySql sebagai tempat penyimpanan data user ataupun inputan user',
                  detailedDescription: 'Aplikasi desktop berbasis Java yang dirancang untuk mempermudah mahasiswa dalam mengajukan PKN. Sistem ini menggunakan database MySQL untuk menyimpan data mahasiswa, dosen pembimbing, dan status pengajuan. Fitur utama meliputi registrasi mahasiswa, pengajuan PKN, verifikasi dosen, dan laporan progress.',
                  technologies: ['Java', 'Mysql'],
                  imageUrl: 'assets/images/proyek1.png',
                  projectUrl: 'https://github.com/Rysalb/TubesPbo',
                  isAssetImage: true,
                  linkType: 'Source Code',
                ),
                ProjectCard(
                  title: 'Ladangku.id',
                  description: 'Ladangku.id is a web-based application that provides a platform for farmers to sell their products online.',
                  detailedDescription: 'Platform e-commerce untuk petani yang memungkinkan mereka menjual hasil pertanian secara online. Website ini dibuat dengan HTML dan CSS yang responsif, menyediakan interface yang user-friendly untuk petani dan pembeli. Fitur meliputi katalog produk, sistem pencarian, dan informasi detail produk pertanian.',
                  technologies: ['HTML', 'CSS'],
                  imageUrl: 'assets/images/proyek2.png',
                  projectUrl: 'https://github.com/Rysalb/Ladangku-UI',
                  isAssetImage: true,
                  linkType: 'Source Code',
                ),
                ProjectCard(
                  title: 'Aplikasi Sistem Manajemen Kos',
                  description: 'Aplikasi manajemen kos adalah solusi digital untuk mengelola operasional kos secara efisien. Aplikasi ini terdiri dari dua platform: backend menggunakan Laravel dan frontend menggunakan Flutter.',
                  detailedDescription: 'Sistem manajemen kos yang terdiri dari aplikasi mobile Flutter dan backend Laravel API. Aplikasi ini memungkinkan pengelola kos untuk mengelola penyewa, pembayaran bulanan, komplain, dan fasilitas kos. Sistem pembayaran terintegrasi dan notifikasi real-time untuk penyewa dan pengelola.',
                  technologies: ['Flutter', 'Laravel', 'MySQL'],
                  imageUrl: 'assets/images/proyek3.png',
                  projectUrl: 'https://github.com/Rysalb/fe_kos_hansarin',
                  isAssetImage: true,
                  linkType: 'Source Code',
                ),
                ProjectCard(
                  title: 'Yusic',
                  description: 'Yusic adalah aplikasi pemutar musik berbasis Flutter yang memungkinkan pengguna untuk melakukan streaming lagu langsung dari YouTube, mengelola playlist, dan memutar musik secara offline',
                  detailedDescription: 'Aplikasi pemutar musik mobile sederhana dengan fitur streaming dari YouTube, download untuk offline playback, dan manajemen playlist yang intuitif. Menggunakan youtube_explode_dart untuk ekstraksi audio dan just_audio untuk playback.',
                  technologies: ['Flutter', 'youtube_explode_dart', 'just_audio'],
                  imageUrl: 'assets/images/proyek4.png',
                  projectUrl: 'https://drive.google.com/file/d/1y_uLyUzqIWHZwFcY4Fk6I1Y4GM_48_zl/view?usp=sharing',
                  isAssetImage: true,
                  linkType: 'Download App',
                ),
           
                ProjectCard(
                  title: 'Money Manager',
                  description: 'Money Manager adalah aplikasi berbasis Flutter yang dirancang untuk membantu pengguna mengelola keuangan pribadi mereka dengan lebih baik.',
                  detailedDescription: 'Aplikasi ini memungkinkan pengguna untuk mencatat pengeluaran, mengatur anggaran, dan menganalisis kebiasaan belanja mereka. Dengan antarmuka yang intuitif dan fitur yang mudah digunakan.',
                  technologies: ['Flutter', 'Provider', 'Supabase'],
                  imageUrl: 'assets/images/proyek5.png',
                  projectUrl: 'https://drive.google.com/file/d/1mJG6au9AIqOMwHtS21CEZHGiu5Pkt51X/view?usp=sharing',
                  isAssetImage: true,
                  linkType: 'Download App',
                ),
                  ProjectCard(
                  title: 'Pos App',
                  description: 'Pos App adalah aplikasi berbasis Flutter yang dirancang untuk membantu pengguna mengelola penjualan dan inventaris mereka dengan lebih baik.',
                  detailedDescription: 'Aplikasi ini memungkinkan pengguna untuk mencatat transaksi penjualan, mengelola produk, dan menganalisis kinerja penjualan mereka. Dengan antarmuka yang intuitif dan fitur yang mudah digunakan, Pos App tersedia dalam bentuk aplikasi mobile dan desktop.',
                  technologies: ['Flutter', 'blue_thermal_printer', 'Supabase'],
                  imageUrl: 'assets/images/proyek6.png',
                  projectUrl: '',
                  isAssetImage: true,
                  linkType: 'Source Code',
                ),
              ].mapIndexed((index, card) => card.animate(
                delay: (200 * index).ms)
                .fadeIn()
                .slideY(begin: 0.2)
                .scale(begin: const Offset(0.8, 0.8))
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String detailedDescription;
  final List<String> technologies;
  final String imageUrl;
  final String projectUrl;
  final bool isAssetImage;
  final String linkType;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.technologies,
    required this.imageUrl,
    required this.projectUrl,
    this.isAssetImage = false,
    required this.linkType,
  });

  Future<void> _launchUrl() async {
    // Cek jika projectUrl kosong
    if (projectUrl.isEmpty) {
      return; // Tidak melakukan apa-apa jika URL kosong
    }
    
    final Uri url = Uri.parse(projectUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  // New method for showing zoomed image
  void _showZoomedImage(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black87,
          insetPadding: EdgeInsets.all(isMobile ? 20 : 40),
          child: Stack(
            children: [
              // Background tap to close
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.transparent,
                ),
              ),
              // Zoomed image with interactive viewer
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? width * 0.9 : width * 0.8,
                    maxHeight: isMobile ? height * 0.8 : height * 0.9,
                  ),
                  child: InteractiveViewer(
                    panEnabled: true,
                    boundaryMargin: const EdgeInsets.all(20),
                    minScale: 0.5,
                    maxScale: 4.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Image(
                          image: isAssetImage 
                              ? AssetImage(imageUrl) as ImageProvider
                              : NetworkImage(imageUrl),
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.error, size: 50, color: Colors.grey),
                                  SizedBox(height: 8),
                                  Text('Image not available'),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Close button
              Positioned(
                top: isMobile ? 30 : 50,
                right: isMobile ? 30 : 50,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.black),
                    tooltip: 'Close',
                  ),
                ),
              ),
              // Zoom instructions (only show on mobile)
              if (isMobile)
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Pinch to zoom • Drag to pan • Tap to close',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  void _showProjectDetails(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 600;
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: EdgeInsets.all(isMobile ? 16 : 40),
          child: Container(
            width: isMobile ? width - 32 : 600,
            height: isMobile ? height * 0.85 : height * 0.8,
            child: Column(
              children: [
                // Header with clickable image for zoom
                GestureDetector(
                  onTap: () => _showZoomedImage(context),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: SizedBox(
                      height: isMobile ? 120 : 180,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: isAssetImage 
                                    ? AssetImage(imageUrl) as ImageProvider
                                    : NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Zoom indicator overlay
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.zoom_in,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    'Zoom',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 16 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(height: isMobile ? 12 : 16),
                        
                        // Detailed Description - Improved for mobile
                        const SizedBox(height: 8),
                        Expanded(
                          flex: isMobile ? 3 : 2,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              detailedDescription,
                              style: TextStyle(
                                fontSize: isMobile ? 12 : 16,
                                height: 1.5,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                        
                        SizedBox(height: isMobile ? 12 : 16),
                        
                        // Technologies
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: technologies.map((tech) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 8 : 12,
                                vertical: isMobile ? 4 : 6,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                tech,
                                style: TextStyle(
                                  fontSize: isMobile ? 10 : 14,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Actions
                Container(
                  padding: EdgeInsets.all(isMobile ? 16 : 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: isMobile 
                    ? Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: projectUrl.isEmpty 
                                  ? () => _showPrivateDialog(context)
                                  : _launchUrl,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: projectUrl.isEmpty
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    projectUrl.isEmpty 
                                      ? Icons.lock
                                      : linkType == 'Source Code' 
                                        ? Icons.code 
                                        : Icons.download,
                                    size: 18,
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    projectUrl.isEmpty ? 'Private Project' : linkType,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Close'),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Close'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: projectUrl.isEmpty 
                                  ? () => _showPrivateDialog(context)
                                  : _launchUrl,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: projectUrl.isEmpty
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    projectUrl.isEmpty 
                                      ? Icons.lock
                                      : linkType == 'Source Code' 
                                        ? Icons.code 
                                        : Icons.download,
                                    size: 18,
                                    color: const Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(projectUrl.isEmpty ? 'Private' : linkType),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showPrivateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(
                Icons.lock,
                color: Colors.orange,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Private Project',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'This project is currently private and not available for public access. Please contact me if you would like to know more about this project.',
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    
    return Card(
      elevation: 4,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _showProjectDetails(context),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // Image section with fixed height and zoom capability
            AspectRatio(
              aspectRatio: 16 / 9,
              child: GestureDetector(
                onTap: () => _showZoomedImage(context),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    image: DecorationImage(
                      image: isAssetImage 
                          ? AssetImage(imageUrl) as ImageProvider
                          : NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.1),
                        ],
                      ),
                    ),
                    child: Stack(
                      children: [
                        // Zoom icon indicator
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.zoom_in,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Content section
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Description
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: isMobile ? 3 : 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Technologies
                    SizedBox(
                      height: 24,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: technologies.map((tech) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                fontSize: isMobile ? 9 : 10,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )).toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Action hint
                    Row(
                      children: [
                        Icon(
                          Icons.touch_app,
                          size: 14,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Tap for details',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[500],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}