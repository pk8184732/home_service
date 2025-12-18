import 'package:flutter/material.dart';
import '../../controller/verification/verification_controller.dart';
import '../../custom_widget/custom_navigationbar.dart';
import '../../models/category/category_model.dart';
import '../../models/user/user_model.dart';

class ServiceModel {
  final String name;
  final String image;

  ServiceModel({required this.name, required this.image});
}


class OfferModel {
  final String title;
  final String price;
  final String discount;
  final String description;
  final String image;

  OfferModel({
    required this.title,
    required this.price,
    required this.discount,
    required this.description,
    required this.image,
  });
}

class HomeController {
  UserModel getUser() {
    return UserModel(
      name: 'Tristan',
      location: 'Airport Gate -Motital Colony-Rajbari-du....',
      profileImage: 'assets/images/profile_image.jpg',
    );
  }

  List<OfferModel> getOffers() {
    return [
      OfferModel(
        title: 'Sealcoating Services',
        price: 'Rs. 699',
        discount: 'Rs. 299/year only',
        description: '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499',
        image: 'assets/images/tool1.jpg',
      ),
      OfferModel(
        title: 'Sealcoating Services',
        price: 'Rs. 699',
        discount: 'Rs. 299/year only',
        description: '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499',
        image: 'assets/images/tool1.jpg',
      ),
      OfferModel(
        title: 'Sealcoating Services',
        price: 'Rs. 699',
        discount: 'Rs. 299/year only',
        description: '*Medicine Delivery: Up to 25% Off | Lab Tests: Up to 25% Off | Home Visit: ₹499',
        image: 'assets/images/tool1.jpg',
      ),
    ];
  }

  List<ServiceModel> getServices() {
    return [
      ServiceModel(name: 'Paving', image: 'assets/images/service1.jpg'),
      ServiceModel(name: 'Sealcoating', image: 'assets/images/service2.jpg'),
      ServiceModel(name: 'Cold Planing', image: 'assets/images/service3.jpg'),
      ServiceModel(name: 'Asphalt\nRepair', image: 'assets/images/service4.jpg'),
      ServiceModel(name: 'Sports Court', image: 'assets/images/service5.jpg'),
      ServiceModel(name: 'Crack Seal', image: 'assets/images/service6.jpg'),
    ];
  }

  List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        name: 'Jcy',
        phone: '+732 9999 III',
        image: 'assets/images/person1.jpg',
        stars: 2,
      ),
      CategoryModel(
        name: 'Laila',
        phone: 'B: 732 9999 III',
        image: 'assets/images/person2.jpg',
        stars: 2,
      ),
      CategoryModel(
        name: 'Doe John',
        phone: 'B: 732 9999 III',
        image: 'assets/images/person3.jpg',
        stars: 2,
      ),
    ];
  }
}

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final VerificationController controller = VerificationController();
  final List<TextEditingController> otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E4A99),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildLogo(),
                  const SizedBox(height: 20),
                  const Text(
                    'Verification',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildEmailField(),
                    const SizedBox(height: 32),
                    _buildOTPFields(),
                    const SizedBox(height: 40),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Image.asset(
          'assets/images/home_icon.png',
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => const Icon(
            Icons.home_outlined,
            color: Color(0xFF1E4A99),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter email address',
          style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93)),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: TextEditingController(text: controller.email),
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: const TextStyle(color: Color(0xFF8E8E93)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF1E4A99), width: 2),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }

  Widget _buildOTPFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OTP',
          style: TextStyle(fontSize: 14, color: Color(0xFF8E8E93)),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: index < 9 ? 17 : 20),
                  height: 60,
                  child: TextField(
                    controller: otpControllers[index],
                    focusNode: focusNodes[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF1E4A99), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE5E5EA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF1E4A99), width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      controller.setOtpDigit(index, value);
                      if (value.isNotEmpty && index < 3) {
                        focusNodes[index + 1].requestFocus();
                      }
                      if (value.isEmpty && index > 0) {
                        focusNodes[index - 1].requestFocus();
                      }
                    },
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E4A99),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
        child: const Text(
          'Submit',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

// ==================== HOME SCREEN ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = HomeController();
  int currentPage = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = controller.getUser();
    final offers = controller.getOffers();
    final services = controller.getServices();
    final categories = controller.getCategories();

    return Scaffold(
      backgroundColor: const Color(0xFF1E4A99),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(user),
                    const SizedBox(height: 16),
                    _buildSearchBar(),
                    const SizedBox(height: 20),
                    _buildOfferSection(offers),
                    const SizedBox(height: 24),
                    _buildServiceSection(services),
                    _buildCategorySection(categories),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index),
      ),
    );
  }

  Widget _buildHeader(UserModel user) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[300],
            backgroundImage: AssetImage(user.profileImage),
            onBackgroundImageError: (_, __) {},
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello ${user.name}!',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Text(
                  user.location,
                  style: const TextStyle(fontSize: 11, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(color: Color(0xFFFFC107), shape: BoxShape.circle),
            child: const Center(
              child: Icon(Icons.home_outlined, color: Colors.white, size: 15),
            ),
          ),
          const SizedBox(width: 12),
          Stack(
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 24),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Stack(
            children: [
              const Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: "Search for 'Asphalt Repair'",
            hintStyle: TextStyle(color: Color(0xFFC7C7CC), fontSize: 16),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.search, color: Color(0xFFC7C7CC), size: 30),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferSection(List<OfferModel> offers) {
    return Column(
      children: [
        SizedBox(
          height: 170,
          child: PageView.builder(
            onPageChanged: (index) => setState(() => currentPage = index),
            itemCount: offers.length,
            itemBuilder: (context, index) {
              final offer = offers[index];
              return _OfferCard(offer: offer);
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            offers.length,
                (index) => Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index ? Colors.white : Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildServiceSection(List<ServiceModel> services) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Service', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black)),
                TextButton(
                  onPressed: () {},
                  child: const Text('View All', style: TextStyle(fontSize: 17, color: Color(0xFF1E4A99), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.99,
              crossAxisSpacing: 13,
              mainAxisSpacing: 12,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) => _ServiceCard(service: services[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(List<CategoryModel> categories) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 12),
            child: Text('Categories', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black)),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: categories.length,
              itemBuilder: (context, index) => Container(
                width: 140,
                margin: EdgeInsets.only(right: index < categories.length - 1 ? 12 : 0),
                child: _CategoryCard(category: categories[index]),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  final OfferModel offer;
  const _OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF4672E1)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(offer.price, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF4672E1))),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            offer.discount,
                            style: const TextStyle(fontSize: 13, color: Color(0xFF8E8E93)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E4A99),
                        padding: const EdgeInsets.symmetric(horizontal: 39),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Buy Now', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        offer.description,
                        style: const TextStyle(fontSize: 8, color: Color(0xFF8E8E93)),
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image.asset(
              offer.image,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFFE3F2FD),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final ServiceModel service;
  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(service.image, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: Colors.grey)),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                service.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        category.name,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        3,
                            (index) => Icon(
                          index < category.stars ? Icons.star : Icons.star_border,
                          color: index < category.stars ? Colors.orange : Colors.grey,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  category.phone,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}