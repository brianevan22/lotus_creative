import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.black,
        border: Border(top: BorderSide(color: AppColors.gold, width: 0.5)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 48,
      ),
      child: Column(
        children: [
          isDesktop ? _buildDesktopFooter() : _buildMobileFooter(),

          const SizedBox(height: 48),

          Container(
            padding: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.gold.withOpacity(0.2)),
              ),
            ),
            child: const Column(
              children: [
                Text(
                  '© 2026 Lotus Creative. All rights reserved.',
                  style: TextStyle(color: AppColors.grayLighter, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Presented by Ammar Gibran, Brian Evan & Amarrazan Yuka',
                  style: TextStyle(color: AppColors.grayLighter, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: AppColors.goldGradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: AppColors.black,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  ShaderMask(
                    shaderCallback: (bounds) =>
                        AppColors.goldGradient.createShader(bounds),
                    child: const Text(
                      'LOTUS CREATIVE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Jasa Desain Identitas Visual Berbasis Digital sebagai Solusi Branding UMKM dalam Meningkatkan Daya Saing di Era Ekonomi Kreatif.',
                style: TextStyle(color: AppColors.grayLighter),
              ),
              const SizedBox(height: 16),
              const Text(
                'Mahasiswa Wirausaha - Universitas Negeri Surabaya 2026',
                style: TextStyle(color: AppColors.grayLighter, fontSize: 12),
              ),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Layanan',
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              _buildFooterLink('Logo Design'),
              _buildFooterLink('Brand Identity'),
              _buildFooterLink('Packaging Design'),
              _buildFooterLink('Social Media Content'),
              _buildFooterLink('Landing Page'),
            ],
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kontak',
                style: TextStyle(
                  color: AppColors.gold,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              _buildContactRow(
                Icons.location_on,
                'Nglames, Desa Tiron, Kabupaten Madiun',
              ),
              _buildContactRow(Icons.phone, '081331086679'),
              _buildContactRow(Icons.email, 'branngibrorr@gmail.com'),
              _buildContactRow(Icons.camera_alt, '@lotuscre4tive_'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: AppColors.goldGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.auto_awesome,
                color: AppColors.black,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.goldGradient.createShader(bounds),
              child: const Text(
                'LOTUS CREATIVE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Jasa Desain Identitas Visual Berbasis Digital sebagai Solusi Branding UMKM dalam Meningkatkan Daya Saing di Era Ekonomi Kreatif.',
          style: TextStyle(color: AppColors.grayLighter),
        ),
        const SizedBox(height: 32),
        const Text(
          'Layanan',
          style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        _buildFooterLink('Logo Design'),
        _buildFooterLink('Brand Identity'),
        _buildFooterLink('Packaging Design'),
        _buildFooterLink('Social Media Content'),
        _buildFooterLink('Landing Page'),
        const SizedBox(height: 32),
        const Text(
          'Kontak',
          style: TextStyle(
            color: AppColors.gold,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 16),
        _buildContactRow(
          Icons.location_on,
          'Nglames, Desa Tiron, Kabupaten Madiun',
        ),
        _buildContactRow(Icons.phone, '081331086679'),
        _buildContactRow(Icons.email, 'branngibrorr@gmail.com'),
        _buildContactRow(Icons.camera_alt, '@lotuscre4tive_'),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(color: AppColors.grayLighter)),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gold, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.grayLighter,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
