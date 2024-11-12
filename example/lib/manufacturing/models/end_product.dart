class EndProduct {
  final String id;
  final String name;
  final String unit;
  final double quota;
  final double produced;

  EndProduct({
    required this.id,
    required this.name,
    required this.unit,
    required this.quota,
    this.produced = 0,
  });

  double get progress => (produced / quota) * 100;
}
