// To parse this JSON data, do
//
//     final notification = notificationFromMap(jsonString);

import 'dart:convert';

NotificationModel notificationDataFromMap(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationDataToMap(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;

  NotificationModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    return data;
  }
}

class Data {
  int? id;
  String? message;
  String? link;
  int? userId;
  int? read;
  String? createdBy;
  String? createdAt;
  String? realLink;

  Data(
      {this.id,
      this.message,
      this.link,
      this.userId,
      this.read,
      this.createdBy,
      this.createdAt,
      this.realLink});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    link = json['link'];
    userId = json['user_id'];
    read = json['read'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    realLink = json['real_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['link'] = this.link;
    data['user_id'] = this.userId;
    data['read'] = this.read;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['real_link'] = this.realLink;
    return data;
  }
}
