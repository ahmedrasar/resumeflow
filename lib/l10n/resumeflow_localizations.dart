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

  /// No description provided for @startScreenHeaderSeg1.
  ///
  /// In en, this message translates to:
  /// **'Build Your Resume'**
  String get startScreenHeaderSeg1;

  /// No description provided for @startScreenHeaderSeg2.
  ///
  /// In en, this message translates to:
  /// **'With AI'**
  String get startScreenHeaderSeg2;

  /// No description provided for @startScreenHeaderBody.
  ///
  /// In en, this message translates to:
  /// **'Effortlessly Craft a Professional Resume with Our AI-Powered Builder'**
  String get startScreenHeaderBody;

  /// No description provided for @getStartedButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStartedButtonTitle;

  /// No description provided for @learnMoreButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMoreButtonTitle;

  /// No description provided for @howItWorksHeader.
  ///
  /// In en, this message translates to:
  /// **'How It Works?'**
  String get howItWorksHeader;

  /// No description provided for @howItWorksBody.
  ///
  /// In en, this message translates to:
  /// **'Generate resume in just simple steps'**
  String get howItWorksBody;

  /// No description provided for @loginButtonTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButtonTitle;

  /// No description provided for @createCardHeader.
  ///
  /// In en, this message translates to:
  /// **'Create Your Template'**
  String get createCardHeader;

  /// No description provided for @createCardBody.
  ///
  /// In en, this message translates to:
  /// **'Start by selecting the color scheme for your resume template. Our single, professionally designed template ensures a clean and consistent look for all users.'**
  String get createCardBody;

  /// No description provided for @updateCardHeader.
  ///
  /// In en, this message translates to:
  /// **'Update Your Information'**
  String get updateCardHeader;

  /// No description provided for @updateCardBody.
  ///
  /// In en, this message translates to:
  /// **'Enter your personal details, work experience, education, and skills into the provided form. Our AI assists you in filling out each section accurately and effectively.'**
  String get updateCardBody;

  /// No description provided for @shareCardHeader.
  ///
  /// In en, this message translates to:
  /// **'Share Your Resume'**
  String get shareCardHeader;

  /// No description provided for @shareCardBody.
  ///
  /// In en, this message translates to:
  /// **'After completing your resume, save it securely and generate a shareable link. Easily update your information anytime and share the link with potential employers or download it in a preferred format.'**
  String get shareCardBody;

  /// No description provided for @languageText.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageText;

  /// No description provided for @systemLangText.
  ///
  /// In en, this message translates to:
  /// **'Follow System Language'**
  String get systemLangText;

  /// No description provided for @systemThemeText.
  ///
  /// In en, this message translates to:
  /// **'Follow System Theme'**
  String get systemThemeText;

  /// No description provided for @themeBtnText.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeBtnText;

  /// No description provided for @lightThemeText.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightThemeText;

  /// No description provided for @darkThemeText.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkThemeText;

  /// No description provided for @resumeText.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resumeText;

  /// No description provided for @coverLetterText.
  ///
  /// In en, this message translates to:
  /// **'Cover letter'**
  String get coverLetterText;

  /// No description provided for @settingsText.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsText;

  /// No description provided for @recipientName.
  ///
  /// In en, this message translates to:
  /// **'Recipient Name'**
  String get recipientName;

  /// No description provided for @recipientJobPost.
  ///
  /// In en, this message translates to:
  /// **'Recipient Job Post'**
  String get recipientJobPost;

  /// No description provided for @applicantName.
  ///
  /// In en, this message translates to:
  /// **'Applicant Name'**
  String get applicantName;

  /// No description provided for @applicantAddress.
  ///
  /// In en, this message translates to:
  /// **'Applicant Address'**
  String get applicantAddress;

  /// No description provided for @applicantTelephone.
  ///
  /// In en, this message translates to:
  /// **'Applicant Telephone'**
  String get applicantTelephone;

  /// No description provided for @applicantEmail.
  ///
  /// In en, this message translates to:
  /// **'Applicant Email'**
  String get applicantEmail;

  /// No description provided for @applicantDegree.
  ///
  /// In en, this message translates to:
  /// **'Applicant Degree'**
  String get applicantDegree;

  /// No description provided for @applicantTitle.
  ///
  /// In en, this message translates to:
  /// **'Applicant Title'**
  String get applicantTitle;

  /// No description provided for @applicantExperience.
  ///
  /// In en, this message translates to:
  /// **'Applicant Experience'**
  String get applicantExperience;

  /// No description provided for @applicantSkills.
  ///
  /// In en, this message translates to:
  /// **'Applicant Skills'**
  String get applicantSkills;

  /// No description provided for @generatedBody.
  ///
  /// In en, this message translates to:
  /// **'Generated Body'**
  String get generatedBody;

  /// No description provided for @empytFieldError.
  ///
  /// In en, this message translates to:
  /// **'Field can not be empty'**
  String get empytFieldError;

  /// No description provided for @createCoverLetterBtn.
  ///
  /// In en, this message translates to:
  /// **'Create Cover letter'**
  String get createCoverLetterBtn;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Unexpected error happend'**
  String get errorMessage;

  /// No description provided for @createCoverLetter.
  ///
  /// In en, this message translates to:
  /// **'Create Cover Letter'**
  String get createCoverLetter;

  /// No description provided for @recipientNameTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter the full name of the recipient (e.g., hiring manager or recruiter).'**
  String get recipientNameTooltip;

  /// No description provided for @recipientJobPostTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter the job post that you want to apply to.'**
  String get recipientJobPostTooltip;

  /// No description provided for @applicantNameTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide your full name as it appears on official documents.'**
  String get applicantNameTooltip;

  /// No description provided for @applicantAddressTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter your complete residential address, including city and postal code.'**
  String get applicantAddressTooltip;

  /// No description provided for @applicantTelephoneTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide your active phone number for communication purposes.'**
  String get applicantTelephoneTooltip;

  /// No description provided for @applicantEmailTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address where you can be reached.'**
  String get applicantEmailTooltip;

  /// No description provided for @applicantDegreeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Mention the highest degree or qualification you\'ve obtained (e.g., Bachelor\'s in Computer Science).'**
  String get applicantDegreeTooltip;

  /// No description provided for @applicantTitleTooltip.
  ///
  /// In en, this message translates to:
  /// **'State your current job title or professional designation (e.g., Project Manager).'**
  String get applicantTitleTooltip;

  /// No description provided for @applicantExperienceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Summarize your relevant work experience, including years in the field.'**
  String get applicantExperienceTooltip;

  /// No description provided for @applicantSkillsTooltip.
  ///
  /// In en, this message translates to:
  /// **'List the key skills that make you suitable for the role (e.g., JavaScript, problem-solving, leadership).'**
  String get applicantSkillsTooltip;

  /// No description provided for @exportToDocx.
  ///
  /// In en, this message translates to:
  /// **'Export to DOCX'**
  String get exportToDocx;

  /// No description provided for @closeBtn.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeBtn;

  /// No description provided for @copyBtn.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyBtn;

  /// No description provided for @chooseDownloadDir.
  ///
  /// In en, this message translates to:
  /// **'Choose download directory'**
  String get chooseDownloadDir;
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
