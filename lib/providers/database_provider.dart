import 'package:flugger/models/blog/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final databaseProvider = StateProvider<Database>((ref) {
  return Database();
});

class Database {
  Isar? isar;

  Future init() async {
    isar = await Isar.open(
      [PostSchema],
      directory: '.',
    );
  }
}
