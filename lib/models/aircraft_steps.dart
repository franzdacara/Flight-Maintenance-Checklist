class AircraftSteps {
  final String name;
  final bool isAvailable;
  final String route;
  bool isComplete;

  AircraftSteps({
    required this.name,
    required this.isAvailable,
    required this.route,
    this.isComplete = false,
  });
}
