import 'package:json_annotation/json_annotation.dart';
import 'package:resumeflow/models/coverletter_models/coverletter_generative_data.dart';

part 'coverletter_response_model.g.dart';

@JsonSerializable(createToJson: false)
class CoverletterResponseModel {
  @JsonKey(name: 'cover_letter')
  final String genBody;

  CoverletterResponseModel({required this.genBody});

  factory CoverletterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CoverletterResponseModelFromJson(json);

  CoverletterGenerativeData get data =>
      CoverletterGenerativeData(genBody: genBody);
}
