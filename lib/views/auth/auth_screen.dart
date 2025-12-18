
import 'package:flutter/material.dart';

import '../../custom_widget/custom_textfild.dart';
import '../../models/auth/auth_model.dart';
import '../verification/verification_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AuthModel model = AuthModel();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _rememberMe = false;
  bool _acceptTerms = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 400;

    return Scaffold(
      backgroundColor: const Color(0xFF164C9F),
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            color: const Color(0xFF164C9F),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.all(isSmall ? 24 : 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                          model.logoImage,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.home_rounded,
                              color: Color(0xFF164C9F),
                              size: 30,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: isSmall ? 16 : 20),
                    Text(
                      model.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isSmall ? 32 : 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: isSmall ? 8 : 12),
                    Text(
                      model.subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: isSmall ? 11 : 15,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: const Color(0xFF1A1A1A),
                        unselectedLabelColor: const Color(0xFF666666),
                        labelStyle: TextStyle(
                          fontSize: isSmall ? 15 : 16,
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelStyle: TextStyle(
                          fontSize: isSmall ? 15 : 16,
                          fontWeight: FontWeight.w500,
                        ),
                        tabs: const [
                          Tab(text: 'Log In'),
                          Tab(text: 'Sign Up'),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Label('Email'),
                              const SizedBox(height: 8),
                              const TextFields(hint: 'Loisbecket@gmail.com'),
                              const SizedBox(height: 20),
                              const Label('Password'),
                              const SizedBox(height: 8),
                              TextFields(
                                hint: '*******',
                                obscure: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    color: const Color(0xFF999999),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscurePassword = !_obscurePassword);
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() => _rememberMe = !_rememberMe);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFF164C9F),
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: _rememberMe
                                              ? const Icon(
                                            Icons.check,
                                            size: 14,
                                            color: Color(0xFF164C9F),
                                          )
                                              : null,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Remember me',
                                          style: TextStyle(
                                            color: const Color(0xFF666666),
                                            fontSize: isSmall ? 13 : 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Forgot Password ?',
                                      style: TextStyle(
                                        color: const Color(0xFF164C9F),
                                        fontSize: isSmall ? 13 : 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Button(
                                text: 'Log In',
                                onPressed: () {
                                  _tabController.animateTo(1);
                                },
                                isSmall: isSmall,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'Or',
                                      style: TextStyle(
                                        color: const Color(0xFF999999),
                                        fontSize: isSmall ? 13 : 14,
                                      ),
                                    ),
                                  ),
                                  const Expanded(child: Divider(color: Color(0xFFE0E0E0))),
                                ],
                              ),
                              const SizedBox(height: 20),
                              SocialButton(
                                text: 'Continue with Google',
                                isGoogle: true,
                                isSmall: isSmall,
                              ),
                              const SizedBox(height: 12),
                              SocialButton(
                                text: 'Continue with Facebook',
                                isGoogle: false,
                                isSmall: isSmall,
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),

                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: isSmall ? 16 : 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              const Label('Name'),
                              const SizedBox(height: 8),
                              const TextFields(hint: 'Enter your name'),
                              const SizedBox(height: 16),
                              const Label('Email'),
                              const SizedBox(height: 8),
                              const TextFields(hint: 'Loisbecket@gmail.com'),
                              const SizedBox(height: 16),
                              const Label('Phone Number'),
                              const SizedBox(height: 8),
                              const TextFields(hint: '(212) 555-1234'),
                              const SizedBox(height: 16),
                              const Label('Password'),
                              const SizedBox(height: 8),
                              TextFields(
                                hint: '*******',
                                obscure: _obscurePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    color: const Color(0xFF999999),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscurePassword = !_obscurePassword);
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Label('Confirm Password'),
                              const SizedBox(height: 8),
                              TextFields(
                                hint: '*******',
                                obscure: _obscureConfirmPassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                    color: const Color(0xFF999999),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                                  },
                                ),
                              ),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() => _acceptTerms = !_acceptTerms);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFF164C9F),
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: _acceptTerms
                                          ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        color: Color(0xFF164C9F),
                                      )
                                          : null,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Terms & Condition',
                                      style: TextStyle(
                                        color: const Color(0xFF164C9F),
                                        fontSize: isSmall ? 13 : 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Button(
                                text: 'Sign Up',
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationScreen(),));
                                },
                                isSmall: isSmall,
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
