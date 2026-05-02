import 'package:flutter/material.dart';
import 'package:lotus_creative/widgets/custom_navigation_bar.dart';
import 'package:lotus_creative/widgets/hero_section.dart';
import 'package:lotus_creative/widgets/about_section.dart';
import 'package:lotus_creative/widgets/services_section.dart';
import 'package:lotus_creative/widgets/portfolio_section.dart';
import 'package:lotus_creative/widgets/testimonial_section.dart';
import 'package:lotus_creative/widgets/contact_section.dart';
import 'package:lotus_creative/widgets/footer_section.dart';
import 'package:lotus_creative/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 80),

                // 🔥 SECTIONS
                HeroSection(
                  key: _homeKey,
                  onMulaiSekarang: () => scrollToSection(_servicesKey),
                  onLihatPortfolio: () => scrollToSection(_portfolioKey),
                ),
                AboutSection(key: _aboutKey),
                ServicesSection(key: _servicesKey),
                PortfolioSection(key: _portfolioKey),
                const TestimonialSection(),
                ContactSection(key: _contactKey),
                const FooterSection(),
              ],
            ),
          ),

          // 🔥 NAVBAR
          CustomNavigationBar(
            onHomePressed: () => scrollToSection(_homeKey),
            onAboutPressed: () => scrollToSection(_aboutKey),
            onServicesPressed: () => scrollToSection(_servicesKey),
            onPortfolioPressed: () => scrollToSection(_portfolioKey),
            onContactPressed: () => scrollToSection(_contactKey),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
