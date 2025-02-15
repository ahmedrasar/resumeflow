import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'resumeflow_localizations_ar.dart';
import 'resumeflow_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ResumeflowLocalizations
/// returned by `ResumeflowLocalizations.of(context)`.
///
/// Applications need to include `ResumeflowLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/resumeflow_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ResumeflowLocalizations.localizationsDelegates,
///   supportedLocales: ResumeflowLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ResumeflowLocalizations.supportedLocales
/// property.
abstract class ResumeflowLocalizations {
  ResumeflowLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ResumeflowLocalizations of(BuildContext context) {
    return Localizations.of<ResumeflowLocalizations>(context, ResumeflowLocalizations)!;
  }

  static const LocalizationsDelegate<ResumeflowLocalizations> delegate = _ResumeflowLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
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
  /// **'ResumeFlow'**
  String get appName;

  /// No description provided for @showcaseScreenHeaderSeg1.
  ///
  /// In en, this message translates to:
  /// **'Build Your Resume'**
  String get showcaseScreenHeaderSeg1;

  /// No description provided for @showcaseScreenHeaderSeg2.
  ///
  /// In en, this message translates to:
  /// **'With AI'**
  String get showcaseScreenHeaderSeg2;

  /// No description provided for @showcaseScreenBody.
  ///
  /// In en, this message translates to:
  /// **'Effortlessly Craft a Professional Resume with Our AI-Powered Builder'**
  String get showcaseScreenBody;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How It Works?'**
  String get howItWorks;

  /// No description provided for @generateInSimpleSteps.
  ///
  /// In en, this message translates to:
  /// **'Generate Well-Crafted Resume in Simple Steps!'**
  String get generateInSimpleSteps;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @createCard.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Template'**
  String get createCard;

  /// No description provided for @createCardBody.
  ///
  /// In en, this message translates to:
  /// **'Start by selecting the color scheme for your resume template. Our single, professionally designed template ensures a clean and consistent look for all users.'**
  String get createCardBody;

  /// No description provided for @updateCard.
  ///
  /// In en, this message translates to:
  /// **'Update Your Information'**
  String get updateCard;

  /// No description provided for @updateCardBody.
  ///
  /// In en, this message translates to:
  /// **'Enter your personal details, work experience, education, and skills into the provided form. Our AI assists you in filling out each section accurately and effectively.'**
  String get updateCardBody;

  /// No description provided for @shareCard.
  ///
  /// In en, this message translates to:
  /// **'Share Your Resume'**
  String get shareCard;

  /// No description provided for @shareCardBody.
  ///
  /// In en, this message translates to:
  /// **'After completing your resume, save it securely and generate a shareable link. Easily update your information anytime and share the link with potential employers or download it in a preferred format.'**
  String get shareCardBody;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'Follow System Language'**
  String get systemLanguage;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'Follow System Theme'**
  String get systemTheme;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightTheme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @resume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resume;

  /// No description provided for @coverLetter.
  ///
  /// In en, this message translates to:
  /// **'Cover Letter'**
  String get coverLetter;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// No description provided for @jobPost.
  ///
  /// In en, this message translates to:
  /// **'Job Post'**
  String get jobPost;

  /// No description provided for @applicantName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get applicantName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @telephone.
  ///
  /// In en, this message translates to:
  /// **'Telephone'**
  String get telephone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @applicantDegree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get applicantDegree;

  /// No description provided for @applicantTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get applicantTitle;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @generatedCoverLetter.
  ///
  /// In en, this message translates to:
  /// **'Your Generated Cover Letter'**
  String get generatedCoverLetter;

  /// No description provided for @empytFieldError.
  ///
  /// In en, this message translates to:
  /// **'Field can not be empty'**
  String get empytFieldError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server-side error happend (code: {code})'**
  String serverError(int code);

  /// No description provided for @createCoverLetter.
  ///
  /// In en, this message translates to:
  /// **'Create Cover Letter'**
  String get createCoverLetter;

  /// No description provided for @companyNameTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter the full name of the recipient (e.g., hiring manager or recruiter).'**
  String get companyNameTooltip;

  /// No description provided for @jobPostTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter the job post that you want to apply to.'**
  String get jobPostTooltip;

  /// No description provided for @applicantNameTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide your full name as it appears on official documents.'**
  String get applicantNameTooltip;

  /// No description provided for @addressTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter your complete residential address, including city and postal code.'**
  String get addressTooltip;

  /// No description provided for @telephoneTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide your active phone number for communication purposes.'**
  String get telephoneTooltip;

  /// No description provided for @emailTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address where you can be reached.'**
  String get emailTooltip;

  /// No description provided for @applicantDegreeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Mention the highest degree or qualification you\'ve obtained (e.g., Bachelor\'s in Computer Science).'**
  String get applicantDegreeTooltip;

  /// No description provided for @applicantTitleTooltip.
  ///
  /// In en, this message translates to:
  /// **'State your current job  or professional designation (e.g., Project Manager).'**
  String get applicantTitleTooltip;

  /// No description provided for @experienceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Summarize your relevant work experience, including years in the field.'**
  String get experienceTooltip;

  /// No description provided for @skillsTooltip.
  ///
  /// In en, this message translates to:
  /// **'List the key skills that make you suitable for the role (e.g., JavaScript, problem-solving, leadership).'**
  String get skillsTooltip;

  /// No description provided for @exportToDocx.
  ///
  /// In en, this message translates to:
  /// **'Export to DOCX'**
  String get exportToDocx;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @chooseDownloadDir.
  ///
  /// In en, this message translates to:
  /// **'Choose download directory'**
  String get chooseDownloadDir;

  /// No description provided for @aiModel.
  ///
  /// In en, this message translates to:
  /// **'AI Generation'**
  String get aiModel;

  /// No description provided for @serverAiModel.
  ///
  /// In en, this message translates to:
  /// **'Server-Side'**
  String get serverAiModel;

  /// No description provided for @clientAiModel.
  ///
  /// In en, this message translates to:
  /// **'Client-Side'**
  String get clientAiModel;
}

class _ResumeflowLocalizationsDelegate extends LocalizationsDelegate<ResumeflowLocalizations> {
  const _ResumeflowLocalizationsDelegate();

  @override
  Future<ResumeflowLocalizations> load(Locale locale) {
    return SynchronousFuture<ResumeflowLocalizations>(lookupResumeflowLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ResumeflowLocalizationsDelegate old) => false;
}

ResumeflowLocalizations lookupResumeflowLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return ResumeflowLocalizationsAr();
    case 'en': return ResumeflowLocalizationsEn();
  }

  throw FlutterError(
    'ResumeflowLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
