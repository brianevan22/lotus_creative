import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColors.goldGradient),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          const Text(
            'Siap Mengembangkan Brand Anda?',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Hubungi kami sekarang dan dapatkan konsultasi GRATIS untuk kebutuhan branding bisnis Anda!',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.black.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          isDesktop ? _buildDesktopContacts() : _buildMobileContacts(),

          const SizedBox(height: 48),

          _HoverCTAButton(
            onPressed: () async {
              final url = Uri.parse(
                'https://wa.me/6281331086679?text=Halo%20Lotus%20Creative,%20saya%20tertarik%20dengan%20layanan%20desain%20Anda',
              );
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopContacts() {
    return Row(
      children: [
        Expanded(
          child: _HoverContactCard(
            icon: Icons.camera_alt,
            title: 'Instagram',
            subtitle: '@lotuscre4tive_',
            url: 'https://instagram.com/lotuscre4tive_',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _HoverContactCard(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'branngibrorr@gmail.com',
            url: 'mailto:branngibrorr@gmail.com',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _HoverContactCard(
            icon: Icons.phone,
            title: 'WhatsApp',
            subtitle: '081331086679',
            url: 'https://wa.me/6281331086679',
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContacts() {
    return Column(
      children: [
        _HoverContactCard(
          icon: Icons.camera_alt,
          title: 'Instagram',
          subtitle: '@lotuscre4tive_',
          url: 'https://instagram.com/lotuscre4tive_',
        ),
        const SizedBox(height: 24),
        _HoverContactCard(
          icon: Icons.email,
          title: 'Email',
          subtitle: 'branngibrorr@gmail.com',
          url: 'mailto:branngibrorr@gmail.com',
        ),
        const SizedBox(height: 24),
        _HoverContactCard(
          icon: Icons.phone,
          title: 'WhatsApp',
          subtitle: '081331086679',
          url: 'https://wa.me/6281331086679',
        ),
      ],
    );
  }
}

class _HoverCTAButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _HoverCTAButton({required this.onPressed});

  @override
  State<_HoverCTAButton> createState() => _HoverCTAButtonState();
}

class _HoverCTAButtonState extends State<_HoverCTAButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.gold : AppColors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: _isHovered ? AppColors.black : AppColors.gold,
                ),
                child: const Text('Konsultasi Gratis Sekarang'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HoverContactCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String url;

  const _HoverContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.url,
  });

  @override
  State<_HoverContactCard> createState() => _HoverContactCardState();
}

class _HoverContactCardState extends State<_HoverContactCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(24),
          transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.black.withOpacity(0.18)
                : AppColors.black.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? AppColors.black.withOpacity(0.4)
                  : AppColors.black.withOpacity(0.15),
            ),
          ),
          child: Column(
            children: [
              Icon(widget.icon, size: 32, color: AppColors.black),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
