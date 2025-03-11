class PlayList {
  final String id, title, description, banner;
  final DateTime publishedAt;
  final int itemCount;

  PlayList(
      {required this.id,
      required this.title,
      required this.banner,
      required this.description,
      required this.publishedAt,
      required this.itemCount});

  static PlayList fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];

    final thumbnail =
        snippet['thumbnails']['standard'] ?? snippet['thumbnails']['high'];
    return PlayList(
        id: json['id'],
        title: snippet['title'],
        description: snippet['description'],
        banner: thumbnail['url'],
        publishedAt: DateTime.parse(snippet['publishedAt']),
        itemCount: json['contentDetails']['itemCount']);
  }
}
