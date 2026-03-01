part of 'vehicle_bloc.dart';

class VehicleState extends Equatable {
  final List<Vehicle> getDatas;
  final Vehicle getData;
  final RequestState state;
  final NameState nameState;
  final String message;
  final Map? error;

  const VehicleState(
      {this.getDatas = const [
        Vehicle(
            id: 0,
            costPerKm: 0,
            avgSpeedKm: 0,
            maxRangekm: 0,
            maxCapacityCubicM: 0,
            maxWeightKg: 0,
            sensitivityLevel: SensitivityLevels.medim,
            type: VehicleTypes.car,
            specifications: '',
            createdAt: '',
            lastUpdatedAt: '')
      ],
      this.getData = const Vehicle(
          id: 0,
          costPerKm: 0,
          avgSpeedKm: 0,
          maxRangekm: 0,
          maxCapacityCubicM: 0,
          maxWeightKg: 0,
          sensitivityLevel: SensitivityLevels.medim,
          type: VehicleTypes.car,
          specifications: '',
          createdAt: '',
          lastUpdatedAt: ''),
      this.state = RequestState.loading,
      this.nameState = NameState.noThing,
      this.message = '',
      this.error});

  @override
  List<Object?> get props =>
      [getDatas, getData, state, nameState, message, error];

    VehicleState copyWith({
      List<Vehicle>? getDatas,
      Vehicle? getData,
      RequestState? state,
      NameState? nameState,
      String? message,
      Map? error
    }){
      return VehicleState(
        getData: getData ?? this.getData,
        getDatas: getDatas ?? this.getDatas,
        state: state ?? this.state,
        nameState: nameState??this.nameState,
        error: error ?? this.error,
        message: message ?? this.message
      );
    }
}
