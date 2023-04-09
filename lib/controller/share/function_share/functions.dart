// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:url_launcher/url_launcher.dart';

class functionsShare {
  static Future<void> launchInBrowser({
    int? launchTo,
    String? urlpath,
  }) async {
    final Uri privacyPolicy = Uri.parse('https://masmix.com/privacy-policy');
    final Uri termsConditions =
        Uri.parse('https://masmix.com/terms-conditions');
    final Uri FAQ = Uri.parse('https://masmix.com/faq');
    final Uri path = Uri.parse('$urlpath');
    Uri url;
    if (launchTo == 1) {
      url = privacyPolicy;
    } else if (launchTo == 2) {
      url = termsConditions;
    } else if (launchTo == 3) {
      url = FAQ;
    } else {
      url = path;
    }
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
