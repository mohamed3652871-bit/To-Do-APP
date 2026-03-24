
import 'dart:io';

class Car{
  String? num;
  String name;
  Car({this.num, required this.name});
}


void main(){
  String? nnum= stdin.readLineSync();
  nnum??='1';
  Car car1=Car( num: nnum,name: "bmw");
  print("${car1.name}: ${car1.num}");


}