import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
      ? '${locale.toString()}_short'
      : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({String? enText = '', String? arText = ''}) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return AppLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Drivers
  {
    'startStream': {'ar': 'ابدا اسقبال الطلبات', 'en': 'Start Recivings'},
    'stopStream': {'ar': 'ايقاف اسقبال الطلبات', 'en': 'Stop Recivings'},
    'accept': {'ar': 'قبول', 'en': 'Accept'},
    'denied': {'ar': 'رفض', 'en': 'Decline'},
    'recivings': {'ar': 'طلبات', 'en': 'Recivings'},
    'reciverCustomerName': {'ar': 'اسم المستقبل', 'en': 'Reciver Name'},
    'senderCustomerName': {'ar': 'اسم المستقبل', 'en': 'Sender Name'},
    'sederInfo': {'ar': 'معلومات المرسل', 'en': 'Seder Info'},
    'extraProfitRate': {'ar': 'الربح', 'en': 'Extra Profit'},
    'costs': {'ar': 'التكلفة', 'en': 'Cost'},
    'estimatedTime': {'ar': 'الوقت المقدر', 'en': 'Estimated Time'},
    'paymentResponsibility': {
      'ar': 'مسؤلية الدفع',
      'en': 'Payment Responsibility',
    },
    'pathLengthKm': {'ar': 'مسافة الطريق (كم)', 'en': 'Path Length (Km)'},
    'noReciving': {'ar': 'لايوجد طلبات', 'en': 'No Reciving'},
  },
  // HomePage
  {
    'confirmYourLocation': {'en': 'Confirm Your Location', 'ar': 'تحديد موقعك'},
    'manualyLacationDessi': {
      'en':
          'If this location is not your current location please set it manually',
      'ar': 'إذا كان هذا الموقع ليس موقعك الحالي، فيرجى تعيينه يدويًا',
    },
    'confirmOrderdissi': {
      'en':
          'If you press on Receive now the order will be available for drivers',
      'ar': 'إذا قمت بالضغط على "استلام الآن" فسيكون الطلب متاحًا للسائقين',
    },
    'hello': {'en': 'Hello ', 'ar': 'مرحباً '},
    'moreDetails': {
      'en': 'ClicK for more deaitls',
      'ar': 'انقر لمزيد من التفاصيل',
    },
    'ActivOrder': {'en': 'Recent Activity', 'ar': 'النشط مؤخرا'},
    'DetalisOrder': {'en': 'DetalisOrder', 'ar': 'تفاصيل الطلب '},
    'send': {'en': 'sent ', 'ar': 'مرسل'},
    'receve': {'en': 'Received', 'ar': 'مستقبل'},

    'cmkxp3sx': {'en': 'Mohamad Hadi', 'ar': 'محمد هادي'},
    '4531wmed': {'en': 'Track Your Package', 'ar': 'تتبع حزمة الخاص بك'},
    '06v5n4n3': {
      'en': 'Please enter your tracking number',
      'ar': 'الرجاء إدخال رقم التتبع الخاص بك',
    },
    '2ppifpsa': {'en': 'Enter track ID number', 'ar': 'أدخل رقم معرف المسار'},
    '0kexy0fk': {'en': 'Check Rates', 'ar': 'معدلات الاختيار'},

    'c5aff05j': {'en': 'Order', 'ar': 'طلب'},
    'fna50yvt': {'en': 'Wallet', 'ar': 'محفظة'},
    'szoxbikj': {'en': 'Recent Activity', 'ar': 'النشاط الأخير'},
    'qi6vltf9': {'en': 'Smart Watch', 'ar': 'ساعة ذكية'},
    'm1izn0fu': {'en': 'RecevngCode', 'ar': 'كود الاستقبال'},
    '1ggmowto': {'en': 'From', 'ar': 'من'},
    '191amzhi': {'en': 'Idlib, Idlib Center', 'ar': 'إدلب, مركز المدينة'},
    '84bm4ojg': {'en': 'Shipping to', 'ar': 'يشحن إلى'},
    'rd17zcfu': {'en': 'Aleppo, A`zaz', 'ar': 'حلب, اعزاز'},
    'w6fc2w5r': {'en': 'Status :  ', 'ar': 'حالة :'},
    'u0babjbv': {'en': 'Your order is in ongoing', 'ar': 'طلبك قيد التنفيذ'},
    'tngq47xl': {'en': 'Services and Product', 'ar': 'الخدمات والمنتجات'},
    'ckm4eto1': {'en': 'HV458792547', 'ar': 'HV458792547'},
    '80af63nc': {
      'en': 'Processed at sort facility',
      'ar': 'معالجتها في منشأة الفرز',
    },
    'rnch0ctz': {'en': '1 Hour', 'ar': '1 ساعة'},
    'w6u55xbg': {'en': 'FD45413658', 'ar': 'FD45413658'},
    '5vqp7rvv': {
      'en': 'Processed at sort facility',
      'ar': 'معالجتها في منشأة الفرز',
    },
    '5r7hgtua': {'en': '1 day ago', 'ar': '1 منذ يوم'},
    'xlxw7igr': {'en': 'SU41547893', 'ar': 'سو41547893'},
    '4hcxudb3': {
      'en': 'Processed at sort facility',
      'ar': 'معالجتها في منشأة الفرز',
    },
    '45rshdg4': {'en': '2 day ago', 'ar': 'منذ 2 يوم'},
    'q47e3jt1': {'en': 'My Order', 'ar': 'طلبي'},
    'zw5l6dog': {'en': 'Upcoming', 'ar': 'القادمة'},
    'tqttysef': {'en': 'Enter track ID number', 'ar': 'أدخل رقم معرف المسار'},
    'd25ekny7': {'en': 'Smart Watch', 'ar': 'ساعة ذكية'},
    'o3rec056': {
      'en': 'Tracking ID: #12394527',
      'ar': 'معرف التتبع: #12394527',
    },
    'mhdfngtq': {'en': 'From', 'ar': 'من'},
    'jcm7z0zk': {'en': 'Idlib, Idlib Center', 'ar': 'إدلب, مركز المدينة'},
    'f72jzcq6': {'en': 'Shipping to', 'ar': 'يشحن إلى'},
    'o0t6crdv': {'en': 'Aleppo, A`zaz', 'ar': 'حلب, اعزاز'},
    'uw3xyrdi': {'en': 'Status :  ', 'ar': 'حالة :'},
    'qj10ztms': {'en': 'Your order is in ongoing', 'ar': 'طلبك قيد التنفيذ'},
    'wzrn5rdp': {'en': 'Adidas Shoes', 'ar': 'أحذية أديداس'},
    '32zdhpnt': {
      'en': 'Tracking ID: #87654321',
      'ar': 'معرف التتبع: #87654321',
    },
    'm6brkfac': {'en': 'From', 'ar': 'من'},
    'qcb9u9hj': {
      'en': 'Gatotkaca Street 40, Malang',
      'ar': 'شارع جاتوتكاكا 40، مالانج',
    },
    '92xzcg0o': {'en': 'Shipping to', 'ar': 'يشحن إلى'},
    'c9ho4r4h': {
      'en': 'Sunter Kemayoran Street 21, South Jakarta',
      'ar': 'شارع سونتر كيمايوران 21، جنوب جاكرتا',
    },
    'm28jgbde': {'en': 'Status :  ', 'ar': 'حالة :'},
    'wj0a62d7': {'en': ' Your order complete', 'ar': 'اكتمل طلبك'},
    'cghu6ay6': {'en': 'No Order yet!', 'ar': 'لا يوجد أمر حتى الآن!'},
    '0rx3n5da': {
      'en': 'Add items to your order list',
      'ar': 'أضف عناصر إلى قائمة الطلبات الخاصة بك',
    },
    'j5rol10o': {'en': 'History', 'ar': 'تاريخ'},
    'mck9e5kd': {'en': 'Enter track ID number', 'ar': 'أدخل رقم معرف المسار'},
    '8qvw1q4k': {'en': 'Smart Watch', 'ar': 'ساعة ذكية'},
    'z06y6ujq': {
      'en': 'Tracking ID: #12394527',
      'ar': 'معرف التتبع: #12394527',
    },
    'svfqswub': {'en': 'From', 'ar': 'من'},
    'ct8uuv23': {'en': 'Madrid, Spain', 'ar': 'مدريد اسبانيا'},
    'q4nyskx9': {'en': 'Shipping to', 'ar': 'يشحن إلى'},
    'mba22g0l': {'en': 'Jember, Indonesia', 'ar': 'جيمبر، إندونيسيا'},
    'z1jrsyto': {'en': 'Status :  ', 'ar': 'حالة :'},
    'j475l1ex': {'en': 'Complete', 'ar': 'مكتمل'},
    's7iax0rh': {'en': 'Adidas Shoes', 'ar': 'أحذية أديداس'},
    'hb7yja4o': {
      'en': 'Tracking ID: #87654321',
      'ar': 'معرف التتبع: #87654321',
    },
    'azxj7tfl': {'en': 'From', 'ar': 'من'},
    'k6jbwdsk': {
      'en': 'Gatotkaca Street 40, Malang',
      'ar': 'شارع جاتوتكاكا 40، مالانج',
    },
    'mwh3d5i5': {'en': 'Shipping to', 'ar': 'يشحن إلى'},
    'fngmvd2l': {
      'en': 'Sunter Kemayoran Street 21, South Jakarta',
      'ar': 'شارع سونتر كيمايوران 21، جنوب جاكرتا',
    },
    'tybj5977': {'en': 'Status :  ', 'ar': 'حالة :'},
    'zu0pnn0a': {'en': 'Complete', 'ar': 'مكتمل'},
    'tnas2qfd': {'en': 'No Order yet!', 'ar': 'لا يوجد أمر حتى الآن!'},
    '1fzfzv86': {
      'en': 'Add items to your order list',
      'ar': 'أضف عناصر إلى قائمة الطلبات الخاصة بك',
    },
    '8sy6s7ha': {'en': 'Messages', 'ar': 'رسائل'},
    'ikt7ttag': {'en': 'Search name..', 'ar': 'اسم البحث..'},
    'et013d1o': {'en': 'Marvin Mckinney', 'ar': 'مارفن ماكيني'},
    'ijeanr72': {'en': 'Wow, this is really epic', 'ar': 'واو، هذه ملحمة حقًا'},
    'job8dyet': {'en': '2', 'ar': '2'},
    '0lzmima1': {'en': '11:05', 'ar': '11:05'},
    'aai9k93t': {'en': 'Sanjuanita Ordonez', 'ar': 'سانخوانيتا أوردونيز'},
    'rilztimj': {
      'en': 'Just ideas for next time',
      'ar': 'مجرد أفكار في المرة القادمة',
    },
    'wiod4gvj': {'en': '2', 'ar': '2'},
    'wx8t9b6y': {'en': '09:02', 'ar': '09:02'},
    '651kj7f8': {'en': 'Edgar Torrey', 'ar': 'إدغار توري'},
    'y86okdnb': {
      'en': 'Hi, good morning too!',
      'ar': 'مرحبا، صباح الخير أيضا!',
    },
    '562x6w1t': {'en': '02:30', 'ar': '02:30'},
    '6h4jz357': {'en': 'Florencio Dorrance', 'ar': 'فلورنسيو دورانس'},
    '07bp5vws': {'en': 'Ok, Perfect!', 'ar': 'حسنا ممتاز!'},
    'bdle3wli': {'en': '1 day ago', 'ar': '1 منذ يوم'},
    '2rfapel1': {'en': 'Daryl Neels', 'ar': 'داريل نيلز'},
    'dqtj87rb': {'en': 'How are you?', 'ar': 'كيف حالك؟'},
    '16hxmfbv': {'en': '2', 'ar': '2'},
    'vm1oy2c3': {'en': '1 day ago', 'ar': '1 منذ يوم'},
    '28qejvqn': {'en': 'John laboy', 'ar': 'جون لابوي'},
    '3zh1psj0': {
      'en': 'I’ll be there in 5 mins',
      'ar': 'سأكون هناك خلال 5 دقائق',
    },
    'uwhh77ef': {'en': '2 day ago', 'ar': 'منذ 2 يوم'},
    'ysvkyy06': {'en': 'Lavern Tonny', 'ar': 'لافيرن توني'},
    'rlnonbq7': {
      'en': 'Hello, can i help you?',
      'ar': 'مرحبا هل يمكنني مساعدتك؟',
    },
    'q31zdqwm': {'en': '2 day ago', 'ar': 'منذ 2 يوم'},
    'dgho6bun': {'en': 'No Message yet!', 'ar': 'لا توجد رسالة بعد!'},
    'ak86zw9a': {
      'en': 'Connect with friends & start messaging',
      'ar': 'تواصل مع الأصدقاء وابدأ المراسلة',
    },
    '53fzj50m': {'en': 'My Profile', 'ar': 'ملفي'},
    'ujrfnlat': {'en': 'Mohamad Hadi', 'ar': 'محمد هادي'},
    '1ady0b70': {'en': '+90 5344934844', 'ar': '+90 5344934844 '},
    'maazto0d': {'en': 'Edit Profile', 'ar': 'تعديل الملف الشخصي'},
    'mnpn8f1j': {'en': 'Change Password', 'ar': 'تغيير كلمة المرور'},
    'qhejjv5f': {'en': 'FAQs', 'ar': 'الأسئلة الشائعة'},
    'lifdjqf3': {'en': 'Privacy Policy', 'ar': 'سياسة الخصوصية'},
    '80twuagy': {'en': 'Share', 'ar': 'يشارك'},
    'f1orjahy': {'en': 'Logout', 'ar': 'تسجيل خروج'},
    'j3z4fge7': {'en': 'Home', 'ar': 'بيت'},
    'jfejbtg0': {'en': 'Home', 'ar': 'بيت'},
    'hz9rd07c': {'en': 'My Order', 'ar': 'طلبي'},
    'lj0vt7vx': {'en': 'My Order', 'ar': 'طلبي'},
    'u4h05l8d': {'en': 'Messages', 'ar': 'رسائل'},
    '5ejauglr': {'en': 'Messages', 'ar': 'رسائل'},
    'fgcbppf6': {'en': 'Profile', 'ar': 'حساب تعريفي'},
    '1kjbwlu3': {'en': 'Profile', 'ar': 'حساب تعريفي'},
    '0swo2gov': {'en': 'Home', 'ar': 'بيت'},
  },
  // intro_screen
  {
    'cbduz0nk': {'en': 'Speed & Accuracy', 'ar': 'السرعة والدقة'},
    'bhomzb7p': {
      'en':
          'The speed in receiving & delivering\nshipments with the utmost accuracy.',
      'ar': 'السرعة في الاستلام والتسليم\nالشحنات بمنتهى الدقة.',
    },
    '1p2ipkfz': {'en': 'Delivery Anywhere', 'ar': 'التسليم في أي مكان'},
    '8d3nia2f': {
      'en': 'We cover all liberated northern Syria &\nreach everywhere.',
      'ar': 'نغطي جميع الشمال السوري المحرر \nتصل إلى كل مكان.',
    },
    'xvztsm7d': {'en': 'Protection & Safety', 'ar': 'الحماية والسلامة'},
    'o010so3s': {
      'en': 'Protect your shipment from damage\nand loss.',
      'ar': 'حماية شحنتك من التلف\nوالخسارة.',
    },
    'm12tv5vz': {'en': 'Skip', 'ar': 'يتخطى'},
    'pzdordud': {'en': 'Home', 'ar': 'بيت'},
  },
  // login_screen
  {
    'userID': {'en': 'userID', 'ar': 'البريد الإلكتروني'},
    'birthdate': {'en': 'Brithdate', 'ar': 'تاريخ الميلاد'},
    'validuserID': {
      'en': 'Please enter a valid userID',
      'ar': 'الرجاء التحقق من صحة البريد الالكتروني',
    },
    'userIDHint': {'en': 'example@example.com', 'ar': 'example@example.com'},
    'male': {'en': 'Male', 'ar': 'ذكر'},
    'female': {'en': 'Female', 'ar': 'أنثى'},
    'z8slfq2k': {'en': 'Sign Up', 'ar': 'اشتراك'},
    'firstName': {'en': 'First Name', 'ar': 'الاسم الاول'},
    'firstNameHint': {'en': 'Enter your First name', 'ar': 'أدخل اسمك الاول'},
    'lastName': {'en': 'Last Name', 'ar': 'الكنية '},
    'lastNameHint': {'en': 'Enter your Last name', 'ar': 'أدخل الكنية'},
    'a9acmnfp': {'en': 'Phone Number', 'ar': 'رقم التليفون'},
    '4jhs7tf5': {'en': ' Enter phone number', 'ar': 'أدخل رقم الهاتف'},
    'pcerqf9r': {'en': 'Password', 'ar': 'كلمة المرور'},
    'zu2i71c6': {'en': 'Enter your password', 'ar': 'ادخل رقمك السري'},
    '3kka47zo': {
      'en': 'Please enter a valid full name',
      'ar': 'الرجاء إدخال اسم كامل صالح',
    },
    '28cz5cn2': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '1z2k6u9v': {
      'en': 'please enter a valid phone number',
      'ar': 'يرجى إدخال رقم هاتف صالح',
    },
    '2drmx3nx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'venjprs4': {
      'en': 'Please enter a valid password',
      'ar': 'الرجاء إدخال كلمة السر الصحيحة',
    },
    'sqg1by86': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'uq0f74jc': {'en': 'Sign In', 'ar': 'تسجيل الدخول'},
    '7fbcgpwr': {'en': 'Phone Number', 'ar': 'رقم التليفون'},
    'pxn1e11f': {'en': ' Enter phone number', 'ar': 'أدخل رقم الهاتف'},
    'xkrhvehx': {'en': 'Password', 'ar': 'كلمة المرور'},
    'jvxsknhk': {'en': 'Enter your password', 'ar': 'ادخل رقمك السري'},
    'a7olqcbe': {'en': 'Forgot Password', 'ar': 'هل نسيت كلمة السر'},
    'ko6katly': {
      'en': 'please enter a valid phone number',
      'ar': 'يرجى إدخال رقم هاتف صالح',
    },
    'qb07f02y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'ih689jgy': {
      'en': 'Please enter a valid password',
      'ar': 'الرجاء إدخال كلمة السر الصحيحة',
    },
    '7fus8lth': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3fwdecke': {'en': 'Home', 'ar': 'بيت'},
  },
  // signup_verification_screen
  {
    'qesvwf1n': {
      'en': 'Please enter your OTP code sent to\nyour phone number ',
      'ar': 'الرجاء إدخال رمز OTP الخاص بك الذي تم إرساله إلى\nرقم تليفونك',
    },
    '09s25krz': {'en': '+62 4864452148', 'ar': '+62 4864452148'},
    'j7gvbrr3': {
      'en': 'Please enter a valid pin code',
      'ar': 'الرجاء إدخال رمز سري صالح',
    },
    'xj76vpkn': {'en': '01:20', 'ar': '01:20'},
    '2oui0qbv': {'en': 'Didn’t receive the code? ', 'ar': 'لم تتلق الرمز؟'},
    '3rkj2gwp': {'en': 'Resend', 'ar': 'إعادة إرسال'},
    'pvf26eoh': {'en': 'Home', 'ar': 'بيت'},
  },
  // edit_profile_screen
  {
    'ok7wbajv': {'en': 'Full name', 'ar': 'الاسم الكامل'},
    'cw8plkq6': {'en': 'Enter your full name', 'ar': 'أدخل اسمك الكامل'},
    'mc2fdh9l': {'en': 'Mohamad Hadi', 'ar': 'محمد هادي'},
    'a08c0dgx': {'en': 'Phone number', 'ar': 'رقم التليفون'},
    'y7sthw5y': {'en': ' Enter phone number', 'ar': 'أدخل رقم الهاتف'},
    'g7u1gnyv': {'en': 'Home', 'ar': 'بيت'},
  },
  // change_password_screen
  {
    's44avy3z': {'en': 'Old Password', 'ar': 'كلمة المرور القديمة'},
    'y59kifny': {'en': 'Enter old password', 'ar': 'أدخل كلمة المرور القديمة'},
    'lro8ztc1': {'en': 'New password', 'ar': 'كلمة المرور الجديدة'},
    'iu6uua6t': {'en': 'Enter new password', 'ar': 'أدخل كلمة المرور الجديدة'},
    'htzdxc0j': {'en': 'Confirm password', 'ar': 'تأكيد كلمة المرور'},
    'uswymg19': {
      'en': 'Enter confirm password',
      'ar': 'أدخل تأكيد كلمة المرور',
    },
    '1ff4uo27': {
      'en': 'Please enter a valid old password',
      'ar': 'الرجاء إدخال كلمة مرور قديمة صالحة',
    },
    '381l6vk0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'we2n37jw': {
      'en': 'Please enter a valid new password',
      'ar': 'الرجاء إدخال كلمة مرور جديدة صالحة',
    },
    '0i4x7b6t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'q6s4wvtc': {
      'en': 'Please enter a valid confirm password',
      'ar': 'الرجاء إدخال كلمة مرور تأكيد صالحة',
    },
    'ofa15d4q': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '2tc3its7': {'en': 'Home', 'ar': 'بيت'},
  },
  // faqs_screen
  {
    '502rqki5': {'en': 'Search FAQs', 'ar': 'البحث في الأسئلة الشائعة'},
    'pn48i90k': {'en': 'Popular Searched', 'ar': 'بحثت شعبية'},
    'sp7p7l46': {'en': 'What does Shipping do?', 'ar': 'ماذا يفعل الشحن؟'},
    'qa07g0qt': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
      'ar':
          'Amet minim mollit Non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ممارسة veniam consequat sunt nostrud amet.',
    },
    'hl81dbcf': {
      'en': 'What are custom shipping prices?',
      'ar': 'ما هي أسعار الشحن المخصصة؟',
    },
    '32syxtfy': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
      'ar':
          'Amet minim mollit Non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ممارسة veniam consequat sunt nostrud amet.',
    },
    '6up9t2ii': {
      'en': 'How can I track my order?',
      'ar': 'كيف يمكنني تتبع طلبي؟',
    },
    't4gixjlg': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
      'ar':
          'Amet minim mollit Non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ممارسة veniam consequat sunt nostrud amet.',
    },
    'bb8as7mb': {
      'en': 'I have received the incorrect products',
      'ar': 'لقد تلقيت المنتجات غير الصحيحة',
    },
    '4okfpsy8': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
      'ar':
          'Amet minim mollit Non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ممارسة veniam consequat sunt nostrud amet.',
    },
    '9mfgs57o': {
      'en': 'How can I track my order?',
      'ar': 'كيف يمكنني تتبع طلبي؟',
    },
    'dgjyuyqc': {
      'en':
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
      'ar':
          'Amet minim mollit Non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ممارسة veniam consequat sunt nostrud amet.',
    },
    'j4y7ds8g': {'en': 'Contact Via WhatsApp', 'ar': 'التواصل عبر الواتساب'},
    '22zjvqlp': {
      'en': 'Contact Via userID',
      'ar': 'الاتصال عبر البريد الإلكتروني',
    },
    '386r2zne': {'en': 'Home', 'ar': 'بيت'},
  },
  // messages_detail_screen
  {
    'bkwqczp9': {'en': 'Sanjuanita Ordonez', 'ar': 'سانخوانيتا أوردونيز'},
    '6fs9cz7n': {'en': 'Online', 'ar': 'متصل'},
    'pd1a8tb3': {'en': 'Today', 'ar': 'اليوم'},
    '18114uq6': {
      'en': 'Hello, I am a customer service, what\ncan i help you?',
      'ar': 'مرحبا، أنا خدمة العملاء، ماذا\nأيمكنني مساعدتك؟',
    },
    'fz6519ni': {'en': '12.00 ', 'ar': '12.00'},
    '2f6feq2a': {
      'en':
          'Hai, I want to ask about my package with\nid#IDS546124578 I\'m waiting for 5 days\nmy package has not deliver to me.',
      'ar':
          'هاي، أريد أن أسأل عن الحزمة الخاصة بي مع\nid#IDS546124578 أنا في انتظار 5 أيام\nلم يتم تسليم الحزمة الخاصة بي لي.',
    },
    'ixnraldh': {'en': '3:05 Am', 'ar': '3:05 صباحًا'},
    'xhp5ys0t': {
      'en':
          'Sorry, that happened because the\nshipping for this week very busy',
      'ar': 'آسف، حدث ذلك لأن\nالشحن لهذا الأسبوع مزدحم للغاية',
    },
    '38ptagur': {'en': '5:02 Am', 'ar': '5:02 صباحًا'},
    '43srdjq8': {'en': 'Search...', 'ar': 'يبحث...'},
    '056tghge': {'en': 'Home', 'ar': 'بيت'},
  },
  // call_detail_page
  {
    'kjvrst08': {'en': 'Sanjuanita Ordonez', 'ar': 'سانخوانيتا أوردونيز'},
    'f7nc99y9': {'en': '20:00', 'ar': '20:00'},
    's3ddodmc': {'en': 'Home', 'ar': 'بيت'},
  },
  // track_search_screen
  {
    '1rzjcx2u': {'en': 'Enter track ID number', 'ar': 'أدخل رقم معرف المسار'},
    '6gbcz9zg': {'en': 'Tracking History', 'ar': 'تتبع التاريخ'},
    'id9fycl5': {'en': 'Delete All', 'ar': 'حذف الكل'},
    'uvtox65j': {'en': 'Tracking History', 'ar': 'تتبع التاريخ'},
    'e7kkwuiu': {'en': 'Delete All', 'ar': 'حذف الكل'},
    '70qcq3np': {'en': 'No Found Result', 'ar': 'لم يتم العثور على نتيجة'},
    'ln5q0a9g': {
      'en':
          'Lorem ipsum is a placeholder text commonly \nused to demonstrate the visual.',
      'ar': 'لوريم إيبسوم هو نص نائب عادة\nتستخدم لإثبات البصرية.',
    },
    'g9iotacj': {'en': 'Home', 'ar': 'بيت'},
  },
  // scan_barcode_screen
  {
    '9bg2fqt7': {'en': 'Home', 'ar': 'بيت'},
  },
  // check_rates_screen
  {
    'fekjbk07': {'en': 'Search...', 'ar': 'يبحث...'},
    'b7wcaymr': {'en': 'Search...', 'ar': 'يبحث...'},
    'txzuy5av': {'en': 'Dimension', 'ar': 'البعد'},
    '1mvmfunb': {'en': '0', 'ar': '0'},
    '15gspbz1': {'en': 'Kg', 'ar': 'كلغ'},
    'k6aqwhyr': {'en': 'Home', 'ar': 'بيت'},
  },
  // order_form_screen
  {
    'js591uzm': {'en': 'Full Name', 'ar': 'الاسم الكامل'},
    'ym2kiiz1': {'en': 'Enter your name', 'ar': 'أدخل أسمك'},
    'gs6wvajh': {'en': 'Phone Number', 'ar': 'رقم التليفون'},
    'whetiyqy': {'en': 'Enter your number', 'ar': 'أدخل رقمك'},
    '2hwhs5o2': {'en': 'City / Province', 'ar': 'المدينة / المحافظة'},
    '9vc181mq': {
      'en': 'Enter your city , province',
      'ar': 'أدخل مدينتك، المحافظة',
    },
    '78zbhbzm': {'en': 'Location Detail', 'ar': 'تفاصيل الموقع'},
    'ma84if37': {'en': 'Enter your location detail', 'ar': 'أدخل تفاصيل موقعك'},
    'nibbsl9o': {
      'en': 'Please enter a valid full name',
      'ar': 'الرجاء إدخال اسم كامل صالح',
    },
    'wi3x8hr9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    '3z8i6e7b': {
      'en': 'Please enter phone number',
      'ar': 'الرجاء إدخال رقم الهاتف',
    },
    '82ebfq76': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'il2vswql': {
      'en': 'Please enter a valid password',
      'ar': 'الرجاء إدخال كلمة السر الصحيحة',
    },
    '73x3kw4d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'xbyur62r': {'en': 'Home', 'ar': 'بيت'},
  },
  // order_detail_screen
  {
    'vavzm997': {'en': 'Package Type', 'ar': 'نوع الحزمة'},
    'quluvbok': {'en': 'Enter package type', 'ar': 'أدخل نوع الحزمة'},
    'q2a7003z': {'en': 'Weight', 'ar': 'وزن'},
    't67qa75b': {'en': '0', 'ar': '0'},
    'hqkuthc6': {'en': 'Kg', 'ar': 'كلغ'},
    'mimvq4jx': {'en': 'Dimension', 'ar': 'البعد'},
    'hhh5smlj': {'en': 'Length', 'ar': 'طول'},
    'xy30o6tg': {'en': 'Cm', 'ar': 'سم'},
    'hr2j68i7': {'en': 'Width', 'ar': 'عرض'},
    'hgywwpoh': {'en': 'Cm', 'ar': 'سم'},
    'p89yb2rk': {'en': 'Height', 'ar': 'ارتفاع'},
    'ky4kfsxu': {'en': 'Cm', 'ar': 'سم'},
    'vehicleTypes': {'en': 'Vehicle types', 'ar': 'أنواع المركبات'},
    'selectVehicleTypes': {
      'en': 'Select vehicle type',
      'ar': 'حدد نوع المركبة',
    },
    'sensitivityLevels': {'en': 'Sensitivity levels', 'ar': 'درجات الحساسية'},
    'receivingCode': {'en': 'Receiving Code', 'ar': 'رمز الاستلام'},
    'successfullyRegistered': {
      'en': 'Successfully Registered',
      'ar': 'تم تسجيل الطلب بنجاح',
    },
    'registerOrderDisc': {
      'en':
          'Your order have been registered successfully, Share this code with who you want to receive the package',
      'ar': 'لقد تم تسجيل طلبك بنجاح، شارك هذا الرمز مع من تريد أن يصله الطرد',
    },
    '55257rio': {
      'en':
          'Weight discrepancies will incur additional fees or the goods will be returned',
      'ar':
          'ستؤدي الاختلافات في الوزن إلى فرض رسوم إضافية أو سيتم إرجاع البضائع',
    },
    'ngxdg23y': {'en': 'Home', 'ar': 'بيت'},
  },
  // notifications_screen
  {
    'ip2xy01p': {
      'en': 'Golf Course Alley DC',
      'ar': 'ملعب الجولف زقاق العاصمة',
    },
    'ilowbqqy': {
      'en': 'You get a special promo today!',
      'ar': 'يمكنك الحصول على عرض ترويجي خاص اليوم!',
    },
    'avv3yfso': {'en': '11:05', 'ar': '11:05'},
    'qzg6kice': {'en': 'Credit Card Connected!', 'ar': 'بطاقة الائتمان متصلة!'},
    '1fxat6na': {
      'en': 'Credit card has been linked!',
      'ar': 'لقد تم ربط بطاقة الائتمان!',
    },
    '4f7qp6u2': {'en': '09:02', 'ar': '09:02'},
    'peb8tt6w': {
      'en': 'Account Setup Successful!',
      'ar': 'تم إعداد الحساب بنجاح!',
    },
    'vizyzilr': {
      'en': 'Your account has been created!',
      'ar': 'لقد تم إنشاء حسابك!',
    },
    '8cwe73ze': {'en': '02:30', 'ar': '02:30'},
    'dzrhw9tx': {'en': 'Payment Successful!', 'ar': 'تم الدفع بنجاح!'},
    'qtk0vc95': {
      'en': 'You have made a shipping payment!',
      'ar': 'لقد قمت بدفع رسوم الشحن!',
    },
    'z94s9asn': {'en': '1 day ago', 'ar': '1 منذ يوم'},
    'v2y5e2oj': {'en': 'New Service Available!', 'ar': 'خدمة جديدة متاحة!'},
    '1zkwt4n5': {
      'en': 'Now you can search the Send',
      'ar': 'الآن يمكنك البحث في القطرة القريبة',
    },
    'rcq12qoz': {'en': '1 day ago', 'ar': '1 منذ يوم'},
    'gjyu8buc': {
      'en': 'No Notifications yet!',
      'ar': 'لا توجد إخطارات حتى الآن!',
    },
    't8e659gc': {
      'en': 'No notifications at this moment',
      'ar': 'لا توجد إخطارات في هذه اللحظة',
    },
    'ckyx50yo': {'en': 'Home', 'ar': 'بيت'},
  },
  // wallet_screen
  {
    'rv38xa4k': {'en': 'Your Balance', 'ar': 'رصيدك'},
    'w4fypjgh': {'en': '\$ 16,150.10', 'ar': '16,150.10 دولار'},
    'xi2k3oay': {'en': 'Top Up', 'ar': 'فوق حتى'},
    'q02xk92q': {'en': 'Payment Method', 'ar': 'طريقة الدفع او السداد'},
    'o1hvpsmg': {'en': 'Mastercard', 'ar': 'بطاقة ماستر بطاقة ائتمان'},
    'ii2w44jh': {'en': '4587 4582 1254 ****', 'ar': '4587 4582 1254 ****'},
    'i0qlxeff': {'en': 'Transaction History', 'ar': 'تاريخ المعاملات'},
    'f60ex7qi': {'en': 'Cargo Service', 'ar': 'خدمة الشحن'},
    'w6avy30e': {'en': 'Safe delivery', 'ar': 'التسليم الآمن'},
    'j249cpsa': {'en': '\$20', 'ar': '20 دولارًا'},
    '2ufj4108': {'en': 'Regular Service', 'ar': 'خدمة منتظمة'},
    'f7oy0ikp': {'en': 'Affordable prices', 'ar': 'أسعار معقولة'},
    'yeeq0n6a': {'en': '\$30', 'ar': '30 دولارًا'},
    'hhmdownl': {'en': 'Express Service', 'ar': 'خدمة سريعة'},
    'x0wnvuah': {'en': '2 day - 5 day', 'ar': '2 يوم - 5 يوم'},
    'b1d4ss3u': {'en': '\$50', 'ar': '50 دولارًا'},
    'mp8ceicb': {'en': 'Cargo Service', 'ar': 'خدمة الشحن'},
    '8oyrta3x': {'en': 'Safe delivery', 'ar': 'التسليم الآمن'},
    'ynekzyic': {'en': '\$20', 'ar': '20 دولارًا'},
    '1l2u9389': {'en': 'Regular Service', 'ar': 'خدمة منتظمة'},
    '5ydy7i8p': {'en': 'Affordable prices', 'ar': 'أسعار معقولة'},
    'tmrrq4vn': {'en': '\$30', 'ar': '30 دولارًا'},
    'bv94kilk': {'en': 'Home', 'ar': 'بيت'},
  },
  // top_up_screen
  {
    'wn5l9bd2': {'en': 'Your Balance', 'ar': 'رصيدك'},
    'rzn0gbcx': {'en': '\$ 16,150.10', 'ar': '16,150.10 دولار'},
    '3h9dx52i': {'en': 'Top Up', 'ar': 'فوق حتى'},
    'bxxfre9w': {'en': 'Top up Balance', 'ar': 'تعبئة الرصيد'},
    '3v0uc7xe': {
      'en': 'Select your preferred payment methods',
      'ar': 'اختر طرق الدفع المفضلة لديك',
    },
    'lpb4pjot': {'en': 'Select payment method', 'ar': 'اختار طريقة الدفع'},
    '0ums688x': {'en': 'Home', 'ar': 'بيت'},
  },
  // detail_location_screen
  {
    'g51wgvxj': {'en': 'Detail Location', 'ar': 'الموقع التفصيلي'},
    'q1rj09vv': {'en': 'Your order is on The Way', 'ar': 'طلبك على الطريق'},
    '05gf3f83': {'en': 'Pick up point : ', 'ar': 'نقطة الالتقاط:'},
    'k582o8ff': {'en': 'Ecom Express', 'ar': 'ايكوم اكسبريس'},
    'jo27365b': {'en': 'Fast Shipping', 'ar': 'شحن سريع'},
    'kt1p7s5y': {'en': 'KS45421124', 'ar': 'KS45421124'},
    't1vr2xfg': {'en': 'Track Number', 'ar': 'رقم الشاحنة'},
    't46gqm2i': {'en': '1-3 Hours', 'ar': '1-3 ساعات'},
    'ab8t3ymv': {'en': 'Estimate Time', 'ar': 'الوقت المتوقع'},
    '6n32zoz7': {'en': '5.6 Kg', 'ar': '5.6 كجم'},
    '8updicbl': {'en': 'Package Weight', 'ar': 'وزن الحقيبة، وزن الحمولة'},
    'gyefeu80': {
      'en': '5012 Lakewood gardens Junction',
      'ar': '5012 تقاطع حدائق ليكوود',
    },
    'oa7ui2hm': {
      'en': 'December 10,2023 | 10:00 AM',
      'ar': '10 ديسمبر 2023 | 10:00 ص',
    },
    'i1ra82tl': {'en': '54123 Butternut Pass', 'ar': '54123 ممر الجوز'},
    'n99gbkl4': {'en': 'Waiting', 'ar': 'منتظر'},
    'c2s4rqc2': {
      'en': '45894 Clyde Gallagher Parkway',
      'ar': '45894 كلايد غالاغر باركواي',
    },
    'nj6t655p': {'en': 'December 10,2023', 'ar': '10 ديسمبر 2023'},
    'dvsfx1qy': {
      'en': '856 Messerschmidt Circle DC',
      'ar': '856 دائرة مسرشميت العاصمة',
    },
    '384kebxr': {'en': 'December 10,2023', 'ar': '10 ديسمبر 2023'},
    'uaxpwjae': {'en': 'Home', 'ar': 'بيت'},
  },
  // forgot_password_screen
  {
    'zqke9lp5': {
      'en': 'Please enter your OTP code sent to\nyour phone number ',
      'ar': 'الرجاء إدخال رمز OTP الخاص بك الذي تم إرساله إلى\nرقم تليفونك',
    },
    'bc4y9z5d': {'en': '+62 4864452148', 'ar': '+62 4864452148'},
    's2kqtkyn': {
      'en': 'Please enter a valid pin code',
      'ar': 'الرجاء إدخال رمز سري صالح',
    },
    'b5ojik0x': {'en': '01:20', 'ar': '01:20'},
    'byubjsvd': {'en': 'Didn’t receive the code? ', 'ar': 'لم تتلق الرمز؟'},
    'm0f9no54': {'en': 'Resend', 'ar': 'إعادة إرسال'},
    'v2tw8etd': {'en': 'Home', 'ar': 'بيت'},
  },
  // reset_password_screen
  {
    'sty9xuul': {'en': 'New password', 'ar': 'كلمة المرور الجديدة'},
    '0vmwaj1v': {'en': 'Enter new password', 'ar': 'أدخل كلمة المرور الجديدة'},
    '96lkbzmk': {'en': 'Confirm password', 'ar': 'تأكيد كلمة المرور'},
    'ig9u8cnx': {
      'en': 'Enter confirm password',
      'ar': 'أدخل تأكيد كلمة المرور',
    },
    '0urtm8f8': {
      'en': 'Please enter a valid old password',
      'ar': 'الرجاء إدخال كلمة مرور قديمة صالحة',
    },
    '2reig0gm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'utqobgt1': {
      'en': 'Please enter a valid new password',
      'ar': 'الرجاء إدخال كلمة مرور جديدة صالحة',
    },
    'mpwanxz9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'f98zsah1': {
      'en': 'Please enter a valid confirm password',
      'ar': 'الرجاء إدخال كلمة مرور تأكيد صالحة',
    },
    'kl0642dk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'يرجى اختيار خيار من القائمة المنسدلة',
    },
    'a1bveoss': {'en': 'Home', 'ar': 'بيت'},
  },
  // signup_success_dialog
  {
    'cx1ocjjh': {'en': 'Congratulations!', 'ar': 'تهانينا!'},
    'bsltc3ar': {
      'en':
          'Your account is ready to use.You will be redirected to the home page.',
      'ar': 'حسابك جاهز للاستخدام. سيتم إعادة توجيهك إلى الصفحة الرئيسية.',
    },
  },
  // logout_dialog
  {
    '6bjtny3o': {'en': 'Log Out', 'ar': 'تسجيل خروج'},
    'hknbwv0w': {
      'en': 'Are you sure you want to logout?',
      'ar': 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
    },
    'gc1t4jsv': {'en': 'Cancel', 'ar': 'يلغي'},
    '5p4mlj2u': {'en': 'Log out', 'ar': 'تسجيل خروج'},
  },
  // date_picker_dialog
  {
    '5nwiuevf': {'en': 'Filter Date', 'ar': 'تاريخ التصفية'},
    'w9t88mxe': {'en': 'Cancel', 'ar': 'يلغي'},
    '0dl85rrf': {'en': 'Apply', 'ar': 'يتقدم'},
  },
  // success_topup_dialog
  {
    'aby87h9d': {'en': 'Success Top Up', 'ar': 'النجاح في تعبئة الرصيد'},
    '0dxsfrbw': {
      'en':
          'Congratulation! your balance already added, & please check your balance.',
      'ar': 'تهنئة! تمت إضافة رصيدك بالفعل، ويرجى التحقق من رصيدك.',
    },
  },
  // success_your_order_dialog
  {
    'f8xgb7he': {'en': 'Success Your Order', 'ar': 'نجاح طلبك'},
    'f2kwzcze': {
      'en':
          'You have been successfully order & be patient for coming courier pick-up. ',
      'ar': 'لقد تم الطلب بنجاح وتحلى بالصبر لاستلام البريد السريع.',
    },
  },
  // quincy_courtdc_dialog
  {
    'j2nqcg6o': {'en': 'Quincy Court DC', 'ar': 'كوينسي كورت دي سي'},
    'svshlu5q': {'en': '45894 Schneemann Road', 'ar': '45894 طريق شنيمان'},
    '1wjdr2kp': {
      'en': '09:00 AM - 05:00PM',
      'ar': '09:00 صباحًا - 05:00 مساءً',
    },
    'ab5la4m7': {'en': '3,2 KM from you', 'ar': '3,2 كم منك'},
    'vesw67hu': {'en': 'Direction', 'ar': 'اتجاه'},
    'khwab6m3': {'en': 'Dial', 'ar': 'يتصل'},
  },
  // scan_barcode_success_dialog
  {
    'u411a93c': {'en': 'Scan Barcode Success', 'ar': 'نجاح مسح الباركود'},
    '68znnykb': {
      'en': 'Your code has been\nsuccessfully published.',
      'ar': 'لقد كان الرمز الخاص بك\nتم النشر بنجاح.',
    },
    '3jtdzlkr': {'en': 'HV458792547', 'ar': 'HV458792547'},
    'ro1xlxji': {
      'en': 'Processed at sort facility',
      'ar': 'معالجتها في منشأة الفرز',
    },
    '4yh0rmwv': {'en': '1 Hour', 'ar': '1 ساعة'},
  },
  // check_rates_bottomsheet
  {
    '4ciq4sdr': {
      'en': '1304 Tiffin Ave,\nFindlay',
      'ar': '1304 شارع تيفين،\nفيندلاي',
    },
    '0zxy1rlk': {'en': 'Picked Up', 'ar': 'التقطت'},
    'd2yb2ui8': {
      'en': '1410  Market St,\nCelina',
      'ar': '1410 شارع السوق،\nسيلينا',
    },
    'gdqcblmt': {'en': 'Destionation', 'ar': 'الوجهة'},
    '1m3c5qg7': {'en': 'Cargo Service', 'ar': 'خدمة الشحن'},
    's3od9ias': {'en': 'Safe delivery', 'ar': 'التسليم الآمن'},
    '0rzihla3': {'en': '\$20', 'ar': '20 دولارًا'},
    'fmsk4z6w': {'en': 'Regular Service', 'ar': 'خدمة منتظمة'},
    'yf20x3ck': {'en': 'Affordable prices', 'ar': 'أسعار معقولة'},
    'hjy3fl32': {'en': '\$30', 'ar': '30 دولارًا'},
    'tb2xbz19': {'en': 'Express Service', 'ar': 'خدمة سريعة'},
    'zjgxkdxu': {'en': '2 day - 5 day', 'ar': '2 يوم - 5 يوم'},
    '97gtagn0': {'en': '\$50', 'ar': '50 دولارًا'},
  },
  // nearby_drop_bottomsheet
  {
    '11ykzvcu': {'en': 'Search location', 'ar': 'موقع البحث'},
    '6jhji4de': {
      'en': 'Golf Course Alley DC',
      'ar': 'ملعب الجولف زقاق العاصمة',
    },
    'opo0jnp2': {'en': '4589 Superior Road', 'ar': '4589 طريق سوبيريور'},
    '0qn8uj0f': {'en': '2.5 KM', 'ar': '2.5 كم'},
    'c15lyckr': {'en': 'Pearson Terrace DC', 'ar': 'بيرسون تيراس دي سي'},
    'g1i7oqrg': {'en': '856 Messerschmidt Circle', 'ar': '856 دائرة مسرشميدت'},
    '4ixbr0rk': {'en': '5.1 KM', 'ar': '5.1 كم'},
    'jqclm0i1': {'en': 'Quincy Court DC', 'ar': 'كوينسي كورت دي سي'},
    '2fw5lm2f': {'en': '45894 Schneemann Road', 'ar': '45894 طريق شنيمان'},
    'gpcsl7id': {'en': '1.5 KM', 'ar': '1.5 كم'},
  },
  // order_detail_services_select_bottomsheet
  {
    'xot6okp9': {'en': 'Services', 'ar': 'خدمات'},
    'jpdj7v2s': {'en': 'Cargo Service', 'ar': 'خدمة الشحن'},
    'm2yg1zds': {'en': 'Safe delivery', 'ar': 'التسليم الآمن'},
    'kcxtl49g': {'en': '\$20', 'ar': '20 دولارًا'},
    'ykk8e8yq': {'en': 'Regular Service', 'ar': 'خدمة منتظمة'},
    'wjvstvcg': {'en': 'Affordable prices', 'ar': 'أسعار معقولة'},
    'td6kur5s': {'en': '\$30', 'ar': '30 دولارًا'},
    'oslf7qqz': {'en': 'Express Service', 'ar': 'خدمة سريعة'},
    'img1sl6w': {'en': '2 day - 5 day', 'ar': '2 يوم - 5 يوم'},
    'z40y6a3b': {'en': '\$50', 'ar': '50 دولارًا'},
  },
  // payment_method_bottomsheet
  {
    'shaf55q7': {'en': 'Payment Method', 'ar': 'طريقة الدفع او السداد'},
    'zklkf4we': {'en': 'Cash Payment', 'ar': 'دفع نقدا'},
    't1e9ytbx': {'en': '\$4.586.00', 'ar': '4.586.00 دولار'},
    'fg5hi8ph': {'en': 'Mastercard', 'ar': 'بطاقة ماستر بطاقة ائتمان'},
    'o9xv0ajs': {'en': '4587 4582 1254 ****', 'ar': '4587 4582 1254 ****'},
  },
  // topup_payment_method_bottomsheet
  {
    't0c4tfi2': {'en': 'Payment Method', 'ar': 'طريقة الدفع او السداد'},
    'uegf956y': {'en': 'Mastercard', 'ar': 'بطاقة ماستر بطاقة ائتمان'},
    '8he8iprv': {'en': '4587 4582 1254 ****', 'ar': '4587 4582 1254 ****'},
    'xbcayqv8': {'en': 'Add New Payment Method', 'ar': 'إضافة طريقة دفع جديدة'},
  },
  // no_order_yet_container
  {
    'ib5bqs6p': {'en': 'No Order yet!', 'ar': 'لا يوجد أمر حتى الآن!'},
    'v58hc1ql': {
      'en': 'Add items to your order list',
      'ar': 'أضف عناصر إلى قائمة الطلبات الخاصة بك',
    },
  },
  // no_notifications_yet_cintainer
  {
    'fv85luca': {
      'en': 'No Notifications yet!',
      'ar': 'لا توجد إخطارات حتى الآن!',
    },
    'euiu6udb': {
      'en': 'No notifications at this moment',
      'ar': 'لا توجد إخطارات في هذه اللحظة',
    },
  },
  // no_message_yet_container
  {
    'lvjf108a': {'en': 'No Message yet!', 'ar': 'لا توجد رسالة بعد!'},
    'mtllte6n': {
      'en': 'Connect with friends & start messaging',
      'ar': 'تواصل مع الأصدقاء وابدأ المراسلة',
    },
  },
  // reset_password_dialog
  {
    'kwbks445': {
      'en': 'Password reset successfully',
      'ar': 'تم إعادة تعيين كلمة المرور بنجاح',
    },
    '86069hlw': {
      'en':
          'Your password has been changed successfully use your new password to login',
      'ar':
          'لقد تم تغيير كلمة المرور الخاصة بك بنجاح، استخدم كلمة المرور الجديدة لتسجيل الدخول',
    },
  },
  // exit_dialog
  {
    '110o1u4x': {'en': 'Exit', 'ar': 'مخرج'},
    'q18vloew': {
      'en': 'Are you sure you want to exit?',
      'ar': 'هل أنت متأكد أنك تريد الخروج؟',
    },
    '9a4beb1l': {'en': 'No', 'ar': 'لا'},
    '3oa474p9': {'en': 'Yes', 'ar': 'نعم'},
  },
].reduce((a, b) => a..addAll(b));
