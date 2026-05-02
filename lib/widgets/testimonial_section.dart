import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

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
      child: Column(
        children: [
          Text(
            'Testimoni Klien',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Apa kata mereka tentang layanan kami',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          isDesktop ? _buildDesktopTestimonials() : _buildMobileTestimonials(),
        ],
      ),
    );
  }

  Widget _buildDesktopTestimonials() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildTestimonialCard(
            name: 'Ibu Sari',
            role: 'Pemilik Warung Nasi Pecel',
            testimonial:
                'Hasilnya sangat memuaskan! Logo yang dibuat benar-benar mencerminkan brand kuliner saya. Harga terjangkau dan prosesnya cepat!',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildTestimonialCard(
            name: 'Bapak Andi',
            role: 'Owner Toko Baju Online',
            testimonial:
                'Tim Lotus Creative sangat membantu! Mereka sabar merevisi sampai sesuai keinginan saya. Recommended banget untuk UMKM!',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildTestimonialCard(
            name: 'Dina',
            role: 'Founder Kopi Lokal',
            testimonial:
                'Kualitas profesional dengan harga mahasiswa! Paket Bisnis worth it banget. Sekarang produk saya lebih dilirik pembeli.',
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTestimonials() {
    return Column(
      children: [
        _buildTestimonialCard(
          name: 'Ibu Sari',
          role: 'Pemilik Warung Nasi Pecel',
          testimonial:
              'Hasilnya sangat memuaskan! Logo yang dibuat benar-benar mencerminkan brand kuliner saya. Harga terjangkau dan prosesnya cepat!',
        ),
        const SizedBox(height: 24),
        _buildTestimonialCard(
          name: 'Bapak Andi',
          role: 'Owner Toko Baju Online',
          testimonial:
              'Tim Lotus Creative sangat membantu! Mereka sabar merevisi sampai sesuai keinginan saya. Recommended banget untuk UMKM!',
        ),
        const SizedBox(height: 24),
        _buildTestimonialCard(
          name: 'Dina',
          role: 'Founder Kopi Lokal',
          testimonial:
              'Kualitas profesional dengan harga mahasiswa! Paket Bisnis worth it banget. Sekarang produk saya lebih dilirik pembeli.',
        ),
      ],
    );
  }

  Widget _buildTestimonialCard({
    required String name,
    required String role,
    required String testimonial,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.grayDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.gold.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: List.generate(
              5,
              (index) =>
                  const Icon(Icons.star, color: AppColors.gold, size: 20),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '"$testimonial"',
            style: const TextStyle(color: AppColors.grayLight, height: 1.6),
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.gold,
            ),
          ),
          Text(
            role,
            style: const TextStyle(fontSize: 12, color: AppColors.grayLighter),
          ),
        ],
      ),
    );
  }
}
