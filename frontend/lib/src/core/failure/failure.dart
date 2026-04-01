class Failure {
  final String? message;
  const Failure({this.message});

  factory Failure.serverError({String? message}) => Failure(message: message);
  factory Failure.networkError({String? message}) => Failure(message: message);
  factory Failure.unknownError({String? message}) => Failure(message: message);
}
