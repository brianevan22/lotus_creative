import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  String? _selectedPackage;

  Future<void> _orderViaWhatsApp() async {
    final package = _selectedPackage ?? 'salah satu paket';
    final message = Uri.encodeComponent(
      'Halo Lotus Creative, saya berminat memesan layanan $package. Mohon informasi lebih lanjut.',
    );
    final url = Uri.parse('https://wa.me/6281331086679?text=$message');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

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
            'Paket Layanan Kami',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Pilih paket yang sesuai dengan kebutuhan bisnis Anda',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),

          isDesktop ? _buildDesktopPackages() : _buildMobilePackages(),

          const SizedBox(height: 48),

          Center(
            child: SizedBox(
              width: 480,
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.grayDark, AppColors.black],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _selectedPackage != null
                        ? AppColors.gold
                        : AppColors.gold.withOpacity(0.2),
                    width: _selectedPackage != null ? 2 : 1,
                  ),
                  boxShadow: _selectedPackage != null
                      ? [
                          BoxShadow(
                            color: AppColors.gold.withOpacity(0.2),
                            blurRadius: 24,
                            spreadRadius: 2,
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFF25D366).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: const Color(0xFF25D366).withOpacity(0.4),
                        ),
                      ),
                      child: const Icon(
                        Icons.chat,
                        color: Color(0xFF25D366),
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _selectedPackage != null
                          ? 'Pesan $_selectedPackage'
                          : 'Pilih Paket Terlebih Dahulu',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _selectedPackage != null
                          ? 'Klik tombol di bawah untuk langsung chat WhatsApp'
                          : 'Klik salah satu paket di atas untuk melanjutkan',
                      style: const TextStyle(color: AppColors.grayLight),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _selectedPackage != null
                          ? _orderViaWhatsApp
                          : null,
                      icon: const Icon(Icons.chat_bubble_rounded, size: 18),
                      label: Text(
                        _selectedPackage != null
                            ? 'Pesan Sekarang via WhatsApp'
                            : 'Pilih Paket Dulu',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedPackage != null
                            ? const Color(0xFF25D366)
                            : AppColors.gray,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        elevation: _selectedPackage != null ? 4 : 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopPackages() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _HoverPackageCard(
            title: 'PAKET STARTER',
            price: 'Rp 250.000',
            description: 'Perfect untuk memulai',
            features: [
              'Logo profesional (3 konsep awal)',
              'Kartu nama digital (2 desain)',
              '3 template konten media sosial',
              'File: PNG, PDF, AI/CDR',
              'Revisi unlimited',
            ],
            isPopular: false,
            isSelected: _selectedPackage == 'PAKET STARTER',
            onSelect: () => setState(() => _selectedPackage = 'PAKET STARTER'),
            onDeselect: () => setState(() => _selectedPackage = null),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _HoverPackageCard(
            title: 'PAKET BISNIS',
            price: 'Rp 500.000',
            description: 'Untuk bisnis yang berkembang',
            features: [
              'Logo + brand guideline lengkap',
              'Desain kemasan produk (1 varian)',
              '10 template konten media sosial',
              'Mockup presentasi produk',
              'Semua benefit Paket Starter',
            ],
            isPopular: true,
            isSelected: _selectedPackage == 'PAKET BISNIS',
            onSelect: () => setState(() => _selectedPackage = 'PAKET BISNIS'),
            onDeselect: () => setState(() => _selectedPackage = null),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _HoverPackageCard(
            title: 'PAKET PREMIUM',
            price: 'Rp 1.000.000',
            description: 'Solusi lengkap branding',
            features: [
              'Full branding kit lengkap',
              'Desain kemasan (2 varian)',
              'Website 1 halaman (landing page)',
              '20 template konten sosmed',
              'Presentasi pitch deck 10 slide',
            ],
            isPopular: false,
            isSelected: _selectedPackage == 'PAKET PREMIUM',
            onSelect: () => setState(() => _selectedPackage = 'PAKET PREMIUM'),
            onDeselect: () => setState(() => _selectedPackage = null),
          ),
        ),
      ],
    );
  }

  Widget _buildMobilePackages() {
    return Column(
      children: [
        _HoverPackageCard(
          title: 'PAKET STARTER',
          price: 'Rp 250.000',
          description: 'Perfect untuk memulai',
          features: [
            'Logo profesional (3 konsep awal)',
            'Kartu nama digital (2 desain)',
            '3 template konten media sosial',
            'File: PNG, PDF, AI/CDR',
            'Revisi unlimited',
          ],
          isPopular: false,
          isSelected: _selectedPackage == 'PAKET STARTER',
          onSelect: () => setState(() => _selectedPackage = 'PAKET STARTER'),
          onDeselect: () => setState(() => _selectedPackage = null),
        ),
        const SizedBox(height: 24),
        _HoverPackageCard(
          title: 'PAKET BISNIS',
          price: 'Rp 500.000',
          description: 'Untuk bisnis yang berkembang',
          features: [
            'Logo + brand guideline lengkap',
            'Desain kemasan produk (1 varian)',
            '10 template konten media sosial',
            'Mockup presentasi produk',
            'Semua benefit Paket Starter',
          ],
          isPopular: true,
          isSelected: _selectedPackage == 'PAKET BISNIS',
          onSelect: () => setState(() => _selectedPackage = 'PAKET BISNIS'),
          onDeselect: () => setState(() => _selectedPackage = null),
        ),
        const SizedBox(height: 24),
        _HoverPackageCard(
          title: 'PAKET PREMIUM',
          price: 'Rp 1.000.000',
          description: 'Solusi lengkap branding',
          features: [
            'Full branding kit lengkap',
            'Desain kemasan (2 varian)',
            'Website 1 halaman (landing page)',
            '20 template konten sosmed',
            'Presentasi pitch deck 10 slide',
          ],
          isPopular: false,
          isSelected: _selectedPackage == 'PAKET PREMIUM',
          onSelect: () => setState(() => _selectedPackage = 'PAKET PREMIUM'),
          onDeselect: () => setState(() => _selectedPackage = null),
        ),
      ],
    );
  }
}

