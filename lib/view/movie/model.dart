class MovieData
{
 late final  int page,totalPages,totalResults;
  late final List<MovieModel>list;
  MovieData.fromMap(Map<String,dynamic>map){
    page = map["page"];
    list = List.from(map["results"]).map((e) =>MovieModel.fromMap(e)).toList();
    totalPages = map["total_pages"];
    totalResults = map["total_results"];
  }
}


class MovieModel
{
  late String image,title,subTitle,originalLanguage,date;
  late num rating ,popularity;
  // late int id;

  MovieModel({required this.image, required this.title, required this.subTitle, required this.rating});

  MovieModel.fromMap(Map<String,dynamic>map){
    image = map["backdrop_path"]==null?"https://img.freepik.com/free-vector/error-404-concept-landing-page_52683-21520.jpg?w=1380&t=st=1699983142~exp=1699983742~hmac=9737e77f8b93410f0fc5bddacfdc9d02926ca435169f5a33f2f062b3b6d15b8e":"http://image.tmdb.org/t/p/original${map["backdrop_path"]}";
    title = map["original_title"];
    subTitle = map["overview"];
    rating = map["vote_average"];
    originalLanguage = map ["original_language"];
    popularity = map ["popularity"];
    date = map["release_date"];
    // id = map["genre_ids"];
  }
}