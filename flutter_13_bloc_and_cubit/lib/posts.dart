
class Posts{
  final int userId;
  final int id;
  final String title;
  final String body;

  Posts(this.userId, this.id, this.title, this.body);


  factory Posts.fromJson(Map<String,dynamic>json)=>Posts(json['userId'],json['id'],json['title'], json['body']);
}