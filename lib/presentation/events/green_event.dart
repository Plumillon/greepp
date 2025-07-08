sealed class GreenEvent {}

class LoadGreenEvent extends GreenEvent {}

class LoadDetailsGreenEvent extends GreenEvent {
  final String id;

  LoadDetailsGreenEvent({required this.id});
}
