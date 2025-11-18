class Hewan {
  String nama;
  double berat;

  Hewan(this.nama, this.berat);

  // String makan(double porsi) {
  //   berat += porsi / 1000;
  //   return 'Hewan ${nama} telah makan sebanyak $porsi gram.';
  // }

  void makan() {
    berat += 1.0; // tambah 1 kg
  }

  void lari() {
    berat -= 0.5; // kurangi 0.5 kg
  }
}
