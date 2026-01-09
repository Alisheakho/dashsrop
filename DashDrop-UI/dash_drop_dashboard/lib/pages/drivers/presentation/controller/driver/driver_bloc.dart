import 'dart:async';

import 'package:dash_drop_dashboard/pages/vehicle_details/presentation/controller/vehicle/vehicle_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/regions.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/entities/vehicle_details.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/create_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/delete_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_Regions.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_driver.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_drivers.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/get_vehicleDetails.dart';
import 'package:dash_drop_dashboard/pages/drivers/domain/usscase/update_driver.dart';
import 'package:equatable/equatable.dart';

part 'driver_event.dart';
part 'driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
  final GetDriverUseCase getDriverUseCase;
  final GetDriversUseCase getDriversUseCase;
  final CreateDriverUseCase createDriverUseCase;
  final DeleteDriverUseCase deleteDriverUseCase;
  final UpdateDriversUseCase updateDriversUseCase;
  final GetRegionsUseCase getRegionsUseCase;
  final GetVehicleDetailssUseCase getVehicleDetailssUseCase;

  DriverBloc(
      this.getDriverUseCase,
      this.getDriversUseCase,
      this.createDriverUseCase,
      this.deleteDriverUseCase,
      this.updateDriversUseCase,
      this.getRegionsUseCase,
      this.getVehicleDetailssUseCase)
      : super(const DriverState()) {
    on<GetDriversEvent>(_getDriversHandler);
    on<GetDriverEvent>(_getDriverHandler);
    on<CreateDriverEvent>(_createDriverHandler);
    on<UpdateDriverEvent>(_updateDriverHandler);
    on<DeleteDriverEvent>(_deleteDriverHandler);
    on<GetRegVegEvent>(_getRegVegHandler);
  }

  FutureOr<void> _getDriversHandler(event, emit) async {
    final result = await getDriversUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            getDriversMessage: l.message, getDriversState: RequestState.error)),
        (r) => emit(state.copyWith(
            getDrivers: r, getDriversState: RequestState.loaded)));
  }

  FutureOr<void> _getDriverHandler(event, emit) async {
    emit(state.copyWith(getDriverstate: RequestState.loading));
    final result = await getDriverUseCase(GetDriverParameters(id: event.id));
    final resultR = await getRegionsUseCase(const NoParameters());
    final resultVD = await getVehicleDetailssUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            getDriverMessage: l.message,
            getDriverstate: RequestState.error)), (r) {
      resultR.fold((lr) {
        emit(state.copyWith(
            getDriverMessage: lr.message, getDriverstate: RequestState.error));
      }, (rr) {
        resultVD.fold(
          (lvd) {
            emit(state.copyWith(
                getDriverMessage: lvd.message,
                getDriverstate: RequestState.error));
          },
          (rvd) {
            return emit(state.copyWith(
                getDriver: r,
                getRegions: rr,
                getVehicleDetails: rvd,
                getDriverstate: RequestState.loaded));
          },
        );
      });
    });
  }

  FutureOr<void> _createDriverHandler(event, emit) async {
    emit(state.copyWith(createDriverstate: RequestState.loading));
    final result = await createDriverUseCase(CreateDriverParameters(
        firstName: event.firstName,
        lastName: event.lastName,
        userID: event.userID,
        phoneNumber: event.phoneNumber,
        gender: event.gender,
        birthdate: event.birthdate,
        vehiclePlateNumber: event.vehiclePlateNumber,
        password: event.password,
        idNumber: event.idNumber,
        regionId: event.regionId,
        vehicleDetailId: event.vehicleDetailId));
    result.fold(
        (l) => emit(state.copyWith(
            createDriversMessage: l.message,
            createDriversErrors: l.errors,
            createDriverstate: RequestState.error)), (r) {
      List<Drivers> driver = state.getDrivers;
      driver.add(r);
      emit(state.copyWith(
          createDriverstate: RequestState.loaded, getDrivers: driver));
    });
  }

  FutureOr<void> _updateDriverHandler(event, emit) async {
    emit(state.copyWith(updateDriverstate: RequestState.loading));

    final result = await updateDriversUseCase(UpdateDriversParameters(
        id: event.id,
        firstName: event.firstName,
        lastName: event.lastName,
        userID: event.userID,
        phoneNumber: event.phoneNumber,
        gender: event.gender,
        birthdate: event.birthdate,
        vehiclePlateNumber: event.vehiclePlateNumber,
        password: event.password,
        idNumber: event.idNumber,
        regionId: event.regionId,
        vehicleDetailId: event.vehicleDetailId));
    result.fold(
        (l) => emit(state.copyWith(
            updateDriversMessage: l.message,
            updateDriversErrors: l.errors,
            updateDriverstate: RequestState.error)), (_) {
      List<Drivers> updatedDrivers = [];
      state.getDrivers.map((drivers) {
        if (drivers.id == event.id as int) {
          print(event.id);
          //updatedDrivers.add(drivers.copyWith(
          return drivers.copyWith(
              id: event.id,
              firstName: event.firstName,
              lastName: event.lastName,
              userID: event.userID,
              phoneNumber: event.phoneNumber,
              gender: event.gender,
              birthdate: event.birthdate,
              vehiclePlateNumber: event.vehiclePlateNumber,
              //password: event.password,
              idNumber: event.idNumber,
              regionId: event.regionId,
              vehicleDetailId: event.vehicleDetailId);
          //);
        }
        return drivers; // Return unchanged Driverss
      });

      emit(state.copyWith(
          updateDriverstate: RequestState.loaded, getDrivers: updatedDrivers));
    });
  }

  FutureOr<void> _deleteDriverHandler(event, emit) async {
    final result =
        await deleteDriverUseCase(DeleteDriverParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            deleteDriversMessage: l.message,
            deleteDriverstate: RequestState.error)),
        (_) => emit(state.copyWith(
            deleteDriverstate: RequestState.loaded,
            getDrivers: state.getDrivers
                .where((drivers) => drivers.id != event.id)
                .toList())));
  }

  Future<void> _getRegVegHandler(event, emit) async {
    emit(state.copyWith(getDriverstate: RequestState.loading));
    final result = await getRegionsUseCase(const NoParameters());
    final resultVD = await getVehicleDetailssUseCase(const NoParameters());

    result.fold((lr) {
      emit(state.copyWith(
          getDriverMessage: lr.message, getDriverstate: RequestState.error));
    }, (rr) {
      resultVD.fold(
        (lvd) {
          emit(state.copyWith(
              getDriverMessage: lvd.message,
              getDriverstate: RequestState.error));
        },
        (rvd) {
          return emit(state.copyWith(
              getRegions: rr,
              getVehicleDetails: rvd,
              getDriverstate: RequestState.loaded));
        },
      );
    });
  }
}
