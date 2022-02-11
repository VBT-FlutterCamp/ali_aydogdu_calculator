import 'dart:io';

void main() {
  print("\r   Hesap Makinası  \r");
  print("------------------------------------");
  while (true) {
    menu();
  }
}

void menu() {
  print("Birinci sayiyi girin :");
  final double sayi1 = double.parse(stdin.readLineSync()!);

  print("İkinci sayiyi girin :");
  final double sayi2 = double.parse(stdin.readLineSync()!);

  final Islem hesapla = Islem(sayi1, sayi2);
  late String secim;
  late int intsecim;
  do {
    print("Toplama için 1'e,");
    print("Çıkarma için 2'ye,");
    print("Çarpmaiçin 3'e");
    print("Bölme için 4'e");
    print("Mod Alma için 5'e basınız.");
    print("Seçiminiz : ");
    secim = stdin.readLineSync()!;
    intsecim = int.parse(secim);
    switch (intsecim) {
      case 1:
        print("Sonuç : ${hesapla.toplama()}");
        break;
      case 2:
        print("Sonuç : ${hesapla.cikarma()}");
        break;
      case 3:
        print("Sonuç : ${hesapla.carpma()}");
        break;
      case 4:
        print("Sonuç : ${hesapla.bolme()}");
        break;
      case 5:
        print("Sonuç : ${hesapla.mod()}");
        break;
      default:
        print("Gecersiz islem");
    }
    print("---------------------------------------------------");
  } while (intsecim == null || intsecim > 5);
}

abstract class Calculator {
  final double sayi1;
  final double sayi2;

  Calculator(this.sayi1, this.sayi2);

  double toplama();
  double cikarma();
  double carpma();
  double bolme();
  double mod();
}

class Islem extends Calculator {
  Islem(double sayi1, double sayi2) : super(sayi1, sayi2);

  @override
  double bolme() {
    return sayi1 / sayi2;
  }

  @override
  double carpma() {
    return sayi1 * sayi2;
  }

  @override
  double cikarma() {
    return sayi1 - sayi2;
  }

  @override
  double toplama() {
    return sayi1 + sayi2;
  }

  @override
  double mod() {
    return sayi1 % sayi2;
  }
}
