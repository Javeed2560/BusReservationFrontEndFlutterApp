import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_details_model.freezed.dart';

part 'error_details_model.g.dart';

@unfreezed
class ErrorDetailsModel with _$ErrorDetailsModel {
  factory ErrorDetailsModel({
    required int errorCode,
    required String errorMessage,
    required String devErrorMessage,
    required int timestamp,
  }) = _ErrorDetails;
  factory ErrorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsModelFromJson(json);
}
