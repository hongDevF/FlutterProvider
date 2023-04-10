import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> creatTable(sql.Database database) async {
    database.execute(
        """CREATE TABLE notes (id INTEGER PRIMARY KEY NOT NULL,title TEXT, description TEXT, createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'senghong.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await creatTable(database);
        // log('...create a table');
      },
    );
  }

  // Create Item
  static Future<int> createItem(String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString(),
    };
    final id = await db.insert('notes', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }

  // get Items
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlHelper.db();
    return db.query('notes', orderBy: 'id');
  }

  // get Item
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SqlHelper.db();
    return db.query('notes', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // update item
  static Future<int> updateItem(
      int id, String title, String? description) async {
    final db = await SqlHelper.db();
    final data = {
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString(),
    };

    final result =
        await db.update('notes', data, where: "id = ? ", whereArgs: [id]);
    return result;
  }

  // delete Item
  static Future<void> deleteItem(int id) async {
    final db = await SqlHelper.db();
    try {
      await db.delete('notes', where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint('Something went wrong when deleting an item: $err');
    }
  }
}
