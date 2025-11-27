import 'package:flutter/material.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';

class CouponPopupSelect extends StatefulWidget {
  @override
  _CouponPopupSelectState createState() => _CouponPopupSelectState();
}

class _CouponPopupSelectState extends State<CouponPopupSelect> {
  int _selectedCoupon = 0;

  Widget _couponTile({
    required int index,
    required String title,
    required String expiry,
    required String image,
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
          Image.asset(image,scale: 3,),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, size: 26),
                  )
                ],
              ),
              SizedBox(height: 20),

              // COUPON LIST
              _couponTile(
                index: 0,
                title: "Klarna",
                expiry: "Expired in 2 days", image: 'assets/icons/kar_payment.png',
              ),
              _couponTile(
                index: 1,
                title: "Afterpay",
                expiry: "Expired in 1 day", image: 'assets/icons/after_pay.png',
              ),
              _couponTile(
                index: 2,
                title: "Add Debit Card",
                expiry: "Expired in 7 days", image: 'assets/icons/add_payment.png',
              ),

              SizedBox(height: 20),

              // BUTTON
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.paymentScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
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
