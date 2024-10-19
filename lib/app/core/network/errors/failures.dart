sealed class Failure {
  final String? message;

  Failure({this.message});
}

final class ApiFailure extends Failure {
  ApiFailure({super.message = 'Error en la petición'});
}
