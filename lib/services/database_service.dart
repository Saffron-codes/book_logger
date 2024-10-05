import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;

  static Database? _database;

  DatabaseService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'book_logger.db');
    return await openDatabase(
      path,
      version: 1, // Keep the version as 1
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS Collections (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        books_count INTEGER,
        createdAt TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Book (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT,
        name TEXT,
        summary TEXT,
        review TEXT,
        collection_id INTEGER,
        FOREIGN KEY (collection_id) REFERENCES Collections(id) ON DELETE CASCADE
      )
    ''');
  }

  Future<void> insertCollection(Map<String, dynamic> collection) async {
    final db = await database;
    await db.insert('Collections', collection);
  }

  Future<void> insertBook(Map<String, dynamic> book) async {
    final db = await database;
    await db.insert('Book', book);
  }

  Future<List<Map<String, dynamic>>> getCollections() async {
    final db = await database;
    return await db.query('Collections');
  }

  Future<List<Map<String, dynamic>>> getBooksByCollection(
      int collectionId) async {
    final db = await database;
    return await db.query(
      'Book',
      where: 'collection_id = ?',
      whereArgs: [collectionId],
    );
  }

  Future<int> getCollectionCount() async {
    final db = await database;
    var result = await db.rawQuery('SELECT COUNT(*) FROM Collections');
    int count = Sqflite.firstIntValue(result) ?? 0;
    return count + 1;
  }
}
