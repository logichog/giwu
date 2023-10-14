// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';

// class DBHelper {
//   static Database _database;
//   static const String TABLE_CUSTOMER = "Customer";
//   static const String TABLE_PRODUCT = "Product";

//   Future<Database> get db async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await initDatabase();
//     return _database;
//   }

//   initDatabase() async {
//     io.Directory docdir = await getApplicationDocumentsDirectory();
//     String path = join(docdir.path, 'app.db');
//     print('=====Database path==== ' + path);
//     var db = await openDatabase(path, version: 1, onCreate: _onCreate);
//     return db;
//   }

//   Future _onCreate(Database db, int version) async {
//     await db.execute('CREATE TABLE $TABLE_CUSTOMER '
//         '(id INTEGER PRIMARY KEY '
//         'AUTOINCREMENT,'
//         ' name TEXT,'
//         ' email TEXT,'
//         ' phone TEXT,'
//         ' city TEXT'
//         ')');

//     await db.execute('CREATE TABLE $TABLE_PRODUCT '
//         '(id INTEGER PRIMARY KEY,'
//         ' name TEXT'
//         ')');
//   }

 
//   Future<Customer> addCustomer(Customer customer)
//   async {
//     var dbClient = await db;
//     customer.id = await dbClient.insert(TABLE_CUSTOMER, customer.toJson());
//     print('customer ' + customer.name);
//     return customer;
//   }

//   Future close() async {
//     var dbClient = await db;
//     dbClient.close();
//   }
// }