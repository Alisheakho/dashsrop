import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'flutter_gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Vacation Dashboard'**
  String get appName;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back'**
  String get welcome;

  /// No description provided for @stats_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending Requests'**
  String get stats_pending;

  /// No description provided for @stats_approved.
  ///
  /// In en, this message translates to:
  /// **'Approved Leaves'**
  String get stats_approved;

  /// No description provided for @stats_employees.
  ///
  /// In en, this message translates to:
  /// **'Total Employees'**
  String get stats_employees;

  /// No description provided for @stats_allowance.
  ///
  /// In en, this message translates to:
  /// **'Total Allowance'**
  String get stats_allowance;

  /// No description provided for @add_employee.
  ///
  /// In en, this message translates to:
  /// **'Add Employee'**
  String get add_employee;

  /// No description provided for @ministryOfInterior.
  ///
  /// In en, this message translates to:
  /// **'Ministry of Interior'**
  String get ministryOfInterior;

  /// No description provided for @drugEnforcement.
  ///
  /// In en, this message translates to:
  /// **'Drug Enforcement Department'**
  String get drugEnforcement;

  /// No description provided for @secureLogin.
  ///
  /// In en, this message translates to:
  /// **'Secure Login'**
  String get secureLogin;

  /// No description provided for @authorizedPersonnelOnly.
  ///
  /// In en, this message translates to:
  /// **'Access Authorized Personnel Only'**
  String get authorizedPersonnelOnly;

  /// No description provided for @authorizedId.
  ///
  /// In en, this message translates to:
  /// **'AUTHORIZED ID'**
  String get authorizedId;

  /// No description provided for @authorizedIdHint.
  ///
  /// In en, this message translates to:
  /// **'Enter personnel ID'**
  String get authorizedIdHint;

  /// No description provided for @securePassword.
  ///
  /// In en, this message translates to:
  /// **'SECURE PASSWORD'**
  String get securePassword;

  /// No description provided for @accessDashboard.
  ///
  /// In en, this message translates to:
  /// **'ACCESS DASHBOARD'**
  String get accessDashboard;

  /// No description provided for @pendingRequests.
  ///
  /// In en, this message translates to:
  /// **'Pending Requests'**
  String get pendingRequests;

  /// No description provided for @activeLeaves.
  ///
  /// In en, this message translates to:
  /// **'Active Leaves'**
  String get activeLeaves;

  /// No description provided for @availableAllowance.
  ///
  /// In en, this message translates to:
  /// **'Available Allowance'**
  String get availableAllowance;

  /// No description provided for @totalStaff.
  ///
  /// In en, this message translates to:
  /// **'Total Staff'**
  String get totalStaff;

  /// No description provided for @urgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get urgent;

  /// No description provided for @onTrack.
  ///
  /// In en, this message translates to:
  /// **'On Track'**
  String get onTrack;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @leaveTrends.
  ///
  /// In en, this message translates to:
  /// **'Leave Trends'**
  String get leaveTrends;

  /// No description provided for @leaveTypeDistribution.
  ///
  /// In en, this message translates to:
  /// **'Leave Type Distribution'**
  String get leaveTypeDistribution;

  /// No description provided for @personnelRegistry.
  ///
  /// In en, this message translates to:
  /// **'Personnel Registry'**
  String get personnelRegistry;

  /// No description provided for @personnelRegistryDesc.
  ///
  /// In en, this message translates to:
  /// **'Detailed directory of all authorized departmental staff'**
  String get personnelRegistryDesc;

  /// No description provided for @registerPersonnel.
  ///
  /// In en, this message translates to:
  /// **'Register Personnel'**
  String get registerPersonnel;

  /// No description provided for @searchRegistry.
  ///
  /// In en, this message translates to:
  /// **'Search registry by name, email, or ID...'**
  String get searchRegistry;

  /// No description provided for @advancedFilters.
  ///
  /// In en, this message translates to:
  /// **'Advanced Filters'**
  String get advancedFilters;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @officialEmail.
  ///
  /// In en, this message translates to:
  /// **'Official Email'**
  String get officialEmail;

  /// No description provided for @assignedBranch.
  ///
  /// In en, this message translates to:
  /// **'Assigned Branch'**
  String get assignedBranch;

  /// No description provided for @roleStatus.
  ///
  /// In en, this message translates to:
  /// **'Role Status'**
  String get roleStatus;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @management.
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get management;

  /// No description provided for @confirmDeletion.
  ///
  /// In en, this message translates to:
  /// **'Confirm Deletion'**
  String get confirmDeletion;

  /// No description provided for @deleteEmployeeConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete the record for {name}? This action cannot be undone.'**
  String deleteEmployeeConfirm(Object name);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get confirmDelete;

  /// No description provided for @personnel.
  ///
  /// In en, this message translates to:
  /// **'Personnel'**
  String get personnel;

  /// No description provided for @personalDetails.
  ///
  /// In en, this message translates to:
  /// **'Personal Details'**
  String get personalDetails;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @birthdate.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthdate;

  /// No description provided for @employmentInfo.
  ///
  /// In en, this message translates to:
  /// **'Employment Information'**
  String get employmentInfo;

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// No description provided for @department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department;

  /// No description provided for @leaveBalance.
  ///
  /// In en, this message translates to:
  /// **'Leave Balance (Days)'**
  String get leaveBalance;

  /// No description provided for @accessControl.
  ///
  /// In en, this message translates to:
  /// **'Access Control'**
  String get accessControl;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @registering.
  ///
  /// In en, this message translates to:
  /// **'Registering...'**
  String get registering;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register Personnel'**
  String get register;

  /// No description provided for @registerNewPersonnel.
  ///
  /// In en, this message translates to:
  /// **'Register New Personnel'**
  String get registerNewPersonnel;

  /// No description provided for @registerDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a new employee profile and assign system access.'**
  String get registerDesc;

  /// No description provided for @updatePersonnelRecord.
  ///
  /// In en, this message translates to:
  /// **'Update Personnel Record'**
  String get updatePersonnelRecord;

  /// No description provided for @editingProfileFor.
  ///
  /// In en, this message translates to:
  /// **'Editing profile for: {name}'**
  String editingProfileFor(Object name);

  /// No description provided for @leavePasswordBlank.
  ///
  /// In en, this message translates to:
  /// **'Leave password fields blank to keep current password.'**
  String get leavePasswordBlank;

  /// No description provided for @updating.
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get updating;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
