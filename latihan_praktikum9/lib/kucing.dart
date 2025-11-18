import 'hewan.dart';

class Kucing extends Hewan {
  String warnaBulu;

  Kucing(String nama, double berat, this.warnaBulu) : super(nama, berat);

  // @override
  // String makan(double porsi) {
  //   super.makan(porsi);
  //   return ('kucing $nama sedang makan sebanyak $porsi gram.');
  // }

  @override
  void makan() {
    berat += 1.0;
    print('Kucing $nama dengan bulu $warnaBulu sedang makan.');
  }

  @override
  void lari() {
    berat -= 0.5;
    print('Kucing $nama dengan bulu $warnaBulu sedang berlari.');
  }
}