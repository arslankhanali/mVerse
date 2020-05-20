class movie_watchlist {
  int id;
  //description is the text we see on
  //main screen card text
  String name;
  //isDone used to mark what Todo item is completed
  String url;
  movie_watchlist({this.id,this.name,this.url})
  //When using curly braces { } we note dart that
  //the parameters are optional

  factory movie_watchlist.fromDatabaseJson(Map<String, dynamic> data) =>  movie_watchlist(
    //Factory method will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a Todo object

        id: data['id'],
        name: data['name'],

        //Since sqlite doesn't have boolean type for true/false,
        //we will use 0 to denote that it is false
        //and 1 for true
        url: data['url'],
      );

  Map<String, dynamic> toDatabaseJson() => {
    //A method will be used to convert Todo objects that
    //are to be stored into the datbase in a form of JSON

        "id": this.id,
        "name": this.name,
        "url": this.url,
      };
}
