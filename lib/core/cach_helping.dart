import 'package:hive/hive.dart';
import '../model/news_model.dart';
import '../model/sources_model.dart';

class CacheHelper {
  static const String _boxName = "SourcesBox1";
  static const String _newsBoxName = "NewsBox1";

  static Future<Box<newsResponse>> _openNewsBox() async {
    // امسح البوكس القديم لو موجود
    if (await Hive.boxExists(_newsBoxName)) {
      await Hive.deleteBoxFromDisk(_newsBoxName);
    }

    if (!Hive.isBoxOpen(_newsBoxName)) {
      return await Hive.openBox<newsResponse>(_newsBoxName);
    }

    return Hive.box<newsResponse>(_newsBoxName);
  }

  static Future<void> saveNewsResponse(
      newsResponse newsResponse,
      String sourceId,
      ) async {
    var box = await _openNewsBox();
    return box.put("newsResponse-$sourceId", newsResponse);
  }

  static Future<newsResponse?> getNewsResponse(String sourceId) async {
    var box = await _openNewsBox();
    return box.get("newsResponse-$sourceId");
  }

  static Future<void> deleteNewsResponse() async {
    var box = await _openNewsBox();
    return box.delete("sources");
  }

  static Future<Box<soucresResponse>> _openSourceBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<soucresResponse>(_boxName);
    }

    return Hive.box<soucresResponse>(_boxName);
  }

  static Future<void> saveSourceResponse(
      soucresResponse sourcesResponse,
      String catId
      ) async {
    var box = await _openSourceBox();
    return box.put("sources-$catId", sourcesResponse);
  }

  static Future<soucresResponse?> getSourceResponse( String catId) async {
    var box = await _openSourceBox();
    return box.get("sources-$catId");
  }

  static Future<void> deleteSourceResponse() async {
    var box = await _openSourceBox();
    return box.delete("sources");
  }
}
