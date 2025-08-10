import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  _buildContactInfo(isMobile),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Feel free to reach out to me through any of the following channels:',
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 32),
        
        // Contact Information Cards
        _buildContactCard(
          icon: Icons.email,
          title: 'Email',
          content: 'rysalaksanabhakti@gmail.com',
          onTap: () => _launchEmail('rysalaksanabhakti@gmail.com'),
        ),
        const SizedBox(height: 16),
        
        _buildContactCard(
          icon: Icons.phone,
          title: 'Phone',
          content: '+62 831 1177 8069',
          onTap: () => _launchPhone('+6283111778069'),
        ),
        const SizedBox(height: 16),
        
        _buildContactCard(
          icon: Icons.location_on,
          title: 'Location',
          content: 'Malang, Indonesia',
          onTap: null,
        ),
        
        const SizedBox(height: 40),
        
        Text(
          'Follow Me',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        
        Wrap(
          spacing: 16,
          children: [
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/github.png',
              url: 'https://github.com/Rysalb',
              tooltip: 'GitHub',
            ),
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/linkedin.png',
              url: 'https://www.linkedin.com/in/rysa-laksana/',
              tooltip: 'LinkedIn',
            ),
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/instagram-new.png',
              url: 'https://www.instagram.com/rysalaksana/',
              tooltip: 'Instagram',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onTap,
  }) {
    return Builder(
      builder: (context) => Card(
        elevation: 2,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        content,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (onTap != null)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email');
    }
  }

  Future<void> _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }
}

class SocialButton extends StatelessWidget {
  final String iconUrl;
  final String url;
  final String tooltip;

  const SocialButton({
    super.key,
    required this.iconUrl,
    required this.url,
    required this.tooltip,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: _launchUrl,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(
            iconUrl.replaceAll('/30/', '/30/${isDark ? 'ffffff' : '000000'}/'),
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error,
                color: isDark ? Colors.white : Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }
}