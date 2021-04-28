class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        json['userId'],
        json['id'],
        json['title'],
        json['body'],
      );

  Post(this.userId, this.id, this.title, this.body);

  @override
  String toString() {
    return "$userId $id $title $body";
  }
}
