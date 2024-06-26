class Alert {
  final String headline;
  final String msgType;
  final String severity;
  final String urgency;
  final String areas;
  final String category;
  final String certainty;
  final String event;
  final String note;
  final String effective;
  final String expires;
  final String desc;
  final String instruction;

  Alert({
    required this.headline,
    required this.msgType,
    required this.severity,
    required this.urgency,
    required this.areas,
    required this.category,
    required this.certainty,
    required this.event,
    required this.note,
    required this.effective,
    required this.expires,
    required this.desc,
    required this.instruction,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        headline: json['headline'],
        msgType: json['msgtype'],
        severity: json['severity'],
        urgency: json['urgency'],
        areas: json['areas'],
        category: json['category'],
        certainty: json['certainty'],
        event: json['event'],
        note: json['note'],
        effective: json['effective'],
        expires: json['expires'],
        desc: json['desc'],
        instruction: json['instruction'],
      );
}
