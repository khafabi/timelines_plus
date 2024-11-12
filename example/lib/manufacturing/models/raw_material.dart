class RawMaterial {
  final String id;
  final String name;
  final String unit;
  final double required;
  final double prepared;

  RawMaterial({
    required this.id,
    required this.name,
    required this.unit,
    required this.required,
    this.prepared = 0,
  });

  double get progress => (prepared / required) * 100;
}
