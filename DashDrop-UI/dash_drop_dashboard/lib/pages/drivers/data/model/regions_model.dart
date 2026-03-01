import 'package:dash_drop_dashboard/core/utils/typedef.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';

class RegionsModel extends Regions{
  const RegionsModel({required super.id, required super.name});
     
      factory RegionsModel.fromJson(DataMap map) {
    return RegionsModel(id:map['id'],name: map['name']);
    
    }
}