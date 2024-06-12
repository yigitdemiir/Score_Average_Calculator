class Ders {
  final String dersAdi;
  final double dersHarfi;
  final double dersKredisi;

  Ders(this.dersAdi, this.dersHarfi, this.dersKredisi);

  @override
  String toString() {
    return "$dersAdi $dersHarfi $dersKredisi";
  }
}
