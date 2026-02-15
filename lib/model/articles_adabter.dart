import 'package:hive/hive.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/sources_model.dart';

import 'news_model.dart';

class ArticlesAdapter extends TypeAdapter<Articles> {
  @override
  final int typeId = 3;

  @override
  Articles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };

    return Articles(
      source: fields[0] as soucresResponse?,
      author: fields[1] as String?,
      title: fields[2] as String?,
      description: fields[3] as String?,
      url: fields[4] as String?,
      urlToImage: fields[5] as String?,
      publishedAt: fields[6] as String?,
      content: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Articles obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content);
  }
}