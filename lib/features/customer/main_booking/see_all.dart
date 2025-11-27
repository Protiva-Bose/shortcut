import 'package:flutter/material.dart';

import '../../../app/widgets/appbar/simple_appbar.dart';
import 'explore_barbar.dart';

class BarberGalleryScreen extends StatefulWidget {
  @override
  _BarberGalleryScreenState createState() => _BarberGalleryScreenState();
}

class _BarberGalleryScreenState extends State<BarberGalleryScreen> {
  final List<String> _galleryImages = [
    'https://placehold.co/200x200/cccccc/white?text=Work+1',
    'https://placehold.co/200x200/dddddd/white?text=Work+2',
    'https://placehold.co/200x200/eeeeee/white?text=Work+3',
    'https://placehold.co/200x200/ffffff/black?text=Work+4',
    'https://placehold.co/200x200/f0f0f0/black?text=Work+5',
    'https://placehold.co/200x200/d0d0d0/black?text=Work+6',
  ];

  int selectedIndex = -1; // no selection initially

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: 'Our Best Work',
        backgroundColor: Colors.white,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.grey.shade300,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 100.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.0,
                ),
                itemCount: _galleryImages.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // update selection
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: isSelected
                            ? Border.all(color: Colors.black, width: 3)
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.network(
                              _galleryImages[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/booking_user.png',

                                    ),
                                  ),
                                );
                              },
                            ),

                            // selection overlay
                            if (isSelected)
                              Container(
                                color: Colors.black.withOpacity(0.15),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Bottom Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 80),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedIndex == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select an image")),
                      );
                    } else {
                      print("Selected index: $selectedIndex");
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceMapViewScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
