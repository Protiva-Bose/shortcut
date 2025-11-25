import 'package:flutter/material.dart';

class SearchFieldWithIcons extends StatefulWidget {
  @override
  _SearchFieldWithIconsState createState() => _SearchFieldWithIconsState();
}

class _SearchFieldWithIconsState extends State<SearchFieldWithIcons> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          fillColor: Color(0xff151828),
          filled: true, // Fill the background
          hintText: 'Search...', // Hint text
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ), // Prefix icon (search icon)
          // suffixIcon: _controller.text.isEmpty
          //     ? null // No suffix icon if the field is empty
          //     : IconButton(
          //   icon: Icon(Icons.clear, color: Colors.grey), // Suffix icon (clear icon)
          //   onPressed: () {
          //     _controller.clear(); // Clear the text when the icon is pressed
          //   },
          // ),
          suffixIcon: Icon(Icons.settings, color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
            borderSide: BorderSide.none, // No border line
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ), // Padding inside the field
        ),
        onChanged: (value) {
          setState(
            () {},
          ); // Refresh the UI to show the clear icon when the text changes
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: SearchFieldWithIcons()));
}
