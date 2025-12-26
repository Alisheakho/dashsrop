import 'dart:async';

import 'package:dash_drop_dashboard/core/usecase/base_usecase.dart';
import 'package:dash_drop_dashboard/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/job_offer.dart';
import '../../domain/usecase/create_job_offer.dart';
import '../../domain/usecase/delete_job_offer.dart';
import '../../domain/usecase/get_job_offer.dart';
import '../../domain/usecase/get_job_offers.dart';
import '../../domain/usecase/update_job_offer.dart';

part 'job_offer_events.dart';
part 'job_offer_states.dart';

class JobOfferBloc extends Bloc<JobOfferEvent, JobOfferState> {
  final GetJobOffersUseCase getJobOffersUseCase;
  final GetJobOfferUseCase getJobOfferUseCase;
  final CreateJobOfferUseCase createJobOfferUseCase;
  final UpdateJobOfferUseCase updateJobOfferUseCase;
  final DeleteJobOfferUseCase deleteJobOfferUseCase;


  JobOfferBloc(
      this.getJobOffersUseCase,
      this.getJobOfferUseCase,
      this.createJobOfferUseCase,
      this.updateJobOfferUseCase,
      this.deleteJobOfferUseCase)
      : super(const JobOfferState()) {
    on<GetJobOffersEvent>(_getJobOffersHandler);
    on<GetJobOfferEvent>(_getJobOfferHandler);
    on<CreateJobOfferEvent>(_createJobOfferHandler);
    on<UpdateJobOfferEvent>(_updateJobOfferHandler);
    on<DeleteJobOfferEvent>(_deleteJobOfferHandler);
  }

  FutureOr<void> _getJobOffersHandler(
      GetJobOffersEvent event, Emitter<JobOfferState> emit) async {
    final result = await getJobOffersUseCase(const NoParameters());
    // print(result);
    // emit(const JobOffersState(getJobOffersState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            getJobOffersMessage: l.message,
            getJobOffersState: RequestState.error)),
        (r) => emit(state.copyWith(
            getJobOffers: r, getJobOffersState: RequestState.loaded)));
  }

  FutureOr<void> _getJobOfferHandler(
      GetJobOfferEvent event, Emitter<JobOfferState> emit) async {
    final result =
        await getJobOfferUseCase(GetJobOfferParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            getJobOfferMessage: l.message,
            getJobOfferState: RequestState.error)),
        (r) => emit(state.copyWith(
            getJobOffer: r,
            getJobOfferState: RequestState.loaded))); //createJobOffer: r,
  }

  FutureOr<void> _createJobOfferHandler(
      CreateJobOfferEvent event, Emitter<JobOfferState> emit) async {
    final result = await createJobOfferUseCase(CreateJobOfferParameters(
        description: event.description,
        requestDeadlineDate: event.requestDeadlineDate,
        vehicleDetailId: event.vehicleDetailId,
        regionId: event.regionId));
    result.fold(
        (l) => emit(state.copyWith(
            createJobOfferMessage: l.message,
            createJobOfferErrors: l.errors,
            createJobOfferState: RequestState.error)), (r) {
      List<JobOffer> jobOffers = state.getJobOffers;
      jobOffers.add(r);
      emit(state.copyWith(
          createJobOfferState: RequestState.loaded, getJobOffers: jobOffers));
    });
  }

  FutureOr<void> _updateJobOfferHandler(
      UpdateJobOfferEvent event, Emitter<JobOfferState> emit) async {
    final result = await updateJobOfferUseCase(UpdateJobOfferParameters(
        id: event.id,
        description: event.description,
        requestDeadlineDate: event.requestDeadlineDate,
        vehicleDetailId: event.vehicleDetailId,
        regionId: event.regionId));
    result.fold(
        (l) => emit(state.copyWith(
            updateJobOfferMessage: l.message,
            updateJobOfferErrors: l.errors,
            updateJobOfferState: RequestState.error)), (_) {
      List<JobOffer> updatedJobOffers = state.getJobOffers.map((jobOffer) {
        if (jobOffer.id == event.id) {
          return jobOffer.copyWith(
            description: event.description,
            requestDeadlineDate: event.requestDeadlineDate,
            vehicleDetailId: event.vehicleDetailId,
            regionId: event.regionId,
          );
        }
        return jobOffer;
      }).toList();
      emit(state.copyWith(
          updateJobOfferState: RequestState.loaded,
          getJobOffers: updatedJobOffers));
    });
  }

  FutureOr<void> _deleteJobOfferHandler(
      DeleteJobOfferEvent event, Emitter<JobOfferState> emit) async {
    final result =
        await deleteJobOfferUseCase(DeleteJobOfferParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            deleteJobOfferMessage: l.message,
            deleteJobOfferState: RequestState.error)),
        (_) => emit(state.copyWith(
            deleteJobOfferState: RequestState.loaded,
            getJobOffers: state.getJobOffers
                .where((jobOffer) => jobOffer.id != event.id)
                .toList())));
  }
}
