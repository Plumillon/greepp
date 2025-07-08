sealed class GreenException {}

class NotFoundGreenException extends GreenException {
  final String id;

  NotFoundGreenException({required this.id});
}
