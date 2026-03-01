import 'dart:async';

import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/create_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/delete_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/get_hiering.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/get_hierings.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/usscase/update_hiering.dart';
import 'package:dash_drop_dashboard/pages/job_offers/domain/usecase/get_job_offer.dart';
import 'package:dash_drop_dashboard/pages/job_offers/domain/usecase/get_job_offers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:dash_drop_dashboard/pages/hieringRequests/domain/entities/hiering.dart';
import 'package:dash_drop_dashboard/pages/job_offers/domain/entities/job_offer.dart';
import 'package:equatable/equatable.dart';
part 'hiering_event.dart';
part 'hiering_state.dart';

class HieringBloc extends Bloc<HieringEvent, HieringState> {
  final GetHieringsUseCase getHieringsUseCase;
  final GetHieringUseCase getHieringUseCase;
  final DeleteHieringUseCase deleteHieringUseCase;
  final UpdateHieringUseCase updateHieringUseCase;
  final CreateHieringUseCase createHieringUseCase;
  final GetJobOffersUseCase getJobOfferssUseCase;
  final GetJobOfferUseCase getJobOfferUseCase;

  HieringBloc(
      this.getHieringUseCase,
      this.getHieringsUseCase,
      this.deleteHieringUseCase,
      this.updateHieringUseCase,
      this.createHieringUseCase,
      this.getJobOfferssUseCase,
      this.getJobOfferUseCase)
      : super(const HieringState()) {
    on<GetHieringsEvent>(_getHieringsHandler);
    on<GetHieringEvent>(_getHieringHandler);
    on<CreateHieringEvent>(_createHieringHandler);
    on<UpdateHieringEvent>(_updateHieringHandler);
    on<DeleteHieringEvent>(_deleteHieringHandler);
  }

  FutureOr<void> _getHieringsHandler(
      GetHieringsEvent event, Emitter<HieringState> emit) async {
    emit(state.copyWith(state: RequestState.loading, nameState: NameState.get));
    final result = await getHieringsUseCase(const NoParameters());
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) => emit(state.copyWith(
            getDatas: r,
            state: RequestState.loaded,
            nameState: NameState.get)));
  }

  FutureOr<void> _getHieringHandler(
      GetHieringEvent event, Emitter<HieringState> emit) async {
    emit(state.copyWith(
        state: RequestState.loading, nameState: NameState.getDetails));

    final result = await getHieringUseCase(GetHieringParameters(id: event.id));
    final joboffersResult = await getJobOfferssUseCase(const NoParameters());
    List<JobOffer>? joboffers;

    joboffersResult.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (rj) {
      joboffers = rj;
    });
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) {
      emit(state.copyWith(
          getData: r,
          getSDatas: joboffers,
          state: RequestState.loaded,
          nameState: NameState.getDetails));
    });
  }

  FutureOr<void> _deleteHieringHandler(
      DeleteHieringEvent event, Emitter<HieringState> emit) async {
    emit(state.copyWith(
        state: RequestState.loading, nameState: NameState.delete));
    final result =
        await deleteHieringUseCase(DeleteHieringParameters(id: event.id));
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) => emit(state.copyWith(
            state: RequestState.loaded, nameState: NameState.delete)));
  }

  FutureOr<void> _updateHieringHandler(
      UpdateHieringEvent event, Emitter<HieringState> emit) async {
    emit(state.copyWith(
        state: RequestState.loading, nameState: NameState.update));
    final result = await updateHieringUseCase(UpdateHieringParameters(
        id: event.id,
        firstName: event.firstName,
        lastName: event.lastName,
        userID: event.userID,
        phoneNumber: event.phoneNumber,
        gender: event.gender,
        birthdate: event.birthdate,
        vehiclePlateNumber: event.vehiclePlateNumber,
        isAccepted: event.isAccepted,
        idNumber: event.idNumber,
        jobOfferId: event.jobOfferId));

    List<Hiering> hierings = [];

    state.getDatas.map((hiering) {
      if (hiering.id == event.id) {
        hierings.add(hiering.copyWith(
          id: event.id,
          firstName: event.firstName,
          lastName: event.lastName,
          userID: event.userID,
          phoneNumber: event.phoneNumber,
          gender: event.gender,
          birthdate: event.birthdate,
          vehiclePlateNumber: event.vehiclePlateNumber,
          isAccepted: event.isAccepted,
          idNumber: event.idNumber,
        ));
      }
      hierings.add(hiering); // Return unchanged Driverss
    });

    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) {
      emit(state.copyWith(
          //getDatas: hiering,
          state: RequestState.loaded,
          nameState: NameState.update));
    });
  }

  FutureOr<void> _createHieringHandler(
      CreateHieringEvent event, Emitter<HieringState> emit) async {
    emit(state.copyWith(
        createHierningState: RequestState.loading,
        nameState: NameState.create));
    final result = await createHieringUseCase(CreateHieringParameters(
        firstName: event.firstName,
        lastName: event.lastName,
        userID: event.userID,
        phoneNumber: event.phoneNumber,
        gender: event.gender,
        birthdate: event.birthdate,
        vehiclePlateNumber: event.vehiclePlateNumber,
        isAccepted: event.isAccepted,
        idNumber: event.idNumber,
        jobOfferId: event.jobOfferId));
    result.fold(
        (l) =>
            emit(state.copyWith(message: l.message, state: RequestState.error)),
        (r) {
      /* List<Hiering> hiering = state.getDatas;
      hiering.add(r); */
      emit(state.copyWith(
          state: RequestState.loaded, nameState: NameState.create));
    });
  }
}
