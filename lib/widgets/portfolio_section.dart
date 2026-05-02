import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

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
            'Portfolio Kami',
            style: AppTextStyles.heading2,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Contoh hasil desain untuk berbagai UMKM',
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          isDesktop ? _buildDesktopGrid(context) : _buildMobileGrid(context),
        ],
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildPortfolioCard(
            context: context,
            imagePath: 'assets/images/UMKM_Fashion.png',
            title: 'UMKM Fashion',
            subtitle: 'Logo & Brand Identity',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildPortfolioCard(
            context: context,
            imagePath: 'assets/images/Kuliner_Kekinian.png',
            title: 'Kuliner Kekinian',
            subtitle: 'Packaging & Social Media',
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildPortfolioCard(
            context: context,
            imagePath: 'assets/images/Toko_Buah.png',
            title: 'Toko Buah Segar',
            subtitle: 'Full Branding Kit',
          ),
        ),
      ],
    );
  }

  Widget _buildMobileGrid(BuildContext context) {
    return Column(
      children: [
        _buildPortfolioCard(
          context: context,
          imagePath: 'assets/images/UMKM_Fashion.png',
          title: 'UMKM Fashion',
          subtitle: 'Logo & Brand Identity',
        ),
        const SizedBox(height: 24),
        _buildPortfolioCard(
          context: context,
          imagePath: 'assets/images/Kuliner_Kekinian.png',
          title: 'Kuliner Kekinian',
          subtitle: 'Packaging & Social Media',
        ),
        const SizedBox(height: 24),
        _buildPortfolioCard(
          context: context,
          imagePath: 'assets/images/Toko_Buah.png',
          title: 'Toko Buah Segar',
          subtitle: 'Full Branding Kit',
        ),
      ],
    );
  }

  void _showImagePreview(
    BuildContext context,
    String imagePath,
    String title,
    String subtitle,
  ) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (context) => _ImagePreviewDialog(
        imagePath: imagePath,
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  Widget _buildPortfolioCard({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return _HoverPortfolioCard(
      imagePath: imagePath,
      title: title,
      subtitle: subtitle,
      onTap: () => _showImagePreview(context, imagePath, title, subtitle),
    );
  }
}

class _HoverPortfolioCard extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _HoverPortfolioCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_HoverPortfolioCard> createState() => _HoverPortfolioCardState();
}

class _HoverPortfolioCardState extends State<_HoverPortfolioCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isHovered
                      ? AppColors.gold.withOpacity(0.7)
                      : AppColors.gold.withOpacity(0.2),
                  width: _isHovered ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: AppColors.gold.withOpacity(0.3),
                          blurRadius: 24,
                          spreadRadius: 2,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Stack(
                children: [
                  Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.grayDark,
                        child: const Center(
                          child: Icon(
                            Icons.image_outlined,
                            color: AppColors.gold,
                            size: 48,
                          ),
                        ),
                      );
                    },
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.black.withOpacity(0.5),
                          AppColors.black.withOpacity(0.9),
                        ],
                      ),
                    ),
                  ),
                  // Hover zoom icon overlay
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _isHovered ? 1.0 : 0.0,
                    child: Container(
                      color: AppColors.black.withOpacity(0.25),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.gold.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.zoom_in_rounded,
                            color: AppColors.black,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Title & subtitle
                  Positioned(
                    bottom: 24,
                    left: 24,
                    right: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.gold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.subtitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.grayLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImagePreviewDialog extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const _ImagePreviewDialog({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  State<_ImagePreviewDialog> createState() => _ImagePreviewDialogState();
}

class _ImagePreviewDialogState extends State<_ImagePreviewDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _scaleAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutBack,
    );
    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeIn);
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _close() async {
    await _animController.reverse();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnim,
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: ScaleTransition(
          scale: _scaleAnim,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 900),
            decoration: BoxDecoration(
              color: AppColors.grayDark,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.gold.withOpacity(0.4)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gold.withOpacity(0.2),
                  blurRadius: 40,
                  spreadRadius: 4,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 16, 0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.gold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.subtitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.grayLight,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _close,
                        icon: const Icon(Icons.close_rounded),
                        color: AppColors.grayLight,
                        hoverColor: AppColors.gold.withOpacity(0.15),
                        style: IconButton.styleFrom(
                          side: BorderSide(
                            color: AppColors.grayLight.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    widget.imagePath,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 300,
                        color: AppColors.grayDark,
                        child: const Center(
                          child: Icon(
                            Icons.image_outlined,
                            color: AppColors.gold,
                            size: 64,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
