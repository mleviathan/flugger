import 'package:isar/isar.dart';

part 'post.g.dart';

@collection
class Post {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? title;

  String? content;
}
