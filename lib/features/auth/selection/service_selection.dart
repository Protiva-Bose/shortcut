import 'package:flutter/material.dart';
import 'package:theshortkutbran/app/widgets/appbar/simple_appbar.dart';
import 'package:theshortkutbran/features/parent/presentation/parent_screen.dart';

class ServiceSelection extends StatefulWidget {
  const ServiceSelection({super.key});

  @override
  State<ServiceSelection> createState() => _ServiceSelectionState();
}

class _ServiceSelectionState extends State<ServiceSelection> {
  Map<String, bool> services = {
    'All': false,
    'Haircuts': false,
    'Beard Trims': false,
    'Shaves': false,
    'Art Designs': false,
    'Razor Lines': false,
    'Hair Enhancement': false,
    'Eyebrow Shaping/Arching': false,
  };

  Map<String, bool> hairTextures = {
    'Straight': false,
    'Wavy': false,
    'Curly': false,
    'Course': false,
  };

  void _toggleAllServices(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      services['All'] = newValue;
      services.keys.where((key) => key != 'All').forEach((key) {
        services[key] = newValue;
      });
    });
  }

  void _toggleService(String key, bool? newValue) {
    if (newValue == null) return;
    setState(() {
      services[key] = newValue;

      if (key != 'All') {
        final allSelected = services.keys
            .where((k) => k != 'All')
            .every((k) => services[k] == true);
        services['All'] = allSelected;
      }
    });
  }

  Widget _buildServiceCheckbox(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        value: services[title],
        onChanged: (title == 'All')
            ? _toggleAllServices
            : (newValue) => _toggleService(title, newValue),
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildTextureCheckbox(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 17.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        value: hairTextures[title],
        onChanged: (newValue) {
          setState(() {
            hairTextures[title] = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomServiceAppBar(
        title: '',
        backgroundColor: Colors.transparent,
        titleColor: Colors.transparent,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black12,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 30.0,
              right: 30.0,
              bottom: 120.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const Center(
                  child: Text(
                    'Customize Your\nBarber Experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                Center(
                  child: Text(
                    'To help us match you with the perfect barber,\nplease select the services you\'re interested in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),

                Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                ...services.keys.map(_buildServiceCheckbox).toList(),
                const SizedBox(height: 40.0),

                Text(
                  'Hair Texture',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10.0),
                ...hairTextures.keys.map(_buildTextureCheckbox).toList(),
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 20.0,
                bottom: 40.0,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ParentScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
