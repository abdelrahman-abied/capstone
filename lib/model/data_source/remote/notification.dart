import 'package:capstone/model/model/user_notification.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/constants.dart';
import '../../../core/utils/cache_helper.dart';
import '../../../core/utils/log.dart';

Future<List<Data>?> loadNotificationData(String token, int page) async {
  try {
    Log.w(page.toString());
    // http://notifications.emmobank.com/api/listNotification
    final http.Response response = await http.get(
        Uri.parse(
            "http://notifications.emmobank.com/api/listNotification?page=$page"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    // print(response.body.toString());

    Log.w(response.statusCode.toString());
    Log.w(response.body.toString());
    if (response.statusCode == 200) {
      // Log.w(response.body.toString());
      return notificationDataFromMap(response.body).data;
    } else {
      return [];
    }
  } catch (e) {
    Log.e(e.toString());
    return [];
  }
}
