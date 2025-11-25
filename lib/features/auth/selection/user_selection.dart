import 'package:flutter/material.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSelection extends StatefulWidget {
  const UserSelection({super.key});

  @override
  State<UserSelection> createState() => _UserSelectionState();
}

class _UserSelectionState extends State<UserSelection> {
  String selectedRole = "Customer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text(
                textAlign: TextAlign.center,
                "Welcome to ShortKut\nTo get started, please select your role",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "I am a",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = "Customer";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selectedRole == "Customer"
                          ? Colors.grey.shade300
                          : Colors.grey.shade300,
                    ),
                    color: selectedRole == "Customer"
                        ? Colors.grey.shade200
                        : Colors.grey.shade100,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        value: "Customer",
                        groupValue: selectedRole,
                        onChanged: (val) {
                          setState(() {
                            selectedRole = val!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "Customer\n(looking for a barber/stylist)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedRole = "Barber/Stylis";
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selectedRole == "Barber/Stylis"
                          ? Colors.grey.shade300
                          : Colors.grey.shade300,
                    ),
                    color: selectedRole == "Barber/Stylis"
                        ? Colors.grey.shade200
                        : Colors.grey.shade100,
                  ),
                  child: Row(
                    children: [
                      Radio(
                        value: "Barber/Stylis",
                        groupValue: selectedRole,
                        onChanged: (val) {
                          setState(() {
                            selectedRole = val!;
                          });
                        },
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          "Barber/Stylist\n(offer services to clients)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "Choosing the Right Role:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
               SizedBox(height: 100.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.check, size: 20, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "If you're a barber or stylist, select “Barber/Stylist” to create a profile, showcase your services, and connect with clients.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.check, size: 20, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "If you're a customer, select “Customer” to find and book appointments with local barbers and stylists.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.serviceSelection);
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
