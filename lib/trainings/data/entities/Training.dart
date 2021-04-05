class Training {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final Level level;
  final List<String> muscleGroups;

  Training(this.id, this.imageUrl, this.title, this.description, this.level,
      this.muscleGroups);
}

enum Level { easy, medium, hard }
