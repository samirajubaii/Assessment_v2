import 'package:flutter/material.dart';

List<ServiceProvider> providers=[
  ServiceProvider(name:'ahmad',profession: 'Plumber',description: 'best plumber',phone: '70412397',isIndividual: true),
  ServiceProvider(name:'ali',profession: 'Electrician',description: 'best Electrican',phone: '71512697',isIndividual: true),
  ServiceProvider(name:'The Percect electician comp.',profession: 'Electrician',description: 'the most reliable electrican \nthat provides many services',phone: '81672397',isIndividual: false),
  ServiceProvider(name:'loay nehme',profession: 'Carpenter',description: 'accuracy in measuring and\ncutting',phone: '76038915',isIndividual: true),
  ServiceProvider(name:'The professional Plumber Company',profession: 'Plumber',description: 'repair ,maintain machines and tools ',phone: '76038915',isIndividual: false),
  ServiceProvider(name:'Carpenter Co.',profession: 'Carpenter',description: 'Best carpentor co',phone: '76038915',isIndividual: false),
  ServiceProvider(name:'Plumber Co.',profession: 'Plumber',description: 'install and repair pipes',phone: '71580321',isIndividual: false),
  ServiceProvider(name:'fysal leo',profession: 'Carpenter',description: 'good at wood construct ,install\nand repair structures',phone: '81943620',isIndividual: true),
  ServiceProvider(name:'alex ',profession: 'Electrician',description: 'best electrican with control \nand lighting system',phone: '71762377',isIndividual: true),
  ServiceProvider(name:'Essa electrican',profession: 'Electrician',description: 'best service in saida',phone: '76215300',isIndividual: true),
];
class ServiceProvider{
  String name,profession,description,phone;
  bool isIndividual ;
  ServiceProvider({
    required this.name,
    required this.profession,
    required this.description,
    required this.phone,
    required this.isIndividual,
  });

  String get getName => name;
  String get getProfession => profession;
  String get getDescription => description;
  String get getPhone => phone;
  bool get getIsIndividual => isIndividual;

  @override
  String toString() {
    return '$name\n$phone\n$description';
  }

}