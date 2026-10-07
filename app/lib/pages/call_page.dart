import 'package:url_launcher/url_launcher.dart';

void makePhoneCall() async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: '08036798700', // your TruckView number
  );

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  }
}
