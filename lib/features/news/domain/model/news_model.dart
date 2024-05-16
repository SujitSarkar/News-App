import 'dart:convert';
import 'package:uuid/uuid.dart';

enum DataSourceType { api, firebase }

const uuid = Uuid();

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json
    .decode(str)
    .map((x) => NewsModel.fromMap(x, dataSourceType: DataSourceType.api)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  final String? id;
  final String? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final int? publishedAt;
  final String? content;

  NewsModel({
    this.id,
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromMap(Map<String, dynamic> json,
      {required DataSourceType dataSourceType}) {
    return NewsModel(
      id: json['id'] ?? uuid.v4(),
      source: dataSourceType == DataSourceType.api
          ? json["source"]["name"]
          : json["source"],
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: dataSourceType == DataSourceType.api
          ? json["publishedAt"] == null
              ? null
              : DateTime.parse(json["publishedAt"]).millisecondsSinceEpoch
          : json["publishedAt"],
      content: json["content"],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "source": source,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };

  Map<String, dynamic> toJson() => {
        "id": id,
        "source": source,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };

  NewsModel copyWith({
    String? id,
    String? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    int? publishedAt,
    String? content,
  }) {
    return NewsModel(
      id: id ?? this.id,
      source: source ?? this.source,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }
}
