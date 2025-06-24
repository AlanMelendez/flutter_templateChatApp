class YesNoModel {
  String answer;
  bool force;
  String image;

  YesNoModel({
    required this.answer,
    required this.force,
    required this.image,
  });

  factory YesNoModel.fromJson(Map<String, dynamic> json)
    => YesNoModel(
      answer: json['answer'] ?? '',
      force: json['force'] ?? false,
      image: json['image'] ?? '',
    );


}