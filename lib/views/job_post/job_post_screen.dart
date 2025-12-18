
import 'package:flutter/material.dart';

import '../../controller/job/post_job_controller.dart';



class PostJobScreen extends StatefulWidget {
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final PostJobController _controller = PostJobController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();
  final TextEditingController _skillsController = TextEditingController();
  String _selectedCategory = '';
  int _currentStep = 1;

  @override
  void dispose() {
    _jobTitleController.dispose();
    _detailsController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Column(
        children: [
          // Header
          Container(
            color: const Color(0xFF164C9F),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 22),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const Expanded(
                            child: Text(
                              'Post a Job',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined, color: Colors.white, size: 30),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text(
                        'Complete all fields to get started',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Form Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(33),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progress Indicator
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              _buildStepIndicator(1, _currentStep == 1),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 3,
                                    color: _currentStep >= 2 ? const Color(0xFF1E56A0) : Colors.grey[300],
                                    margin: const EdgeInsets.symmetric(horizontal: 4,vertical: 25),
                                  ),
                                ),
                              ),
                              _buildStepIndicator(2, _currentStep == 2),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 3,
                                    color: _currentStep >= 3 ? const Color(0xFF164C9F)
                                        : Colors.grey[300],
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                ),
                              ),
                              _buildStepIndicator(3, _currentStep == 3),
                            ],
                          ),
                        ),

                        // Job Title
                        _buildLabel('Job Title', true),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _jobTitleController,
                          onChanged: _controller.updateJobTitle,
                        ),
                        const SizedBox(height: 20),

                        // Details
                        _buildLabel('Details', true),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _detailsController,
                          onChanged: _controller.updateDetails,
                          maxLines: 5,
                        ),
                        const SizedBox(height: 20),

                        // Category
                        _buildLabel('Category', true),
                        const SizedBox(height: 8),
                        _buildDropdown(),
                        const SizedBox(height: 20),

                        // Required Skills
                        _buildLabel('Required Skills', true),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _skillsController,
                          onChanged: _controller.updateRequiredSkills,
                        ),
                        const SizedBox(height: 40),

                        // Next Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => _controller.submitJob(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF164C9F),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom Navigation
          _buildBottomNav(context, 0),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int step, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentStep = step;
        });
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF164C9F) : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? const Color(0xFF164C9F) : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            '$step',
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[400],
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, bool required) {
    return Row(
      children: [
        Icon(
          Icons.local_offer_outlined,
          color: const Color(0xFF164C9F),
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        if (required)
          const Text(
            ' *',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required Function(String) onChanged,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: '',
          hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
        ),
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(borderRadius: BorderRadius.circular(12),
          value: _selectedCategory.isEmpty ? null : _selectedCategory,
          isExpanded: true,dropdownColor: Colors.white,
          hint: const Text(''),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          items: ['General Contracting', 'Kitchen Remodel', 'Bathroom Remodel', 'Home Additions']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue ?? '';
              _controller.updateCategory(_selectedCategory);
            });
          },
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context, int currentIndex) {
    return Container(
      margin: const EdgeInsets.only(top: 5,bottom: 16,left: 16,right: 16),
      decoration: const BoxDecoration(
        color: Color(0xFF164C9F),
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 0, currentIndex),
            _buildNavItem(Icons.receipt_long_outlined, 1, currentIndex),
            _buildNavItem(Icons.add_circle_outline, 2, currentIndex),
            _buildNavItem(Icons.chat_bubble_outline, 3, currentIndex),
            _buildNavItem(Icons.person_outline, 4, currentIndex),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index, int currentIndex) {
    return IconButton(
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.white : Colors.white,
        size: 26,
      ),
      onPressed: () {},
    );
  }
}