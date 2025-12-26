part of 'hiering_bloc.dart';

class HieringState extends Equatable {
  final List<Hiering> getDatas;
  final Hiering getData;
  final List<JobOffer> getSDatas;
  final RequestState state;
  final NameState nameState;
  final String message;
  final Map? error;
  
  final RequestState createHierningState;
  final String createHierningMessage;
  final Map? createHierningErrors;

  const HieringState(
      {
         this.createHierningState=RequestState.loading,
      this.createHierningMessage='',
      this.createHierningErrors,
        this.getDatas = const [
        Hiering(
            id: 0,
            firstName: '',
            employeeId: 0,
            jobOfferId: 0,
            lastName: '',
            email: '',
            phoneNumber: '',
            gender: Gender.female,
            birthdate: '',
            vehiclePlateNumber: '',
            idNumber: '',
            isAccepted: false,
            createdAt: '',
            lastUpdatedAt: '')
      ],
      this.getSDatas = const [
        JobOffer(
            id: 0,
            description: '',
            requestDeadlineDate: '',
            employeeId: 0,
            vehicleDetailId: 0,
            regionId: 0,
            createdAt: '',
            lastUpdatedAt: '',
            vehicleDetail:{},
            region:{})
      ],
      this.getData = const Hiering(
          id: 0,
          firstName: '',
          lastName: '',
          email: '',
          phoneNumber: '',
          gender: Gender.female,
          birthdate: '',
          vehiclePlateNumber: '',
          idNumber: '',
          isAccepted: false,
          createdAt: '',
          lastUpdatedAt: '',
          employeeId: 0,
          jobOfferId: 0),
      this.state = RequestState.loading,
      this.nameState = NameState.noThing,
      this.message = '',
      this.error,
     

      });

  @override
  List<Object?> get props =>
      [getDatas, getData, state, nameState, message, error,createHierningErrors,createHierningMessage,createHierningState];

  HieringState copyWith(
      {List<Hiering>? getDatas,
      Hiering? getData,
      List<JobOffer>? getSDatas,
      RequestState? state,
      NameState? nameState,
      String? message,
      Map? error,
     Map? createHierningErrors,
    String?  createHierningMessage,
     RequestState? createHierningState
      }) {
    return HieringState(
        getData: getData ?? this.getData,
        getDatas: getDatas ?? this.getDatas,
        getSDatas: getSDatas??this.getSDatas,
        state: state ?? this.state,
        nameState: nameState ?? this.nameState,
        error: error ?? this.error,
        message: message ?? this.message,
        createHierningState: createHierningState ?? this.createHierningState,
        createHierningMessage: createHierningMessage ?? this.createHierningMessage,
        createHierningErrors: createHierningErrors ?? this.createHierningErrors,
        );
  }
}
