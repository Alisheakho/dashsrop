// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'job_offer_bloc.dart';

class JobOfferState extends Equatable {
  final List<JobOffer> getJobOffers;
  final RequestState getJobOffersState;
  final String getJobOffersMessage;

  final JobOffer getJobOffer;
  final RequestState getJobOfferState;
  final String getJobOfferMessage;

  final RequestState createJobOfferState;
  final String createJobOfferMessage;
  final Map? createJobOfferErrors;

  final RequestState updateJobOfferState;
  final String updateJobOfferMessage;
  final Map? updateJobOfferErrors;

  final RequestState deleteJobOfferState;
  final String deleteJobOfferMessage;

  const JobOfferState({
    this.getJobOffers = const [],
    this.getJobOffersState = RequestState.loading,
    this.getJobOffersMessage = '',
    this.getJobOffer = const JobOffer(id: 0, description: '', requestDeadlineDate: '', employeeId: 0, vehicleDetailId: 0, regionId: 0, createdAt: '', lastUpdatedAt: '',vehicleDetail:{},region:{}),
    this.getJobOfferState = RequestState.loading,
    this.getJobOfferMessage = '',
    this.createJobOfferState = RequestState.loading,
    this.createJobOfferMessage = '',
    this.createJobOfferErrors,
    this.updateJobOfferState = RequestState.loading,
    this.updateJobOfferMessage = '',
    this.updateJobOfferErrors,
    this.deleteJobOfferState = RequestState.loading,
    this.deleteJobOfferMessage = '',
  });

  

  @override
  List<Object> get props {
    return [
      getJobOffers,
      getJobOffersState,
      getJobOffersMessage,
      getJobOffer,
      getJobOfferState,
      getJobOfferMessage,
      createJobOfferState,
      createJobOfferMessage,
      updateJobOfferState,
      updateJobOfferMessage,
      deleteJobOfferState,
      deleteJobOfferMessage,
    ];
  }

  JobOfferState copyWith({
    List<JobOffer>? getJobOffers,
    RequestState? getJobOffersState,
    String? getJobOffersMessage,
    JobOffer? getJobOffer,
    RequestState? getJobOfferState,
    String? getJobOfferMessage,
    RequestState? createJobOfferState,
    String? createJobOfferMessage,
    Map? createJobOfferErrors,
    RequestState? updateJobOfferState,
    String? updateJobOfferMessage,
    Map? updateJobOfferErrors,
    RequestState? deleteJobOfferState,
    String? deleteJobOfferMessage,
  }) {
    return JobOfferState(
      getJobOffers: getJobOffers ?? this.getJobOffers,
      getJobOffersState: getJobOffersState ?? this.getJobOffersState,
      getJobOffersMessage: getJobOffersMessage ?? this.getJobOffersMessage,
      getJobOffer: getJobOffer ?? this.getJobOffer,
      getJobOfferState: getJobOfferState ?? this.getJobOfferState,
      getJobOfferMessage: getJobOfferMessage ?? this.getJobOfferMessage,
      createJobOfferState: createJobOfferState ?? this.createJobOfferState,
      createJobOfferMessage: createJobOfferMessage ?? this.createJobOfferMessage,
      createJobOfferErrors: createJobOfferErrors ?? this.createJobOfferErrors,
      updateJobOfferState: updateJobOfferState ?? this.updateJobOfferState,
      updateJobOfferMessage: updateJobOfferMessage ?? this.updateJobOfferMessage,
      updateJobOfferErrors: updateJobOfferErrors ?? this.updateJobOfferErrors,
      deleteJobOfferState: deleteJobOfferState ?? this.deleteJobOfferState,
      deleteJobOfferMessage: deleteJobOfferMessage ?? this.deleteJobOfferMessage,
    );
  }
}
