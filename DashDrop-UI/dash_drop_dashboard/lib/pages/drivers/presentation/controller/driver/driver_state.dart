part of 'driver_bloc.dart';

class DriverState extends Equatable {
  final List<Drivers> getDrivers;
  final RequestState getDriversState;
  final String getDriversMessage;

  final Drivers getDriver;
  final RequestState getDriverstate;
  final String getDriverMessage;

  final RequestState createDriverstate;
  final String createDriversMessage;
  final Map? createDriversErrors;

  final RequestState updateDriverstate;
  final String updateDriversMessage;
  final Map? updateDriversErrors;

  final List<Regions> getRegions;
  final RequestState getRegionstate;
  final String getRegionsMessage;

  final List<VehicleDetails> getVehicleDetails;
  final RequestState getVehicleDetailstate;
  final String getVehicleDetailsMessage;

  final RequestState deleteDriverstate;
  final String deleteDriversMessage;

  const DriverState({
    this.getDrivers = const [],
    this.getDriversState = RequestState.loading,
    this.getDriversMessage = '',
    this.getRegions = const [],
    this.getRegionsMessage = '',
    this.getRegionstate = RequestState.loading,
    this.getVehicleDetails = const[ VehicleDetails(
        id: 0,
        profitPerKm: 0,
        avgSpeedKm: 0,
        maxRangekm: 0,
        maxCapacityCubicM: 0,
        maxWeightKg: 0,
        sensitivityLevel: 0,
        type: 0,
        specifications: '',
        createdAt: '',
        lastUpdatedAt: '')],
    this.getDriver = const Drivers(
        id: 0,
        firstName: '',
        lastName: '',
        email: 'email',
        phoneNumber: '',
        gender: 0,
        birthdate: '',
        vehiclePlateNumber: '',
        idNumber: '',
        regionId: 0,
        vehicleDetailId: 0,
        createdAt: '',
        lastUpdatedAt: ''),
    this.getVehicleDetailsMessage = '',
    this.getVehicleDetailstate = RequestState.loading,
    this.getDriverstate = RequestState.loading,
    this.getDriverMessage = '',
    this.createDriverstate = RequestState.loading,
    this.createDriversMessage = '',
    this.createDriversErrors,
    this.updateDriverstate = RequestState.loading,
    this.updateDriversMessage = '',
    this.updateDriversErrors,
    this.deleteDriverstate = RequestState.loading,
    this.deleteDriversMessage = '',
  });

  @override
  List<Object> get props {
    return [
      getDrivers,
      getDriversState,
      getDriversMessage,
      getDriver,
      getDriverstate,
      getDriverMessage,
      getRegionsMessage,
      getRegionstate,
      getRegions,
      getVehicleDetails,
      getVehicleDetailsMessage,
      getVehicleDetailstate,
      createDriverstate,
      createDriversMessage,
      updateDriverstate,
      updateDriversMessage,
      deleteDriverstate,
      deleteDriversMessage,
    ];
  }

  DriverState copyWith({
    List<Drivers>? getDrivers,
    RequestState? getDriversState,
    String? getDriversMessage,

    List<Regions>? getRegions,
    RequestState? getRegionstate,
    String? getRegionsMessage,

    List<VehicleDetails>? getVehicleDetails,
    RequestState? getVehicleDetailstate,
    String? getVehicleDetailsMessage,

    Drivers? getDriver,
    RequestState? getDriverstate,
    String? getDriverMessage,
    RequestState? createDriverstate,
    String? createDriversMessage,
    Map? createDriversErrors,
    RequestState? updateDriverstate,
    String? updateDriversMessage,
    Map? updateDriversErrors,
    RequestState? deleteDriverstate,
    String? deleteDriversMessage,
  }) {
    return DriverState(
      getDrivers: getDrivers ?? this.getDrivers,
      getDriversState: getDriversState ?? this.getDriversState,
      getDriversMessage: getDriversMessage ?? this.getDriversMessage,
      getDriver: getDriver ?? this.getDriver,
      getDriverstate: getDriverstate ?? this.getDriverstate,


      getRegions: getRegions ?? this.getRegions,
      getRegionsMessage: getRegionsMessage??this.getRegionsMessage,
      getRegionstate: getRegionstate??this.getRegionstate,

      getVehicleDetails: getVehicleDetails ?? this.getVehicleDetails,
      getVehicleDetailsMessage: getVehicleDetailsMessage??this.getVehicleDetailsMessage,
      getVehicleDetailstate: getVehicleDetailstate??this.getVehicleDetailstate,

      getDriverMessage: getDriverMessage ?? this.getDriverMessage,
      createDriverstate: createDriverstate ?? this.createDriverstate,
      createDriversMessage: createDriversMessage ?? this.createDriversMessage,
      createDriversErrors: createDriversErrors ?? this.createDriversErrors,
      updateDriverstate: updateDriverstate ?? this.updateDriverstate,
      updateDriversMessage: updateDriversMessage ?? this.updateDriversMessage,
      updateDriversErrors: updateDriversErrors ?? this.updateDriversErrors,
      deleteDriverstate: deleteDriverstate ?? this.deleteDriverstate,
      deleteDriversMessage: deleteDriversMessage ?? this.deleteDriversMessage,
    );
  }
}
