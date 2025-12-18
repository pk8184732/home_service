//
// import '../../controller/home_service_controller.dart';
// import 'package:flutter/material.dart';
//
// import '../../custom_widget/custom_navigationbar.dart';
// import '../../models/category/category_model.dart';
// import '../../models/home_service_model.dart';
// import '../../models/user/user_model.dart';
//
// class HomeDataList extends StatefulWidget {
//   const HomeDataList({Key? key}) : super(key: key);
//
//   @override
//   State<HomeDataList> createState() => _HomeDataListState();
// }
//
// class _HomeDataListState extends State<HomeDataList> {
//   final HomeController controller = HomeController();
//   int currentPage = 0;
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final user = controller.getUser();
//     final offers = controller.getOffers();
//     final services = controller.getServices();
//     final categories = controller.getCategories();
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF1E4A99),
//       body: SafeArea(
//         bottom: false,
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     _buildHeader(user),
//                     const SizedBox(height: 16),
//                     _buildSearchBar(),
//                     const SizedBox(height: 20),
//                     _buildOfferSection(offers),
//                     const SizedBox(height: 24),
//                     _buildServiceSection(services),
//                     _buildCategorySection(categories),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       extendBody: true,
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: selectedIndex,
//         onTap: (index) => setState(() => selectedIndex = index),
//       ),
//     );
//   }
//
//   Widget _buildHeader(UserModel user) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 24,
//             backgroundColor: Colors.grey[300],
//             backgroundImage: AssetImage(user.profileImage),
//             onBackgroundImageError: (_, __) {},
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hello ${user.name}!',
//                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
//                 ),
//                 Text(
//                   user.location,
//                   style: const TextStyle(fontSize: 11, color: Colors.white),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 22,
//             height: 22,
//             decoration: const BoxDecoration(color: Color(0xFFFFC107), shape: BoxShape.circle),
//             child: const Center(
//               child: Icon(Icons.home_outlined, color: Colors.white, size: 15),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Stack(
//             children: [
//               const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 24),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(width: 12),
//           Stack(
//             children: [
//               const Icon(Icons.notifications_outlined, color: Colors.white, size: 24),
//               Positioned(
//                 right: 0,
//                 top: 0,
//                 child: Container(
//                   width: 8,
//                   height: 8,
//                   decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: const TextField(
//           decoration: InputDecoration(
//             hintText: "Search for 'Asphalt Repair'",
//             hintStyle: TextStyle(color: Color(0xFFC7C7CC), fontSize: 16),
//             prefixIcon: Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Icon(Icons.search, color: Color(0xFFC7C7CC), size: 30),
//             ),
//             border: InputBorder.none,
//             contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOfferSection(List<OfferModel> offers) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 170,
//           child: PageView.builder(
//             onPageChanged: (index) => setState(() => currentPage = index),
//             itemCount: offers.length,
//             itemBuilder: (context, index) {
//               final offer = offers[index];
//               return _OfferCard(offer: offer);
//             },
//           ),
//         ),
//         const SizedBox(height: 12),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             offers.length,
//                 (index) => Container(
//               width: 8,
//               height: 8,
//               margin: const EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: currentPage == index ? Colors.white : Colors.white.withOpacity(0.4),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildServiceSection(List<ServiceModel> services) {
//     return Container(
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24),
//           topRight: Radius.circular(24),
//         ),
//         color: Colors.white,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Service', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.black)),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text('View All', style: TextStyle(fontSize: 17, color: Color(0xFF1E4A99), fontWeight: FontWeight.bold)),
//                 ),
//               ],
//             ),
//           ),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               childAspectRatio: 0.99,
//               crossAxisSpacing: 13,
//               mainAxisSpacing: 12,
//             ),
//             itemCount: services.length,
//             itemBuilder: (context, index) => _ServiceCard(service: services[index]),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategorySection(List<CategoryModel> categories) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.fromLTRB(20, 10, 20, 12),
//             child: Text('Categories', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black)),
//           ),
//           SizedBox(
//             height: 220,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               itemCount: categories.length,
//               itemBuilder: (context, index) => Container(
//                 width: 140,
//                 margin: EdgeInsets.only(right: index < categories.length - 1 ? 12 : 0),
//                 child: _CategoryCard(category: categories[index]),
//               ),
//             ),
//           ),
//           const SizedBox(height: 100),
//         ],
//       ),
//     );
//   }
// }