import 'package:flutter/material.dart';

import 'method_select.dart';

class CouponPopup extends StatefulWidget {
  @override
  _CouponPopupState createState() => _CouponPopupState();
}

class _CouponPopupState extends State<CouponPopup> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Coupon",
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
                title: "50% Cashback",
                expiry: "Expired in 2 days",
              ),
              _couponTile(
                index: 1,
                title: "15% Discount",
                expiry: "Expired in 1 day",
              ),
              _couponTile(
                index: 2,
                title: "10% Cashback",
                expiry: "Expired in 7 days",
              ),

              SizedBox(height: 20),

              // BUTTON
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedCoupon = await showDialog(
                      context: context,
                      builder: (context) => CouponPopupSelect(),
                    );

                    print("User selected coupon index: $selectedCoupon");

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => RequestStatusScreen()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Use Coupon",
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
