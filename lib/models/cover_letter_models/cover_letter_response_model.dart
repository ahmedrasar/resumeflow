import 'package:json_annotation/json_annotation.dart';
import 'package:resumeflow/models/cover_letter_models/cover_letter_generative_data.dart';

part 'cover_letter_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CoverLetterResponseModel {
  @JsonKey(name: 'cover_letter')
  final String genBody;

  CoverLetterResponseModel({required this.genBody});

  factory CoverLetterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoverLetterResponseModelFromJson(json);

  CoverLetterGenData get data => CoverLetterGenData(generatedBody: genBody);
}
