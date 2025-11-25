import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theshortkutbran/core/constant/route_names.dart';

class BookingCalendarScreen extends StatefulWidget {
  @override
  _BookingCalendarScreenState createState() => _BookingCalendarScreenState();
}

class _BookingCalendarScreenState extends State<BookingCalendarScreen> {
  DateTime _displayedMonth = DateTime.now();       // current visible month
  DateTime? _selectedDate;                         // selected date
  String _selectedTime = '09:00 AM';

  final List<Map<String, dynamic>> _timeSlots = [
    {'time': '09:00 AM', 'available': true},
    {'time': '09:00 AM', 'available': true},
    {'time': '11:00 AM', 'available': false},
    {'time': '11:00 AM', 'available': true},
    {'time': '12:00 PM', 'available': true},
    {'time': '1:00 PM',  'available': false},
  ];

  void _prevMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
    });
  }

  // ------------------ DATE SELECTION ------------------ //
  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  // ------------------ TIME SELECTION ------------------ //
  void _selectTime(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  // ------------------ TIME SLOT BUILDER ------------------ //
  Widget _buildTimeSlot(String time, bool isAvailable, bool isSelected) {
    return GestureDetector(
      onTap: isAvailable ? () => _selectTime(time) : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.black
              : isAvailable
              ? Colors.white
              : const Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(10),
          border: isAvailable && !isSelected
              ? Border.all(color: Colors.black12)
              : null,
        ),
        child: Center(
          child: Text(
            time,
            style: TextStyle(
              color: isSelected
                  ? Colors.white
                  : isAvailable
                  ? Colors.black
                  : Colors.black38,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // ------------------ CALENDAR GRID ------------------ //
  Widget _buildCalendarGrid() {
    final int year = _displayedMonth.year;
    final int month = _displayedMonth.month;

    final firstDayOfMonth = DateTime(year, month, 1);
    final totalDaysInMonth = DateTime(year, month + 1, 0).day;

    final startWeekday = firstDayOfMonth.weekday % 7; // Sunday as 0
    final totalCalendarCells = startWeekday + totalDaysInMonth;

    return Column(
      children: [
        // Day labels
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                .map((day) => Text(day, style: const TextStyle(color: Colors.grey)))
                .toList(),
          ),
        ),
        const SizedBox(height: 10),

        // Calendar grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: totalCalendarCells,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              if (index < startWeekday) {
                return const Center(child: Text(""));
              }

              int day = index - startWeekday + 1;
              DateTime dateObj = DateTime(year, month, day);
              bool isSelected = _selectedDate != null &&
                  dateObj.year == _selectedDate!.year &&
                  dateObj.month == _selectedDate!.month &&
                  dateObj.day == _selectedDate!.day;

              return GestureDetector(
                onTap: () => _selectDate(dateObj),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? Colors.black : Colors.transparent,
                  ),
                  child: Text(
                    "$day",
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ------------------ SUMMARY BAR ------------------ //
  Widget _buildSummaryBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Date + Time summary
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.calendar_month, size: 18),
                            SizedBox(width: 8),
                            Text("Date", style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _selectedDate != null
                              ? DateFormat('MMM dd').format(_selectedDate!)
                              : "Not selected",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),

                  Container(width: 1, height: 40, color: Colors.black12),

                  // Time
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.access_time, size: 18),
                            SizedBox(width: 8),
                            Text("Time", style: TextStyle(color: Colors.black54)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _selectedTime,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedDate == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a date")),
                    );
                    return;
                  }
Navigator.pushNamed(context, RouteNames.serviceProviderDetailMapScreen);
                  // Next step navigation here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ------------------ MAIN UI ------------------ //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60, bottom: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ---------- MONTH HEADER ---------- //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMM, yyyy').format(_displayedMonth),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: _prevMonth,
                            child: const Icon(Icons.arrow_back_ios, size: 20),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: _nextMonth,
                            child: const Icon(Icons.arrow_forward_ios, size: 20),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                _buildCalendarGrid(),      // functional calendar
                const SizedBox(height: 20),

                // ---------- TIME TITLE ---------- //
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Time",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 20),

                // ---------- TIME GRID ---------- //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 2.6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _timeSlots.map((slot) {
                      return _buildTimeSlot(
                        slot['time'],
                        slot['available'],
                        _selectedTime == slot['time'],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),

          _buildSummaryBar(),
        ],
      ),
    );
  }
}


