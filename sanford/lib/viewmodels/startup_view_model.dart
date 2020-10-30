import 'package:sanford/locator.dart';
import 'package:sanford/services/push_notification_service.dart';

class StartUpViewModel {
  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    // Register for push notifications
    await _pushNotificationService.initialise();
  }
}
