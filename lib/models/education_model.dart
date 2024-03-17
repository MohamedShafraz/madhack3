class Education {
  final String id;
  final String degree;
  final String institution;
  final String startDate;
  final String endDate;

  Education({
    required this.id,
    required this.degree,
    required this.institution,
    required this.startDate,
    required this.endDate,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      id: json['id'] as String,
      degree: json['degree'] as String,
      institution: json['institution'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'degree': degree,
      'institution': institution,
      'startDate': startDate,
      'endDate': endDate,
    };
  }
}
