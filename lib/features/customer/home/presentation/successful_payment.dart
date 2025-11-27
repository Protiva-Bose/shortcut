import 'package:flutter/material.dart';
import 'package:theshortkutbran/features/parent/presentation/parent_screen.dart';

import '../../review/review_first.dart';
import 'method_select.dart';

class SuccessfulPayment extends StatefulWidget {
  @override
  _SuccessfulPaymentState createState() => _SuccessfulPaymentState();
}

class _SuccessfulPaymentState extends State<SuccessfulPayment> {
  int _selectedCoupon = 0;

  Widget _couponTile({
    required int index,
    required String title,
    required String expiry,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Image.asset('assets/icons/discount-shape.png',scale: 3,),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      expiry,
                      style:
                      TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "See Detail",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )
                  ],
                ),
              ],
            ),
          ),

          // CHECKBOX
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedCoupon = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(2),
              child: Icon(
                _selectedCoupon == index
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                size: 26,
                color:
                _selectedCoupon == index ? Colors.black : Colors.grey[400],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // HEADER ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Text(
                  //   "My Coupon",
                  //   style: TextStyle(
                  //       fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 26),
                  )
                ],
              ),
              SizedBox(height: 20),

              // COUPON LIST
           Image.asset('assets/images/succ_payy.png',scale: 3,),
            Text('Payment Success! ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800,color: Colors.black),),
            Text(
              textAlign: TextAlign.center,
              'Your payment is successful! Please wait to schedule your appointment. ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w800,color: Colors.grey),),

              SizedBox(height: 20),

              // BUTTON
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: ()  {


                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ParentScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Back to home",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: ()  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceRatingForm()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Review",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
