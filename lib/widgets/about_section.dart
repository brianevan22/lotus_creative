import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  late YoutubePlayerController _ytController;

  static const String _videoId = 'pvqdwnO1Tok';

  @override
  void initState() {
    super.initState();
    _ytController = YoutubePlayerController.fromVideoId(
      videoId: _videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _ytController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      width: double.infinity,
      color: AppColors.grayDark,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            'Tentang Lotus Creative',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 800,
            child: Text(
              'Kami adalah tim mahasiswa Universitas Negeri Surabaya yang berdedikasi membantu UMKM Indonesia mendapatkan identitas visual profesional dengan harga terjangkau.',
              style: AppTextStyles.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),

          isDesktop ? _buildDesktopCards() : _buildMobileCards(),

          const SizedBox(height: 60),

          // 🔥 VIDEO SECTION
          _buildVideoSection(isDesktop),
        ],
      ),
    );
  }

  Widget _buildVideoSection(bool isDesktop) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'Kenali Lotus Creative Lebih Dekat',
          style: AppTextStyles.heading3,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Lihat bagaimana kami membantu UMKM berkembang melalui desain yang profesional',
          style: const TextStyle(color: AppColors.grayLighter),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),

        // Video Player
        Center(
          child: Container(
            width: isDesktop ? 800 : double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.gold.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withOpacity(0.15),
                  blurRadius: 32,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: YoutubePlayer(
                controller: _ytController,
                aspectRatio: 16 / 9,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopCards() {
    return Row(
      children: [
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.trending_up,
            title: 'Terjangkau',
            description:
                'Harga mulai dari Rp 250.000 - jauh lebih murah dari agensi konvensional yang bisa mencapai puluhan juta rupiah.',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.auto_awesome,
            title: 'Berkualitas',
            description:
                'Menggunakan metode Design Sprint berbasis riset konsumen untuk memastikan desain yang strategis dan estetis.',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.check_circle,
            title: 'Cepat & Responsif',
            description:
                'Proses pengerjaan 3-7 hari kerja dengan revisi unlimited dan layanan after-care 30 hari.',
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCards() {
    return Column(
      children: [
        _buildFeatureCard(
          icon: Icons.trending_up,
          title: 'Terjangkau',
          description:
              'Harga mulai dari Rp 250.000 - jauh lebih murah dari agensi konvensional yang bisa mencapai puluhan juta rupiah.',
        ),
        const SizedBox(height: 24),
        _buildFeatureCard(
          icon: Icons.auto_awesome,
          title: 'Berkualitas',
          description:
              'Menggunakan metode Design Sprint berbasis riset konsumen untuk memastikan desain yang strategis dan estetis.',
        ),
        const SizedBox(height: 24),
        _buildFeatureCard(
          icon: Icons.check_circle,
          title: 'Cepat & Responsif',
          description:
              'Proses pengerjaan 3-7 hari kerja dengan revisi unlimited dan layanan after-care 30 hari.',
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withOpacity(0.5),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.black, size: 24),
          ),
          const SizedBox(height: 16),
          Text(title, style: AppTextStyles.heading3),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(color: AppColors.grayLighter),
          ),
        ],
      ),
    );
  }
}
