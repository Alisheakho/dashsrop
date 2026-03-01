import 'package:equatable/equatable.dart';

class Regions extends Equatable{
  
  final int id;
  final String name;

  const Regions({required this.id,required this.name});

  
  @override
  List<Object?> get props => [id,name];

}