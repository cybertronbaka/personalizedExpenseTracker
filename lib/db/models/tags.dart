import 'package:Churpu/enums/tag_categories.dart';
import 'package:Churpu/utils/churpu_db.dart';
import 'package:sqflite/sqflite.dart';

final String tableTags = 'tags';

class TagFields{
  static final String id = '_id';
  static final String name = 'name';
  static final String tagType = 'tag_type';

  static final List<String> values = [
    id, name, tagType
  ];
}

class Tag{
  final int? id;
  final String name;
  final TagCategories tagType;

  const Tag({
    this.id,
    required this.name,
    required this.tagType
  });

  Tag copy({
    int? id,
    String? name,
    TagCategories? tagType
  }) => Tag(
    id: id ?? this.id,
    name: name?? this.name,
    tagType: tagType ?? this.tagType
  );

  Map<String, Object?> toJson() => {
    TagFields.id: id,
    TagFields.name: name,
    TagFields.tagType: tagType.toShortString()
  };

  static Tag fromJson(Map<String, Object?> json) => Tag(
    id: json[TagFields.id] as int?,
    name: json[TagFields.name] as String,
    tagType: strEqualsToTagCategory((json[TagFields.tagType]) as String)
  );

  // DB Operations

  static Future<Tag> create(Tag tag) async {
    final Database db = await ChurpuDb.instance.database as Database;

    final id = await db.insert(tableTags, tag.toJson());

    return tag.copy(id: id);
  }

  static Future<Tag?> read(int id) async {
    final Database db = await ChurpuDb.instance.database as Database;

    final maps = await db.query(
      tableTags,
      columns: TagFields.values,
      where: '${TagFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) return Tag.fromJson(maps.first);
  }

  static Future<List<Tag>?> readTags(TagCategories tagType) async{
    final Database db = await ChurpuDb.instance.database as Database;

    final maps = await db.query(
      tableTags,
      columns: TagFields.values,
      where: '${TagFields.tagType} = ?',
      whereArgs: [tagType.toShortString()],
    );
    return maps.map((json) => Tag.fromJson(json)).toList();
  }

  static Future<int> delete(int id) async {
    final Database db = await ChurpuDb.instance.database as Database;

    return await db.delete(
      tableTags,
      where: '${TagFields.id} = ?',
      whereArgs: [id],
    );
  }
}