// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'لوحة الإجازات';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get employees => 'الموظفين';

  @override
  String get requests => 'الطلبات';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get welcome => 'أهلاً بك';

  @override
  String get stats_pending => 'طلبات معلقة';

  @override
  String get stats_approved => 'إجازات مقبولة';

  @override
  String get stats_employees => 'إجمالي الموظفين';

  @override
  String get stats_allowance => 'رصيد الإجازات';

  @override
  String get add_employee => 'إضافة موظف';

  @override
  String get ministryOfInterior => 'وزارة الداخلية';

  @override
  String get drugEnforcement => 'إدارة مكافحة المخدرات';

  @override
  String get secureLogin => 'تسجيل دخول آمن';

  @override
  String get authorizedPersonnelOnly => 'الدخول للموظفين المصرح لهم فقط';

  @override
  String get authorizedId => 'رقم الهوية المصرح به';

  @override
  String get authorizedIdHint => 'أدخل رقم الهوية';

  @override
  String get securePassword => 'كلمة مرور آمنة';

  @override
  String get accessDashboard => 'الدخول إلى اللوحة';

  @override
  String get pendingRequests => 'الطلبات المعلقة';

  @override
  String get activeLeaves => 'الإجازات النشطة';

  @override
  String get availableAllowance => 'الرصيد المتاح';

  @override
  String get totalStaff => 'إجمالي الموظفين';

  @override
  String get urgent => 'عاجل';

  @override
  String get onTrack => 'في المسار';

  @override
  String get days => 'أيام';

  @override
  String get active => 'نشط';

  @override
  String get leaveTrends => 'اتجاهات الإجازات';

  @override
  String get leaveTypeDistribution => 'توزيع أنواع الإجازات';

  @override
  String get personnelRegistry => 'سجل الموظفين';

  @override
  String get personnelRegistryDesc =>
      'دليل مفصل لجميع موظفي الإدارة المصرح لهم';

  @override
  String get registerPersonnel => 'تسجيل موظف';

  @override
  String get searchRegistry => 'البحث بالاسم، البريد، أو رقم الهوية...';

  @override
  String get advancedFilters => 'تصفية متقدمة';

  @override
  String get exportData => 'تصدير البيانات';

  @override
  String get id => 'المعرف';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get officialEmail => 'البريد الرسمي';

  @override
  String get assignedBranch => 'الفرع المعين';

  @override
  String get roleStatus => 'الحالة الوظيفية';

  @override
  String get contact => 'الاتصال';

  @override
  String get management => 'الإدارة';

  @override
  String get confirmDeletion => 'تأكيد الحذف';

  @override
  String deleteEmployeeConfirm(Object name) {
    return 'هل أنت متأكد أنك تريد حذف سجل الموظف $name بشكل دائم؟ لا يمكن التراجع عن هذه العملية.';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirmDelete => 'حذف';

  @override
  String get personnel => 'موظف';

  @override
  String get personalDetails => 'البيانات الشخصية';

  @override
  String get firstName => 'الاسم الأول';

  @override
  String get lastName => 'الاسم الأخير';

  @override
  String get emailAddress => 'البريد الإلكتروني';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get gender => 'الجنس';

  @override
  String get male => 'ذكر';

  @override
  String get female => 'أنثى';

  @override
  String get birthdate => 'تاريخ الميلاد';

  @override
  String get employmentInfo => 'معلومات التوظيف';

  @override
  String get branch => 'الفرع';

  @override
  String get department => 'القسم';

  @override
  String get leaveBalance => 'رصيد الإجازات (أيام)';

  @override
  String get accessControl => 'التحكم في الوصول';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get registering => 'جار التسجيل...';

  @override
  String get register => 'تسجيل';

  @override
  String get registerNewPersonnel => 'تسجيل موظف جديد';

  @override
  String get registerDesc => 'إنشاء ملف تعريف موظف جديد وتعيين صلاحيات النظام.';

  @override
  String get updatePersonnelRecord => 'تحديث سجل الموظف';

  @override
  String editingProfileFor(Object name) {
    return 'تعديل الملف الشخصي لـ: $name';
  }

  @override
  String get leavePasswordBlank =>
      'اترك حقول كلمة المرور فارغة للاحتفاظ بكلمة المرور الحالية.';

  @override
  String get updating => 'جار التحديث...';

  @override
  String get saveChanges => 'حفظ التغييرات';
}
