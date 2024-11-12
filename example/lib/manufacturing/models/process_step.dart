class ProcessStep {
  final String id;
  final String name;
  final String description;
  final int sequence;
  final bool isCompleted;
  final DateTime? completedAt;

  ProcessStep({
    required this.id,
    required this.name,
    required this.description,
    required this.sequence,
    this.isCompleted = false,
    this.completedAt,
  });
}
