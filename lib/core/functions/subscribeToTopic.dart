import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

Future<void> subscribeToTopic(String topic) async {
  if (kIsWeb) {
    // Handle web subscriptions (e.g., store topic in Firestore)
  } else {
    // Call Firebase Cloud Messaging's subscribeToTopic for mobile platforms
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }
}
