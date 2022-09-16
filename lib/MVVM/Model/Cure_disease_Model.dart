

class Cure_disease_Model{

  final String? title;
  final String? content;
  final String? doc_path;

  Cure_disease_Model(
      {required this.title,
        required this.content,
        required this.doc_path
      });

  factory Cure_disease_Model.fromJson(Map<dynamic, dynamic>? json) => Cure_disease_Model(
    title: json!['title'],
    content: json['content'],
      doc_path : json['doc_path']
  );

  Map<String, dynamic> toJson() =>
      {"title": title, "content": content,'doc_path':doc_path};
}