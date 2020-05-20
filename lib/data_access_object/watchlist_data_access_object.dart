import 'dart:async';
import 'package:mVerse/database/database.dart';
import 'package:mVerse/services/movie_watchlist_item.dart';


class WatchListDao {
  final dbProvider = DatabaseProvider.dbProvider;

  //Adds new Todo records
  Future<int> createWatchListItem(MovieWatchlistItem movieWatchlistItem) async {
    final db = await dbProvider.database;
    var result = db.insert(watchList, movieWatchlistItem.toDatabaseJson());
    return result;
  }

  //Get All Todo items
  //Searches if query string was passed
  // if quesry string was passed then get it otherwise get all todos
  Future<List<MovieWatchlistItem>> getWatchListItem({List<String> columns, String query}) async {
    final db = await dbProvider.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(watchList,
            columns: columns,
            where: 'description LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(watchList, columns: columns);
    }

    List<MovieWatchlistItem> todos = result.isNotEmpty
        ? result.map((item) => MovieWatchlistItem.fromDatabaseJson(item)).toList()
        : [];
    return todos;
  }

  //Update Todo record
  Future<int> updateWatchListItem(MovieWatchlistItem todo) async {
    final db = await dbProvider.database;

    var result = await db.update(watchList, todo.toDatabaseJson(),
        where: "id = ?", whereArgs: [todo.id]);

    return result;
  }

  //Delete Todo records
  Future<int> deleteWatchListItem(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(watchList, where: 'id = ?', whereArgs: [id]);

    return result;
  }

  //We are not going to use this in the demo
  Future deleteAllWatchListItem() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      watchList,
    );

    return result;
  }
}
