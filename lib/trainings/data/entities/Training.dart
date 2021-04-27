class Training {
  final String title;
  final String description;
  final Level level;

  Training(this.title, this.description, this.level);

  @override
  String toString() {
    return "$title, $description, ${level.value}";
  }
}

enum Level { easy, medium, hard }

extension LevelExtension on Level {
  String get value {
    switch (this) {
      case Level.easy:
        return 'Easy';
      case Level.medium:
        return 'Medium';
      case Level.hard:
        return 'Hard';
      default:
        return "";
    }
  }
}

extension LevelToStringExtension on String {
  Level get value {
    switch (this) {
      case 'Easy':
        return Level.easy;
      case 'Medium':
        return Level.medium;
      case 'Hard':
        return Level.hard;
      default:
        return Level.easy;
    }
  }
}
