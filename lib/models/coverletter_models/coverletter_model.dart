import 'package:json_annotation/json_annotation.dart';

part 'coverletter_model.g.dart';

@JsonSerializable(anyMap: false)
class CoverletterModel {
  final String data;

  CoverletterModel({required this.data});

  factory CoverletterModel.fromJson(Map<String, dynamic> json) =>
      _$CoverletterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoverletterModelToJson(this);
}
