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
  ResumeflowLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ResumeflowLocalizations of(BuildContext context) {
    return Localizations.of<ResumeflowLocalizations>(
      context,
      ResumeflowLocalizations,
    )!;
  }

  static const LocalizationsDelegate<ResumeflowLocalizations> delegate =
      _ResumeflowLocalizationsDelegate();

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
    Locale('en'),
  ];

  /// No description provided for @nativeName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get nativeName;

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

  /// No description provided for @generatedResume.
  ///
  /// In en, this message translates to:
  /// **'Your Generated Cover Letter'**
  String get generatedResume;

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

  /// No description provided for @createResume.
  ///
  /// In en, this message translates to:
  /// **'Create Resume'**
  String get createResume;

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

  /// No description provided for @companyNameExample.
  ///
  /// In en, this message translates to:
  /// **'Google Inc.'**
  String get companyNameExample;

  /// No description provided for @jobPostExample.
  ///
  /// In en, this message translates to:
  /// **'Seeking a skilled Web Developer to join our dynamic team.\nThe ideal candidate will have expertise in HTML5, CSS3, JavaScript, and modern frameworks (React/Vue/Angular).\nMust be proficient in responsive design, version control (Git), and REST APIs.\nExperience with Node.js and database management is a plus. Will collaborate with cross-functional teams to develop and maintain web applications.\nStrong problem-solving abilities and commitment to clean, efficient code required. 3+ years experience preferred.'**
  String get jobPostExample;

  /// No description provided for @applicantNameExample.
  ///
  /// In en, this message translates to:
  /// **'John Smith'**
  String get applicantNameExample;

  /// No description provided for @addressExample.
  ///
  /// In en, this message translates to:
  /// **'123 Main Street, New York, NY 10001'**
  String get addressExample;

  /// No description provided for @telephoneExample.
  ///
  /// In en, this message translates to:
  /// **'+1 (555) 123-4567'**
  String get telephoneExample;

  /// No description provided for @emailExample.
  ///
  /// In en, this message translates to:
  /// **'john.smith@email.com'**
  String get emailExample;

  /// No description provided for @applicantDegreeExample.
  ///
  /// In en, this message translates to:
  /// **'Master\'s in Computer Science'**
  String get applicantDegreeExample;

  /// No description provided for @applicantTitleExample.
  ///
  /// In en, this message translates to:
  /// **'Full Stack Developer'**
  String get applicantTitleExample;

  /// No description provided for @experienceExample.
  ///
  /// In en, this message translates to:
  /// **'- 5 years of full-stack development at major tech companies\n- Led team of 6 developers on enterprise cloud projects\n- Implemented CI/CD pipelines reducing deployment time by 40%'**
  String get experienceExample;

  /// No description provided for @skillsExample.
  ///
  /// In en, this message translates to:
  /// **'- JavaScript, TypeScript, React, Node.js, Python\n- Database design, API development, Cloud infrastructure (AWS)\n- Agile methodologies, Team leadership, Technical documentation'**
  String get skillsExample;

  /// No description provided for @exportToDocx.
  ///
  /// In en, this message translates to:
  /// **'Export to DOCX'**
  String get exportToDocx;

  /// No description provided for @exportToPdf.
  ///
  /// In en, this message translates to:
  /// **'Export to PDF'**
  String get exportToPdf;

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
  /// **'AI Model'**
  String get aiModel;

  /// No description provided for @genAiUnkownError.
  ///
  /// In en, this message translates to:
  /// **'Unkown error with generative AI.'**
  String get genAiUnkownError;

  /// No description provided for @docxUtilFailedToGenerate.
  ///
  /// In en, this message translates to:
  /// **'Failed to generate docx document.'**
  String get docxUtilFailedToGenerate;

  /// No description provided for @resetSettings.
  ///
  /// In en, this message translates to:
  /// **'Reset all Settings'**
  String get resetSettings;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @institution.
  ///
  /// In en, this message translates to:
  /// **'Institution'**
  String get institution;

  /// No description provided for @startDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// No description provided for @endDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// No description provided for @grade.
  ///
  /// In en, this message translates to:
  /// **'Grade'**
  String get grade;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @degree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get degree;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @programmingLanguages.
  ///
  /// In en, this message translates to:
  /// **'Programming Languages'**
  String get programmingLanguages;

  /// No description provided for @programmingLanguagesTooltip.
  ///
  /// In en, this message translates to:
  /// **'List the programming languages you are proficient in (e.g., Python, Java, C++).'**
  String get programmingLanguagesTooltip;

  /// No description provided for @programmingLanguagesExample.
  ///
  /// In en, this message translates to:
  /// **'Python, JavaScript, Java, C++, Dart'**
  String get programmingLanguagesExample;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @toolsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Mention the software tools, frameworks, or platforms you are experienced with (e.g., Git, Docker, React).'**
  String get toolsTooltip;

  /// No description provided for @toolsExample.
  ///
  /// In en, this message translates to:
  /// **'Git, Docker, React, Flutter, VS Code, Figma'**
  String get toolsExample;

  /// No description provided for @otherSkills.
  ///
  /// In en, this message translates to:
  /// **'Other Skills'**
  String get otherSkills;

  /// No description provided for @otherSkillsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Include additional technical or domain-specific skills relevant to the job.'**
  String get otherSkillsTooltip;

  /// No description provided for @otherSkillsExample.
  ///
  /// In en, this message translates to:
  /// **'SEO optimization, Data analysis, Cloud deployment'**
  String get otherSkillsExample;

  /// No description provided for @softSkills.
  ///
  /// In en, this message translates to:
  /// **'Soft Skills'**
  String get softSkills;

  /// No description provided for @softSkillsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Highlight your interpersonal and organizational skills (e.g., teamwork, communication, adaptability).'**
  String get softSkillsTooltip;

  /// No description provided for @softSkillsExample.
  ///
  /// In en, this message translates to:
  /// **'Teamwork, Communication, Problem-solving, Adaptability, Time management'**
  String get softSkillsExample;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @resumePreview.
  ///
  /// In en, this message translates to:
  /// **'Resume Preview'**
  String get resumePreview;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @achievementsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Highlight your notable achievements, awards, or recognitions relevant to your career.'**
  String get achievementsTooltip;

  /// No description provided for @achievementsExample.
  ///
  /// In en, this message translates to:
  /// **'- Employee of the Month, Google Inc. (2022)\n- Published research paper in IEEE Journal\n- Led team to win Hackathon 2023'**
  String get achievementsExample;

  /// No description provided for @github.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get github;

  /// No description provided for @githubTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide the URL to your GitHub profile showcasing your projects and contributions.'**
  String get githubTooltip;

  /// No description provided for @githubExample.
  ///
  /// In en, this message translates to:
  /// **'https://github.com/johnsmith'**
  String get githubExample;

  /// No description provided for @linkedin.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedin;

  /// No description provided for @linkedinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide the URL to your LinkedIn profile for professional networking.'**
  String get linkedinTooltip;

  /// No description provided for @linkedinExample.
  ///
  /// In en, this message translates to:
  /// **'https://linkedin.com/in/johnsmith'**
  String get linkedinExample;

  /// No description provided for @degreeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Specify the degree or qualification obtained at this institution (e.g., Bachelor of Science in Engineering).'**
  String get degreeTooltip;

  /// No description provided for @degreeExample.
  ///
  /// In en, this message translates to:
  /// **'Bachelor of Science in Computer Engineering'**
  String get degreeExample;

  /// No description provided for @institutionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter the full name of the educational institution attended.'**
  String get institutionTooltip;

  /// No description provided for @institutionExample.
  ///
  /// In en, this message translates to:
  /// **'Massachusetts Institute of Technology'**
  String get institutionExample;

  /// No description provided for @locationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Provide the city and country where the institution is located.'**
  String get locationTooltip;

  /// No description provided for @locationExample.
  ///
  /// In en, this message translates to:
  /// **'Cambridge, MA, USA'**
  String get locationExample;

  /// No description provided for @startDateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Indicate the month and year you started your studies.'**
  String get startDateTooltip;

  /// No description provided for @startDateExample.
  ///
  /// In en, this message translates to:
  /// **'September 2018'**
  String get startDateExample;

  /// No description provided for @endDateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Indicate the month and year you completed or expect to complete your studies.'**
  String get endDateTooltip;

  /// No description provided for @endDateExample.
  ///
  /// In en, this message translates to:
  /// **'June 2022'**
  String get endDateExample;

  /// No description provided for @gradeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Mention your final grade, GPA, or classification if applicable.'**
  String get gradeTooltip;

  /// No description provided for @gradeExample.
  ///
  /// In en, this message translates to:
  /// **'GPA: 3.9/4.0'**
  String get gradeExample;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @projectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get projectName;

  /// No description provided for @projectNameTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter the name of the project you worked on.'**
  String get projectNameTooltip;

  /// No description provided for @projectNameExample.
  ///
  /// In en, this message translates to:
  /// **'AI Resume Builder'**
  String get projectNameExample;

  /// No description provided for @projectDescription.
  ///
  /// In en, this message translates to:
  /// **'Project Description'**
  String get projectDescription;

  /// No description provided for @projectDescriptionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Briefly describe the project, its goals, and your contributions.'**
  String get projectDescriptionTooltip;

  /// No description provided for @projectDescriptionExample.
  ///
  /// In en, this message translates to:
  /// **'Developed an AI-powered web application to help users generate professional resumes automatically. Led a team of 4, integrated GPT-based suggestions, and deployed to AWS.'**
  String get projectDescriptionExample;
}

class _ResumeflowLocalizationsDelegate
    extends LocalizationsDelegate<ResumeflowLocalizations> {
  const _ResumeflowLocalizationsDelegate();

  @override
  Future<ResumeflowLocalizations> load(Locale locale) {
    return SynchronousFuture<ResumeflowLocalizations>(
      lookupResumeflowLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ResumeflowLocalizationsDelegate old) => false;
}

ResumeflowLocalizations lookupResumeflowLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return ResumeflowLocalizationsAr();
    case 'en':
      return ResumeflowLocalizationsEn();
  }

  throw FlutterError(
    'ResumeflowLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
