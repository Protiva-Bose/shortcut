import 'package:flutter/material.dart';

import '../../../core/constant/route_names.dart';

class BookingConfirmationForm extends StatefulWidget {
  @override
  _BookingConfirmationFormState createState() => _BookingConfirmationFormState();
}

class _BookingConfirmationFormState extends State<BookingConfirmationForm> {
  bool _termsAccepted = false;

  void _onContinuePressed() {}

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
                  _buildInputField('First Name', 'Enter your first name', isMultiline: false),
                  const SizedBox(height: 30),
                  _buildInputField('Note for worker', 'Enter your first name', isMultiline: true),
                  const SizedBox(height: 30),
                  _buildTermsCheckbox(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
            _buildContinueButton(),

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
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/booking_user.png'),
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

  Widget _buildInputField(String label, String hint, {required bool isMultiline}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          maxLines: isMultiline ? 5 : 1,
          minLines: isMultiline ? 5 : 1,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: const Color(0xFFF1F4F8),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: isMultiline ? 15 : 18),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsCheckbox() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24.0,
          height: 24.0,
          child: Checkbox(
            value: _termsAccepted,
            onChanged: (bool? newValue) {
              setState(() {
                _termsAccepted = newValue ?? false;
              });
            },
            activeColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Text(
            'I accept the Cutly Terms of Service, Community Guidelines, and Privacy Policy.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
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
            onPressed:(){
              Navigator.pushNamed(context, RouteNames.bookingSummaryScreen);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              disabledBackgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Continue',
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