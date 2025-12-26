part of 'job_offer_bloc.dart';

abstract class JobOfferEvent extends Equatable {
  const JobOfferEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetJobOffersEvent extends JobOfferEvent {}

class GetJobOfferEvent extends JobOfferEvent {
  const GetJobOfferEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
  
}

class CreateJobOfferEvent extends JobOfferEvent {

  final String description;
  final String requestDeadlineDate;
  final int vehicleDetailId;
  final int regionId;

  const CreateJobOfferEvent({
    required this.description,
    required this.requestDeadlineDate,
    required this.vehicleDetailId,
    required this.regionId,
  });


  @override
  List<Object> get props {
    return [
      description,
      requestDeadlineDate,
      vehicleDetailId,
      regionId
    ];
  }
}

class UpdateJobOfferEvent extends JobOfferEvent{

  final int id;
  final String description;
  final String requestDeadlineDate;
  final int vehicleDetailId;
  final int regionId;

  const UpdateJobOfferEvent({
    required this.id,
    required this.description,
    required this.requestDeadlineDate,
    required this.vehicleDetailId,
    required this.regionId,
  });


  @override
  List<Object> get props {
    return [
      id,
      description,
      requestDeadlineDate,
      vehicleDetailId,
      regionId,
    ];
  }
}

class DeleteJobOfferEvent extends JobOfferEvent {
  const DeleteJobOfferEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];

}
