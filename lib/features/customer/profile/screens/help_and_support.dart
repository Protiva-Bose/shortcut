import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theshortkutbran/app/widgets/appbar/simple_appbar.dart';

class QAItem {
  final String question;
  final String answer;
  QAItem(this.question, this.answer);
}

class FAQSectionData {
  final String title;
  final List<QAItem> items;
  FAQSectionData(this.title, this.items);
}

class HelpAndSupport extends StatelessWidget {
  HelpAndSupport({super.key});

  final List<FAQSectionData> faqData = [
    FAQSectionData('Help and Support', [
      QAItem(
        'What is the purpose of this app?',
        'The purpose of this app is to connect customers with licensed barbers for on-demand services, making it easy to schedule appointments at their desired location.',
      ),
      QAItem(
        'How do I download and install the app?',
        'You can download the app from the Apple App Store (for iOS devices) and Google Play Store (for Android devices).',
      ),
      QAItem(
        'What are the system requirements for the app?',
        'The app requires a smartphone or tablet with a minimum operating system of [Dream OS version].',
      ),
    ]),

    FAQSectionData('Account and Login', [
      QAItem(
        'How do I create an account?',
        'To create an account, simply download and open the app. You will be guided by the prompts to enter your information.',
      ),
      QAItem(
        'How do I reset my password?',
        'To reset your password, tap "Forgot Password" on the login screen, enter your registered email address and follow the prompts to create a new password.',
      ),
      QAItem(
        'How do I update my account information?',
        'Navigate to the "My Profile" section within the app. Select "Edit Information" and follow the prompts to edit your information.',
      ),
    ]),

    FAQSectionData('Booking and Scheduling', [
      QAItem(
        'How do I book an appointment?',
        'You can book an appointment in the app. There are two ways: by searching for an available slot or by selecting a barber, service, and time slot.',
      ),
      QAItem(
        'How do I cancel or reschedule my appointment?',
        'Yes, you can cancel or reschedule your appointment any time prior to the scheduled time.',
      ),
      QAItem(
        'How do I know if my appointment is confirmed?',
        'Once you’ve booked an appointment, you’ll receive a confirmation email and see all the details of your appointment.',
      ),
    ]),

    FAQSectionData('Payment and Pricing', [
      QAItem(
        'What forms of payment do you accept?',
        'We accept all major credit cards.',
      ),
      QAItem(
        'How is pricing determined?',
        'Prices vary depending on the service and barber selected.',
      ),
      QAItem(
        'Do you offer any discounts or promotions?',
        'Yes, we occasionally offer discounts and promotions.',
      ),
    ]),

    FAQSectionData('Technical Issues', [
      QAItem(
        'The app is not loading. What should I do?',
        'Try force-closing the app and restarting your device.',
      ),
      QAItem(
        'I’m having trouble booking an appointment with my favorite barber.',
        'Try checking your internet connection or restarting the app.',
      ),
      QAItem(
        'How do I report a bug or technical issue?',
        'You can report a bug through the app or email support@example.com.',
      ),
    ]),

    FAQSectionData('Safety and Security', [
      QAItem(
        'Is my personal and payment information secure?',
        'Absolutely! The app uses industry-standard encryption.',
      ),
      QAItem(
        'What if I have a complaint or concern about a barber?',
        'Contact our support team through the app or email support@example.com.',
      ),
    ]),

    FAQSectionData('Miscellaneous', [
      QAItem(
        'How do I provide feedback or suggestions?',
        'Please contact our support team through the app or by emailing [theshortkutbrand42@gmail.com]. We value your feedback and suggestions!',
      ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomServiceAppBar(
        title: 'Help and Support',
        backgroundColor: Colors.transparent,
        titleColor: Colors.black,
        iconColor: Colors.black,
        leadingContainerColor: Colors.black26,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ...faqData
                    .map((section) => _buildFAQSection(context, section))
                    .toList(),

                SizedBox(height: 10.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFAQSection(BuildContext context, FAQSectionData section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: Colors.white10, height: 30),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: Text(
            section.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...section.items.map((qa) => _buildFAQItem(context, qa)).toList(),
      ],
    );
  }

  Widget _buildFAQItem(BuildContext context, QAItem item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ExpansionTile(
        key: PageStorageKey(item.question),
        tilePadding: EdgeInsets.zero,
        iconColor: Colors.black,
        collapsedIconColor: Colors.black,
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        title: Text(
          item.question,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 0, bottom: 8.0),
            child: Text(
              item.answer,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
