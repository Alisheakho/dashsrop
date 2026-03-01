// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Vacation Dashboard';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get employees => 'Employees';

  @override
  String get requests => 'Requests';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get welcome => 'Welcome back';

  @override
  String get stats_pending => 'Pending Requests';

  @override
  String get stats_approved => 'Approved Leaves';

  @override
  String get stats_employees => 'Total Employees';

  @override
  String get stats_allowance => 'Total Allowance';

  @override
  String get add_employee => 'Add Employee';

  @override
  String get ministryOfInterior => 'Ministry of Interior';

  @override
  String get drugEnforcement => 'Drug Enforcement Department';

  @override
  String get secureLogin => 'Secure Login';

  @override
  String get authorizedPersonnelOnly => 'Access Authorized Personnel Only';

  @override
  String get authorizedId => 'AUTHORIZED ID';

  @override
  String get authorizedIdHint => 'Enter personnel ID';

  @override
  String get securePassword => 'SECURE PASSWORD';

  @override
  String get accessDashboard => 'ACCESS DASHBOARD';

  @override
  String get pendingRequests => 'Pending Requests';

  @override
  String get activeLeaves => 'Active Leaves';

  @override
  String get availableAllowance => 'Available Allowance';

  @override
  String get totalStaff => 'Total Staff';

  @override
  String get urgent => 'Urgent';

  @override
  String get onTrack => 'On Track';

  @override
  String get days => 'Days';

  @override
  String get active => 'Active';

  @override
  String get leaveTrends => 'Leave Trends';

  @override
  String get leaveTypeDistribution => 'Leave Type Distribution';

  @override
  String get personnelRegistry => 'Personnel Registry';

  @override
  String get personnelRegistryDesc =>
      'Detailed directory of all authorized departmental staff';

  @override
  String get registerPersonnel => 'Register Personnel';

  @override
  String get searchRegistry => 'Search registry by name, email, or ID...';

  @override
  String get advancedFilters => 'Advanced Filters';

  @override
  String get exportData => 'Export Data';

  @override
  String get id => 'ID';

  @override
  String get fullName => 'Full Name';

  @override
  String get officialEmail => 'Official Email';

  @override
  String get assignedBranch => 'Assigned Branch';

  @override
  String get roleStatus => 'Role Status';

  @override
  String get contact => 'Contact';

  @override
  String get management => 'Management';

  @override
  String get confirmDeletion => 'Confirm Deletion';

  @override
  String deleteEmployeeConfirm(Object name) {
    return 'Are you sure you want to delete the record for $name? This action cannot be undone.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get confirmDelete => 'DELETE';

  @override
  String get personnel => 'Personnel';

  @override
  String get personalDetails => 'Personal Details';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get birthdate => 'Date of Birth';

  @override
  String get employmentInfo => 'Employment Information';

  @override
  String get branch => 'Branch';

  @override
  String get department => 'Department';

  @override
  String get leaveBalance => 'Leave Balance (Days)';

  @override
  String get accessControl => 'Access Control';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get registering => 'Registering...';

  @override
  String get register => 'Register Personnel';

  @override
  String get registerNewPersonnel => 'Register New Personnel';

  @override
  String get registerDesc =>
      'Create a new employee profile and assign system access.';

  @override
  String get updatePersonnelRecord => 'Update Personnel Record';

  @override
  String editingProfileFor(Object name) {
    return 'Editing profile for: $name';
  }

  @override
  String get leavePasswordBlank =>
      'Leave password fields blank to keep current password.';

  @override
  String get updating => 'Updating...';

  @override
  String get saveChanges => 'Save Changes';
}
