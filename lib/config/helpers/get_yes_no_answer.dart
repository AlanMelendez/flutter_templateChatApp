import 'package:dio/dio.dart';
import 'package:theme_yes_app/domain/entities/message.dart';
import 'package:theme_yes_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get(
      'https://yesno.wtf/api',
      //options: Options(headers: {'Accept': 'application/json'}),
    );


    final YesNoModel yesNoModel = YesNoModel.fromJsonMap(response.data);


    return yesNoModel.toMessageEntity();

    // return Message(
    //   text: yesNoModel.answer,
    //   fromWho: FromWho.hers,
    //   imageUrl: yesNoModel.image,
    // );

    // return Message(
    //   text: response.data['answer'],
    //   fromWho: FromWho.hers,
    //   imageUrl: response.data['image'],
    // );

    //throw Exception('Failed to load answer: ${response.statusCode}');
  }
}
