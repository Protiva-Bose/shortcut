import 'package:flutter/material.dart';
import 'package:theshortkutbran/features/customer/review/review_second.dart';

class ServiceRatingForm extends StatefulWidget {
  @override
  _ServiceRatingFormState createState() => _ServiceRatingFormState();
}

class _ServiceRatingFormState extends State<ServiceRatingForm> {
  double _haircutRating = 3.0;
  double _cleanlinessRating = 3.0;
  double _customerServiceRating = 3.0;
  double _appearanceRating = 3.0;
  double _preparednessRating = 3.0;

  void _onNextPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildProviderHeader(),
                  const SizedBox(height: 30),
                  _buildRatingCard('Haircut',
                      'Quality of the cut, style, and overall satisfaction.',
                      _haircutRating, (rating) {
                        setState(() {
                          _haircutRating = rating;
                        });
                      }),
                  const SizedBox(height: 15),
                  _buildRatingCard('Cleanliness',
                      'Sanitation and hygiene practices in the salon or mobile setup.',
                      _cleanlinessRating, (rating) {
                        setState(() {
                          _cleanlinessRating = rating;
                        });
                      }),
                  const SizedBox(height: 15),
                  _buildRatingCard('Customer Service',
                      'Friendliness, communication, and attentiveness of the barber.',
                      _customerServiceRating, (rating) {
                        setState(() {
                          _customerServiceRating = rating;
                        });
                      }),
                  const SizedBox(height: 15),
                  _buildRatingCard('Appearance (ShortKut Uniform)',
                      'Professionalism and neatness of the barber\'s attire, specifically wearing the ShortKut shirt uniform.',
                      _appearanceRating, (rating) {
                        setState(() {
                          _appearanceRating = rating;
                        });
                      }),
                  const SizedBox(height: 15),
                  _buildRatingCard('Preparedness (Mandatory ShortKut Barber Case)',
                      'Whether the barber had the required ShortKut barber case prepared and organized with necessary tools and products.',
                      _preparednessRating, (rating) {
                        setState(() {
                          _preparednessRating = rating;
                        });
                      }),
                  const SizedBox(height: 120),
                ],
              ),
            ),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProviderHeader() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
              image: AssetImage('assets/images/booking_user.png'),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Abraham Ledner',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Hair Extensions - Sharp & Dapper',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFFFCC00), size: 16),
                    const SizedBox(width: 5),
                    Text(
                      '4.0',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '| 120 Reviews',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingCard(String title, String description, double rating,
      void Function(double) onRatingUpdate) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  onRatingUpdate(index + 1.0);
                },
                child: Icon(
                  index < rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: const Color(0xFFFFCC00),
                  size: 35,
                ),
              );
            }),
          ),
          const SizedBox(height: 5),
          Center(
            child: Text(
              'Good',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 40),
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
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WriteReviewModal()),
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
              'Next',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}