class Batch {
  const Batch({required this.content});

  final String content;

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(content: json['message']);
  }
}