class _HoverPackageCard extends StatefulWidget {
  final String title;
  final String price;
  final String description;
  final List<String> features;
  final bool isPopular;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onDeselect;

  const _HoverPackageCard({
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    required this.isPopular,
    required this.isSelected,
    required this.onSelect,
    required this.onDeselect,
  });

  @override
  State<_HoverPackageCard> createState() => _HoverPackageCardState();
}

class _HoverPackageCardState extends State<_HoverPackageCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool lifted = _isHovered || widget.isSelected;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onSelect,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(
            0,
            lifted ? -12 : (widget.isPopular ? -8 : 0),
            0,
          ),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: widget.isPopular ? AppColors.goldGradient : null,
            color: widget.isPopular ? null : AppColors.grayDark,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.goldLight
                  : (_isHovered
                        ? AppColors.goldLight
                        : (widget.isPopular ? AppColors.gold : AppColors.gray)),
              width: widget.isSelected ? 3 : (_isHovered ? 2.5 : 2),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.gold.withOpacity(
                  widget.isSelected
                      ? 0.6
                      : (_isHovered ? 0.5 : (widget.isPopular ? 0.3 : 0.1)),
                ),
                blurRadius: widget.isSelected
                    ? 40
                    : (_isHovered ? 32 : (widget.isPopular ? 16 : 4)),
                spreadRadius: widget.isSelected ? 4 : (_isHovered ? 2 : 0),
                offset: Offset(0, lifted ? 8 : 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.isPopular && !widget.isSelected)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.gold),
                      ),
                      child: const Text(
                        '⭐ PALING POPULER',
                        style: TextStyle(
                          color: AppColors.gold,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (widget.isSelected)
                    GestureDetector(
                      onTap: widget.onDeselect,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.red.withOpacity(0.6),
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                ],
              ),

              if (widget.isPopular || widget.isSelected)
                const SizedBox(height: 16),

              Text(
                widget.title,
                style: TextStyle(
                  color: widget.isPopular ? AppColors.black : AppColors.gold,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.price,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: widget.isPopular ? AppColors.black : AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.description,
                style: TextStyle(
                  color: widget.isPopular
                      ? AppColors.black.withOpacity(0.7)
                      : AppColors.grayLighter,
                ),
              ),
              const SizedBox(height: 24),

              ...widget.features.map(
                (feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: widget.isPopular
                            ? AppColors.black
                            : AppColors.gold,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            color: widget.isPopular
                                ? AppColors.black
                                : AppColors.grayLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onSelect,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isSelected
                        ? AppColors.goldLight
                        : (widget.isPopular
                              ? AppColors.black
                              : Colors.transparent),
                    foregroundColor: AppColors.black,
                    side: BorderSide(
                      color: widget.isSelected
                          ? AppColors.goldLight
                          : (widget.isPopular
                                ? AppColors.black
                                : AppColors.gold),
                      width: 2,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.isSelected) ...[
                        const Icon(
                          Icons.check,
                          size: 18,
                          color: AppColors.black,
                        ),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        widget.isSelected ? 'Paket Dipilih' : 'Pilih Paket',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: widget.isSelected
                              ? AppColors.black
                              : AppColors.gold,
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
    );
  }
}
