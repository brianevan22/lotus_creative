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

  @override
  Widget build(BuildContext context) {
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

            // Desktop Menu
            if (MediaQuery.of(context).size.width > 768) ...[
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
                icon: const Icon(Icons.menu, color: AppColors.gold),
                onPressed: () {},
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
