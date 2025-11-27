import 'package:flutter/material.dart';
import 'package:theshortkutbran/features/customer/home/presentation/successful_payment.dart';

class PaymentScreen extends StatelessWidget {
  Widget _buildCard() {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Center(child: Image.asset('assets/images/payment_card.png')),
      // child: Stack(
      //   children: [
      //     Positioned.fill(
      //       child: Opacity(
      //         opacity: 0.15,
      //         child: CustomPaint(
      //           painter: CardPatternPainter(),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: EdgeInsets.all(24.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Row(
      //             children: [
      //               Icon(Icons.eighteen_mp, color: Colors.white, size: 36),
      //               SizedBox(width: 8),
      //               Text(
      //                 'Maestro Kard',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ],
      //           ),
      //           Text(
      //             '2894 - 4389 - 4432 - 9432',
      //             style: TextStyle(
      //               fontSize: 22,
      //               fontWeight: FontWeight.w600,
      //               letterSpacing: 1.5,
      //               color: Colors.white,
      //             ),
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'Holder Name',
      //                 style: TextStyle(fontSize: 14, color: Colors.grey),
      //               ),
      //               Text(
      //                 'Wade Warren',
      //                 style: TextStyle(
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildFormField({required String title, required String hintText, int maxLines = 1, bool isDigits = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType: isDigits ? TextInputType.number : TextInputType.text,
            maxLines: maxLines,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[600]),

              // Only keep OutlineInputBorder with no visible border & rounded corners
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),

              // Box background color
              filled: true,
              fillColor: Colors.grey[300],

              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            ),
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard(),
            _buildFormField(
              title: 'Card Number',
              hintText: 'Enter Card Number',
              isDigits: true,
            ),
            _buildFormField(
              title: 'Card Holder Name',
              hintText: 'Enter Holder Name',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expired',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.datetime,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'MM/YY',
                  hintStyle: TextStyle(color: Colors.grey[600]),

                  filled: true,
                  fillColor: Colors.grey[300],

                  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),

                  // Add rounded borders with radius 30 and no visible border line
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),


                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV Code',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        TextField(
                          keyboardType: TextInputType.datetime,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: 'CCV',
                            hintStyle: TextStyle(color: Colors.grey[600]),

                            filled: true,
                            fillColor: Colors.grey[300],

                            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),

                            // Add rounded borders with radius 30 and no visible border line
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedCoupon = await showDialog(
                      context: context,
                      builder: (context) => SuccessfulPayment(),
                    );

                    print("User selected coupon index: $selectedCoupon");

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => RequestStatusScreen()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text(
                    'Payment',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    double radius = size.height * 0.7;

    canvas.drawCircle(Offset(size.width * 0.9, size.height * -0.1), radius, paint);
    canvas.drawCircle(Offset(size.width * 0.0, size.height * 1.0), radius * 0.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}