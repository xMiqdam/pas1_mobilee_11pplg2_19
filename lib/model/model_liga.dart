class ModelBola {
  final int? id;
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String strDescriptionEN;
  final bool isCompleted;
  ModelBola({
    this.id,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strDescriptionEN,
    this.isCompleted = false,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'strTeam': strTeam,
      'strStadium': strStadium,
      'strBadge': strBadge,
      'strDescriptionEN': strDescriptionEN,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }
  factory ModelBola.fromMap(Map<String, dynamic> map) {
    return ModelBola(
      id: map['id'] as int?,
      strTeam: map['strTeam'] as String,
      strStadium: map['strStadium'] as String,
      strBadge: map['strBadge'] as String,
      strDescriptionEN: map['strDescriptionEN'] as String,
      isCompleted: map['isCompleted'] == 1,
    );
  }
}