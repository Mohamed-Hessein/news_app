import 'package:hive/hive.dart';


@HiveType(typeId: 0)
class soures extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  int? totalResults;

  @HiveField(2)
  List<Articless>? articles;

  soures({this.status, this.totalResults, this.articles});

  soures.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articless>[];
      json['articles'].forEach((v) {
        articles!.add(Articless.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 5)
class Articless extends HiveObject {
  @HiveField(0)
  soucresResponse? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Articless(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articless.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? soucresResponse.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.source != null) data['source'] = this.source!.toJson();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

@HiveType(typeId: 6)
class soucresResponse extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  List<Sources>? sources;

  soucresResponse({this.status, this.sources});

  soucresResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = <Sources>[];
      json['sources'].forEach((v) {
        sources!.add(Sources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    if (sources != null) data['sources'] = sources!.map((v) => v.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 7)
class Sources extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? url;

  @HiveField(4)
  String? category;

  @HiveField(5)
  String? language;

  @HiveField(6)
  String? country;

  Sources(
      {this.id,
        this.name,
        this.description,
        this.url,
        this.category,
        this.language,
        this.country});

  Sources.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['url'] = this.url;
    data['category'] = this.category;
    data['language'] = this.language;
    data['country'] = this.country;
    return data;
  }
}

@HiveType(typeId: 8)
class sourses extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  int? totalResults;

  @HiveField(2)
  List<Articless>? articles;

  sourses({this.status, this.totalResults, this.articles});

  sourses.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articless>[];
      json['articles'].forEach((v) {
        articles!.add(Articless.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (articles != null) data['articles'] = articles!.map((v) => v.toJson()).toList();
    return data;
  }
}

@HiveType(typeId: 9)
class Artcles extends HiveObject {
  @HiveField(0)
  soucresResponse? source;

  @HiveField(1)
  String? author;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? description;

  @HiveField(4)
  String? url;

  @HiveField(5)
  String? urlToImage;

  @HiveField(6)
  String? publishedAt;

  @HiveField(7)
  String? content;

  Artcles(
      {this.source,
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Artcles.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? soucresResponse.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (source != null) data['source'] = source!.toJson();
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

@HiveType(typeId: 10)
class Sourcess extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  Sourcess({this.id, this.name});

  Sourcess.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
