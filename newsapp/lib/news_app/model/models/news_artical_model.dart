class NewsArticalModel{
  final Source? source;
  final String? auther;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  NewsArticalModel({
    required this.source, 
    required this.auther, 
    required this.title, 
    required this.description, 
    required this.url, 
    required this.urlToImage, 
    required this.publishedAt, 
    required this.content});
  
  factory NewsArticalModel.fromMap(Map<String,dynamic>map){
    return NewsArticalModel(
    source: map["source"] != null? Source.fromMap(map["source"]):null, 
    auther: map["auther"], 
    title: map["title"], 
    description: map["description"], 
    url: map["url"], 
    urlToImage: map["urlToImage"], 
    publishedAt: map["publishedAt"] != null? DateTime.tryParse(map["publishedAt"]):null, 
    content: map["content"]
    );
  }
}
class Source{
  final String? id;
  final String? name;
  Source({required this.id, 
  required this.name
  });
  factory Source.fromMap(Map<String,dynamic>map){
    return Source(
      id: map["id"], 
      name: map["name"] 
      );
  }
}