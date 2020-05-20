import 'package:mVerse/services/movie_watchlist_item.dart';
import 'package:mVerse/repository/watchlist_repository.dart';


import 'dart:async';

class WatchlistBloc {
  //Get instance of the Repository
  final _watchlistRepository = WatchlistRepository();

  //Stream controller is the 'Admin' that manages
  //the state of our stream of data like adding
  //new data, change the state of the stream
  //and broadcast it to observers/subscribers
  final _watchlistController = StreamController<List<MovieWatchlistItem>>.broadcast();

  get watchlists => _watchlistController.stream;

  WatchlistBloc() {
    getWatchlist();
  }

  //basically a trigger
  getWatchlist({String query}) async {
    //sink is a way of adding data reactively to the stream
    //by registering a new event
    _watchlistController.sink.add(await _watchlistRepository.getAllWatchlist(query: query));
  }

  addTodo(MovieWatchlistItem movieWatchlistItem) async {
    await _watchlistRepository.insertWatchlist(movieWatchlistItem);
    getWatchlist();
  }

  updateTodo(MovieWatchlistItem movieWatchlistItem) async {
    await _watchlistRepository.updateWatchlist(movieWatchlistItem);
    getWatchlist();
  }

  deleteTodoById(int id) async {
    _watchlistRepository.deleteWatchlistbyid(id);
    getWatchlist();
  }

  dispose() {
    _watchlistController.close();
  }
}
