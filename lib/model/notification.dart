class ReceivedNotification {
  ReceivedNotification({
    this.id,
    required this.title,
    required this.body,
    this.payload,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? payload;
}
