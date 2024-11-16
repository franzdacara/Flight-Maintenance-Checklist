class AircraftSteps {
  final String name;
  final bool isAvailable;
  final String route;
  final String imagePath;
  bool isComplete;

  AircraftSteps({
    required this.name,
    required this.isAvailable,
    required this.route,
    required this.imagePath,
    this.isComplete = false,
  });
}


