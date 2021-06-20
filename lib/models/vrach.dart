class Vrach {
  final int id;
  final String name;
  final String speciality;
  final String price;
  final String clinika;
  final List<String> hours;
  final DateTime date;

  const Vrach(
    this.id,
    this.name,
    this.speciality,
    this.price,
    this.clinika,
    this.hours,
    this.date,
  );
}
