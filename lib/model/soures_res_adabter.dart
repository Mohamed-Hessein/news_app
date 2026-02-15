import 'package:hive/hive.dart';
import 'package:news_c_17_mohamed_mohamed_hussin_01552901158_7_to_10_mon_wed/model/sources_model.dart';

class SourcesResponseAdapter extends TypeAdapter<soucresResponse> {
  @override
  final int typeId = 0;

  @override
  soucresResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };
    return soucresResponse(
      status: fields[0] as String?,
      sources: (fields[1] as List?)?.cast<Sources>(),
    );
  }

  @override
  void write(BinaryWriter writer, soucresResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.sources);
  }
}