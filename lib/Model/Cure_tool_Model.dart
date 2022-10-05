

class Cure_tool_Model{

  final String? title;
  final String? content;
  final String? doc_path;

  Cure_tool_Model(
      {required this.title,
        required this.content,
        required this.doc_path
  });

  factory Cure_tool_Model.fromJson(Map<dynamic, dynamic>? json) => Cure_tool_Model(
      title: json!['title'],
      content: json['content'],
      doc_path:json['doc_path']
   );

  Map<String, dynamic> toJson() =>
      {"title": title, "content": content};
}