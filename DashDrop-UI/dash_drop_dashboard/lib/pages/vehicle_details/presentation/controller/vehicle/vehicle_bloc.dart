import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/entities/vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/create_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/delete_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/get_vehicle.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/get_vehicles.dart';
import 'package:dash_drop_dashboard/pages/vehicle_details/domain/usecase/update_vehicle.dart';
import 'package:equatable/equatable.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final GetVehicleUseCase getVehicleUseCase;
  final GetVehiclesUseCase getVehiclesUseCase;
  final CreateVehicleUseCase createVehicleUseCase;
  final UpdateVehicleUseCase updateVehicleUseCase;
  final DeleteVehicleUseCase deleteVehicleUseCase;

  VehicleBloc(
    this.getVehicleUseCase,
    this.getVehiclesUseCase,
    this.createVehicleUseCase,
    this.updateVehicleUseCase,
    this.deleteVehicleUseCase,
  ) : super(const VehicleState()) {
    
    on<GetVehiclesEvent>(_getVehiclesHandler);
    on<GetVehicleEvent>(_getVehicleHandler);
    on<CreateVehicleEvent>(_createVehicleHandler);
    on<UpdateVehicleEvent>(_updateVehicleHandler);
    on<DeleteVehicleEvent>(_deleteVehicleHandler);
  }

  void _getVehiclesHandler(event, emit) async {

    emit(state.copyWith(state: RequestState.loading,
             nameState: NameState.get));

    final result = await getVehiclesUseCase(const NoParameters());
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) => emit(state.copyWith(
            getDatas: r,
            state: RequestState.loaded,
            nameState: NameState.get)));
  }

  void _getVehicleHandler(event, emit) async {
     emit(state.copyWith(state: RequestState.loading,
             nameState: NameState.getDetails));

    final result = await getVehicleUseCase(GetVehicleParameters(id: event.id));
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) => emit(state.copyWith(
            getData: r,
            state: RequestState.loaded,
            nameState: NameState.getDetails)));
  }

  void _createVehicleHandler(event, emit) async {
     emit(state.copyWith(state: RequestState.loading,
             nameState: NameState.create));
    final result = await createVehicleUseCase(CreateVehicleParameters(
        costPerKm: event.costPerKm,
        avgSpeedKm: event.avgSpeedKm,
        maxRangekm: event.maxRangekm,
        maxCapacityCubicM: event.maxCapacityCubicM,
        maxWeightKg: event.maxWeightKg,
        sensitivityLevel: event.sensitivityLevel,
        type: event.type,
        specifications: event.specifications));
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) {
      List<Vehicle> vehicles = state.getDatas;
      vehicles.add(r);
      emit(state.copyWith(
          getDatas: vehicles,
          state: RequestState.loaded,
          nameState: NameState.create));
    });
  }

  void _updateVehicleHandler(event, emit) async {
     emit(state.copyWith(state: RequestState.loading,
             nameState: NameState.update));
    final result = await updateVehicleUseCase(UpdateVehicleParameters(
        id: event.id,
        costPerKm: event.costPerKm,
        avgSpeedKm: event.avgSpeedKm,
        maxRangekm: event.maxRangekm,
        maxCapacityCubicM: event.maxCapacityCubicM,
        maxWeightKg: event.maxWeightKg,
        sensitivityLevel: event.sensitivityLevel,
        type: event.type,
        specifications: event.specifications));
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) {
      List<Vehicle> vehicles = state.getDatas.map((vehicles) {
        if (vehicles.id == event.id as int) {
          return vehicles.copyWith(
              id: event.id,
              avgSpeedKm: event.avgSpeedKm,
              costPerKm: event.costPerKm,
              maxCapacityCubicM: event.maxCapacityCubicM,
              maxRangekm: event.maxRangekm,
              maxWeightKg: event.maxWeightKg,
              sensitivityLevel: event.sensitivityLevel,
              specifications: event.specifications,
              type: event.type);
        }
        return vehicles; // Return unchanged Driverss
      }).toList();

      emit(state.copyWith(
          getDatas: vehicles,
          state: RequestState.loaded,
          nameState: NameState.update));
    });
  }

  void _deleteVehicleHandler(event, emit) async {
     emit(state.copyWith(state: RequestState.loading,
             nameState: NameState.delete));
    final result =
        await deleteVehicleUseCase(DeleteVehicleParameters(id: event.id));
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) => emit(state.copyWith(
            state: RequestState.loaded, nameState: NameState.delete)));
  }
}
