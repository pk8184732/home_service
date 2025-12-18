import 'dart:async';
import 'package:flutter/material.dart';
import 'package:home_service/views/auth/auth_screen.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 20), () {
      Navigator.pushReplacementNamed(context, '/verification');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
          if (index == 1) _startTimer();
        },
        children: [
          _buildSplashScreen(),
          _buildSelectionScreen(),
        ],
      ),
    );
  }

  Widget _buildSplashScreen() {
    return Stack(
      children: [
        _buildBackground(),
        SafeArea(
          child: Stack(
            children: [
              Center(child: _buildLogo()),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: _buildPageIndicator(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSelectionScreen() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildBackground(),
        SafeArea(
          child: Stack(
            children: [
              Center(child: _buildLogo()),
              Positioned(
                bottom: size.height * 0.05,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'Choose an option to get started. You can add another account at any time.',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          letterSpacing: -0.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    _buildOptionButtons(),
                    SizedBox(height: size.height * 0.025),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacementNamed(context, '/verification'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.3,
                            ),
                          ),
                          TextButton(onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
                          }, child: Text("Log in", style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.3,
                          ),))
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildPageIndicator(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/home.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: const Color(0xFF4672E1)),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF3350C6).withOpacity(0.6),
                  const Color(0xFF3350C6).withOpacity(0.75),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/home_icon.png',
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(Icons.home_rounded, size: 60, color: Color(0xFF2B5F8F)),
        ),
      ),
    );
  }

  Widget _buildOptionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: _buildOptionButton('I\'m a Home Owner', true),
          ),
          Expanded(
            child: _buildOptionButton('I\'m a Contractor', false),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String text, bool isLeft) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, '/verification'),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(0.6), width: 1.5),
          borderRadius: BorderRadius.only(
            topLeft: isLeft ? const Radius.circular(12) : Radius.zero,
            bottomLeft: isLeft ? const Radius.circular(12) : Radius.zero,
            topRight: !isLeft ? const Radius.circular(12) : Radius.zero,
            bottomRight: !isLeft ? const Radius.circular(12) : Radius.zero,
          ),
          color: Colors.white.withOpacity(0.08),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 32 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.white : Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}