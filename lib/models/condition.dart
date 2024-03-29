class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'],
        icon:
            'assets/images/${(json['icon']?.toString() ?? '').split('64/').last}',
        code: json['code'],
      );
}
