import 'package:path_provider/path_provider.dart';
import 'package:shopping_cart_provider/model/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;


class dbHelper{
  static Database? _db;

  Future<Database?> get db async{
    if(_db != null){
      return _db!;
    }
    return _db = await _initDatabase();

  }

  _initDatabase() async{
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate, );
    return db;
  }

  _onCreate(Database db, int version)async{
    await db.execute('''
    CREATE TABLE cart(
    id INTEGER PRIMARY KEY ,
    productId VARCHAR UNIQUE ,
    productName TEXT,
    initialPrice INTEGER,
    productPrice INTEGER,
    productImage TEXT,
    productUnit TEXT,
    productQuantity INTEGER
    )
    ''');
  }

  // Future<ProductModel> insert(ProductModel product)async{
  //   print(product.toMap());
  //   var dbClient = await db ;
  //   await dbClient!.insert('cart', product.toMap());
  //   return product ;
  // }

  // Future<ProductModel> insert(ProductModel product) async {
  //   print(product.toMap());
  //   var dbClient = await db;
  //   if (dbClient == null) {
  //     // Handle the case where the database is not properly initialized
  //     print("Error: Database is not initialized");
  //     return Future.error("Database is not initialized");
  //   }
  //   await dbClient.insert('cart', product.toMap());
  //   return product;
  // }

  Future<ProductModel> insert(ProductModel product) async {
    print(product.toMap());
    var dbClient = await db;
    if (dbClient == null) {
      // Handle the case where the database is not properly initialized
      print("Error: Database is not initialized");
      return Future.error("Database is not initialized");
    }
    try {
      await dbClient.insert('cart', product.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      return product;
    } catch (e) {
      print("ERROR INSERTING PRODUCT: $e");
      return Future.error("ERROR INSERTING PRODUCT: $e");
    }
  }

  Future<List<ProductModel>> getDataOfCart()async{
    var dbClient = await db;
    final List<Map<String, Object?>> resultQuery = await dbClient!.query('cart');
    return resultQuery.map((e) => ProductModel.fromMap(e)).toList();
  }

}