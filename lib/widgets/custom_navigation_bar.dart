import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onServicesPressed;
  final VoidCallback onPortfolioPressed;
  final VoidCallback onContactPressed;

  const CustomNavigationBar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onServicesPressed,
    required this.onPortfolioPressed,
    required this.onContactPressed,
  });

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          border: Border.all(color: AppColors.gold.withOpacity(0.2)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: AppColors.gold.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            _MobileMenuItem(
              icon: Icons.home_outlined,
              label: 'Beranda',
              onPressed: () {
                Navigator.pop(context);
                onHomePressed();
              },
            ),
            _MobileMenuItem(
              icon: Icons.info_outline,
              label: 'Tentang',
              onPressed: () {
                Navigator.pop(context);
                onAboutPressed();
              },
            ),
            _MobileMenuItem(
              icon: Icons.design_services_outlined,
              label: 'Layanan',
              onPressed: () {
                Navigator.pop(context);
                onServicesPressed();
              },
            ),
            _MobileMenuItem(
              icon: Icons.photo_library_outlined,
              label: 'Portfolio',
              onPressed: () {
                Navigator.pop(context);
                onPortfolioPressed();
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  onContactPressed();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Hubungi Kami',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 768;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(color: AppColors.gold.withOpacity(0.2), width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            // Logo
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
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
                    );
                  },
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

            const Spacer(),

            if (isDesktop) ...[
              _NavButton(label: 'Beranda', onPressed: onHomePressed),
              const SizedBox(width: 32),
              _NavButton(label: 'Tentang', onPressed: onAboutPressed),
              const SizedBox(width: 32),
              _NavButton(label: 'Layanan', onPressed: onServicesPressed),
              const SizedBox(width: 32),
              _NavButton(label: 'Portfolio', onPressed: onPortfolioPressed),
              const SizedBox(width: 32),
              ElevatedButton(
                onPressed: onContactPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.gold,
                  foregroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: const Text(
                  'Hubungi Kami',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ] else
              IconButton(
                icon: const Icon(Icons.menu, color: AppColors.gold, size: 28),
                onPressed: () => _openMobileMenu(context),
              ),
          ],
        ),
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _MobileMenuItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.gold.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.gold, size: 20),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(color: AppColors.white, fontSize: 16),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right,
              color: AppColors.gold.withOpacity(0.5),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _NavButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: AppColors.grayLight, fontSize: 16),
      ),
    );
  }
}
