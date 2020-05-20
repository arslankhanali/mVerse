import 'package:mVerse/services/movie_watchlist_item.dart';
import 'package:mVerse/data_access_object/watchlist_data_access_object.dart';

class WatchlistRepository {
  final watchListDao = WatchListDao();

  Future getAllWatchlist({String query}) => watchListDao.getWatchListItem(query: query);

  Future insertWatchlist(MovieWatchlistItem movieWatchlistItem) => watchListDao.createWatchListItem(movieWatchlistItem);

  Future updateWatchlist(MovieWatchlistItem movieWatchlistItem) => watchListDao.updateWatchListItem(movieWatchlistItem);

  Future deleteWatchlistbyid(int id) => watchListDao.deleteWatchListItem(id);

  //We are not going to use this in the demo
  Future deleteAllTodos() => watchListDao.deleteAllWatchListItem();
}
