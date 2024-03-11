import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initPushNotification() async {
    await requestNotificationPermissions();
    FirebaseMessaging.onMessage.listen((event) {
      print(event.messageType);
      print(event.messageId);
      print(event.senderId);
      print(event.notification!.title);
      print(event.notification!.body);
      print(event.data);
    });
  }

  Future<void> requestNotificationPermissions() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Permission granted');
    } else {
      print('Permission denied');
    }
  }

  Future<void> subscribeToTopic({required String topicName}) async {
    await _firebaseMessaging.subscribeToTopic(topicName);
  }

  Future<void> unSubscribeToTopic({required String topicName}) async {
    await _firebaseMessaging.subscribeToTopic(topicName);
  }
}
