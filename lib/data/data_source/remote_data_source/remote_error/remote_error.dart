import 'package:equatable/equatable.dart';

class RemoteError extends Equatable {
  final int code;
  final String message;

  const RemoteError({required this.code, required this.message});

  factory RemoteError.fromJson(Map<String, dynamic> json) {
    return RemoteError(
      code: json['cod'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = code;
    data['message'] = message;
    return data;
  }

  @override
  List<Object> get props => [code, message];
}
