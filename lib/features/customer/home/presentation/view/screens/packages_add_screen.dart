import 'package:flutter/material.dart';
import 'package:theshortkutbran/app/widgets/appbar/simple_appbar.dart';

class BasicPackageScreen extends StatefulWidget {
  @override
  _BasicPackageScreenState createState() => _BasicPackageScreenState();
}

class _BasicPackageScreenState extends State<BasicPackageScreen> {
  int _selectedService = 0;
  bool _showPackages = false;

  void _selectService(int index) {
    setState(() {
      _selectedService = index;
    });
  }

  void _openAnotherPackage() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => AnotherPackageScreen()));
  }

  void _showPackageSection() {
    setState(() {
      _showPackages = true;
    });
  }

  Widget _buildServiceOption(String title, int index) {
    bool isSelected = _selectedService == index;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: GestureDetector(
        onTap: () => _selectService(index),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? Colors.green : Colors.white,
              size: 24,
            ),
            SizedBox(width: 16),
            Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(String label, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 NEW: Package UI
  Widget _buildPackageList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Packages",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),

          // PACKAGE CARD 1
          _packageCard("Premium Shave", "\$10.00"),

          // PACKAGE CARD 2
          _packageCard("Facial Treatment", "\$15.00"),

          // PACKAGE CARD 3
          _packageCard("Hair Coloring", "\$18.00"),
        ],
      ),
    );
  }

  Widget _packageCard(String title, String price) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
          Text(
            price,
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomServiceAppBar(
        title: 'Service Details',
        backgroundColor: Colors.transparent,
        titleColor: Colors.white,
        iconColor: Colors.white,
        leadingContainerColor: Colors.grey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 20.0),
                child: Text(
                  'Basic Package',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              // SERVICE OPTIONS
              _buildServiceOption('Haircut Style', 0),
              _buildServiceOption('Shave or Beard Trim', 1),
              _buildServiceOption('Line Up', 2),

              SizedBox(height: 30),

              // ADD SERVICE BUTTON
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: OutlinedButton(
                    onPressed: _showPackageSection, // 👈 CLICK -> SHOW PACKAGES
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.white, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Add Service',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ),

              // SHOW PACKAGE LIST WHEN BUTTON CLICKED
              if (_showPackages) _buildPackageList(),

              SizedBox(height: 180),
              // PRICE SECTION
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildPriceRow('Price', '\$22.00'),
                    _buildPriceRow('Apps fee', '\$2.50'),
                    _buildPriceRow('Taxes fee', '\$1.50'),
                    Divider(
                      color: Colors.grey.shade300,
                      height: 20,
                      thickness: 1,
                    ),
                    _buildPriceRow('Total price', '\$25.50'),
                    SizedBox(height: 20),

                    Container(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: _openAnotherPackage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
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
    );
  }
}

class AnotherPackageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Another Package Screen'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'Successfully Navigated to the new package!',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
