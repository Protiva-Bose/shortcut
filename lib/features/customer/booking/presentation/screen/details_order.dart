import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/widgets/appbar/simple_appbar.dart';
class DetailsOrder extends StatefulWidget {
  const DetailsOrder({super.key});

  @override
  State<DetailsOrder> createState() => _DetailsOrderState();
}

class _DetailsOrderState extends State<DetailsOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: "Detail Order",
        backgroundColor: Colors.transparent,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Wed, 27 Nov 2024',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14.sp),),
            Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.2
                ),
                borderRadius: BorderRadius.circular(16.r)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.cover,
                        ),
                      ),

                    SizedBox(width: 10.w,),
                    Column(spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Aaron Schmeler',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15.sp),),
                        RichText(
                          text: TextSpan(
                            text: 'Hair Styling',
                            style: TextStyle(fontWeight: FontWeight.w700,fontSize: 13.sp,color: Colors.black),
                            children: [
                              TextSpan(
                                text: " - The Gentleman's\nCut",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.orange.shade400,),
                            Text('4.0  6 Year Experients', style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),)
                          ],
                        )
                      ],
                    )
                  ],
                )



              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.2
                  ),
                  borderRadius: BorderRadius.circular(16.r)
              ),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(width: 10.w,),
                      Column(spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Your Service', style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          ),

                          Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 5.w,),
                              Text('Services', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('Heat Specialist', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 5.w,),
                              Text('Worker', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('Darrin Schowalter', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 5.w,),
                              Text('Dates', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('Thu, 2o May 2024', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),

                          SizedBox(height: 10.h,),
                          SizedBox(
                            height: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                30,
                                    (index) => Container(
                                  width: 6,
                                  height: 2,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Text('Price Details', style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          Row(
                            children: [
                              Text('Services', style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('\$22.00', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Apps fee', style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('\$22.00', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),
                          Row(
                            children: [
                              Text('Taxes fee', style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('\$22.00', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),
                          Divider(),
                          Row(
                            children: [
                              Text('Total price', style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                              Spacer(),
                              Text('\$22.00', style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )

              ),
            ),

            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1.2
                  ),
                  borderRadius: BorderRadius.circular(16.r)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Payment Method', style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),),
                      Row(spacing: 10,
                        children: [
                          Image.asset('assets/images/bca.png',scale: 4,),
                          Text('Bank Central Asia', style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),),
                        ],
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
