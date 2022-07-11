import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        receipt TEXT,
        alamat VARCHAR,
        namaSVG VARCHAR,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'paketKU.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // cek item
  // static Future<bool> cekItem(String receipt, String jkirim) async {
  //   final db = await SQLHelper.db();
  //   bool hasilCek;
  //   final hasil =
  //       await db.rawQuery('SELECT COUNT(*) from items WHERE receipt=$receipt');
  //   if (hasil.isNotEmpty) {
  //     print(hasil);
  //     hasilCek = true;
  //   } else {
  //     print(hasil);
  //     hasilCek = false;
  //   }
  //   return hasilCek;
  // }

  // Create new item (journal)
  static Future<int> createItem(
    String receipt,
    String namaSVG,
    String alamat,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'receipt': receipt,
      'alamat': alamat,
      'namaSVG': namaSVG,
    };
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  // static Future<List<Map<String, dynamic>>> getItem(String receipt) async {
  //   final db = await SQLHelper.db();
  //   return db.query('items',
  //       where: "receipt = ?", whereArgs: [receipt], limit: 1);
  // }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  static Future<int> deleteAll() async {
    final db = await SQLHelper.db();
    return db.rawDelete("Delete from items");
  }
}
