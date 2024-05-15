import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromMap(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  final String? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final int? publishedAt;
  final String? content;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsModel.fromMap(Map<String, dynamic> json) {
    return NewsModel(
      source: json["source"]["name"],
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: json["publishedAt"] == null
          ? null
          : DateTime.parse(json["publishedAt"]).millisecondsSinceEpoch,
      content: json["content"],
    );
  }

  Map<String, dynamic> toMap() => {
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
        "source": source,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt,
        "content": content,
      };
}
