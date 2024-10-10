// lib/models/user_model.dart
class UserModel {
  String username;
  String email;
  int points;
  int level;
  int streak;
  List<String> badges;

  UserModel({
    required this.username,
    required this.email,
    this.points = 0,
    this.level = 1,
    this.streak = 0,
    this.badges = const [],
  });

  void addPoints(int newPoints) {
    points += newPoints;
    _updateLevel();
  }

  void _updateLevel() {
    level = (points / 100).floor() + 1; // Exemple : chaque 100 points un niveau
  }

  void addBadge(String badge) {
    if (!badges.contains(badge)) {
      badges.add(badge);
    }
  }

  void incrementStreak() {
    streak += 1;
  }

  void resetStreak() {
    streak = 0;
  }
}
