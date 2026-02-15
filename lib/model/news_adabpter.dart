import 'package:hive/hive.dart';

import 'news_model.dart';

class NewsResponseAdapter extends TypeAdapter<newsResponse> {
  @override
  final int typeId = 2;

  @override
  newsResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };

    return newsResponse(
      status: fields[0] as String?,

      totalResults: fields[3] as int?,
      articles: (fields[4] as List?)?.cast<Articles>(),
    );
  }

  @override
  void write(BinaryWriter writer, newsResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.totalResults)
      ..writeByte(3)
      ..write(obj.articles);
  }
}