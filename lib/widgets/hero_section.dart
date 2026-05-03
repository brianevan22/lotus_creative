import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onMulaiSekarang;
  final VoidCallback? onLihatPortfolio;

  const HeroSection({super.key, this.onMulaiSekarang, this.onLihatPortfolio});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      width: double.infinity,
      color: AppColors.black,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 80,
      ),
      child: isDesktop ? _buildDesktopLayout() : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(child: _buildContent()),
        const SizedBox(width: 60),
        Expanded(child: _buildImage(isDesktop: true)),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContent(),
        const SizedBox(height: 40),
        _buildImage(isDesktop: false),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.gold.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.gold.withOpacity(0.3)),
          ),
          child: const Text(
            'Jasa Desain Profesional untuk UMKM',
            style: TextStyle(color: AppColors.gold, fontSize: 14),
          ),
        ),

        const SizedBox(height: 24),

        RichText(
          text: TextSpan(
            style: AppTextStyles.heading1,
            children: [
              const TextSpan(text: 'Wujudkan Brand Impian Anda Bersama '),
              TextSpan(
                text: 'Lotus Creative',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = AppColors.goldGradient.createShader(
                      const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                    ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Jasa Desain Identitas Visual Berbasis Digital yang Terjangkau, Cepat, dan Profesional. Membantu UMKM Indonesia Bersaing di Era Digital.',
          style: AppTextStyles.bodyLarge,
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.grayDark.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.gold.withOpacity(0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(
                Icons.access_time,
                'Senin - Jumat, 08:00 - 17:00 WIB',
              ),
              const SizedBox(height: 12),
              _buildInfoRow(
                Icons.location_on,
                'Nglames, Desa Tiron, Kabupaten Madiun',
              ),
            ],
          ),
        ),

        const SizedBox(height: 32),

        Row(
          children: [
            _HoverButton(
              label: 'Mulai Sekarang',
              filled: true,
              onPressed: onMulaiSekarang ?? () {},
            ),
            const SizedBox(width: 16),
            _HoverButton(
              label: 'Lihat Portfolio',
              filled: false,
              onPressed: onLihatPortfolio ?? () {},
            ),
          ],
        ),

        const SizedBox(height: 32),

        // FIX 3: gunakan Expanded agar tidak overflow di mobile
        Row(
          children: [
            Expanded(child: _buildStat('250K+', 'Harga Mulai')),
            Expanded(child: _buildStat('3-7 Hari', 'Pengerjaan Cepat')),
            Expanded(child: _buildStat('Unlimited', 'Revisi')),
          ],
        ),
      ],
    );
  }

  // FIX 2: banner mobile pakai AspectRatio agar tidak terpotong
  Widget _buildImage({required bool isDesktop}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: isDesktop
          ? Image.asset(
              'assets/images/banner.png',
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: _errorBuilder,
            )
          : AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                'assets/images/banner.png',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: _errorBuilder,
              ),
            ),
    );
  }

  Widget _errorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.grayDark, AppColors.gold.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.gold.withOpacity(0.3)),
      ),
      child: const Center(
        child: Icon(Icons.image_outlined, color: AppColors.gold, size: 64),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.gold, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: const TextStyle(color: AppColors.grayLight)),
        ),
      ],
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.gold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: AppColors.grayLighter),
        ),
      ],
    );
  }
}

class _HoverButton extends StatefulWidget {
  final String label;
  final bool filled;
  final VoidCallback onPressed;

  const _HoverButton({
    required this.label,
    required this.filled,
    required this.onPressed,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
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
          color: widget.filled
              ? (_isHovered ? AppColors.goldLight : AppColors.gold)
              : (_isHovered
                    ? AppColors.gold.withOpacity(0.15)
                    : Colors.transparent),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.gold, width: 2),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.gold.withOpacity(0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: widget.filled ? AppColors.black : AppColors.gold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
