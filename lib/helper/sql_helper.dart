import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        receipt TEXT,
        alamat VARCHAR,
        namaSVG VARCHAR,
        jk VARCHAR,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        unique(receipt,alamat,namaSVG,jk)
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'paketKU.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> createItem(
    String receipt,
    String namaSVG,
    String alamat,
    String jk,
  ) async {
    final db = await SQLHelper.db();

    final data = {
      'receipt': receipt,
      'alamat': alamat,
      'namaSVG': namaSVG,
      'jk': jk,
    };
    // final id = await db.insert('items', data,
    //     conflictAlgorithm: sql.ConflictAlgorithm.replace);
    final id = await db.transaction<int>((txn) async {
      final existingData = await txn.rawQuery(
        'SELECT * FROM items WHERE receipt = ?',
        [data['receipt']],
      );

      if (existingData.isNotEmpty) {
        return -1; // Jika data dengan receipt yang sama sudah ada, kembalikan nilai -1
      }

      final rawQuery = '''
    INSERT INTO items(receipt, alamat, namaSVG, jk)
    VALUES(?, ?, ?, ?)
  ''';
      final values = [
        data['receipt'],
        data['alamat'],
        data['namaSVG'],
        data['jk'],
      ];
      return await txn.rawInsert(rawQuery, values);
    });

    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

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
