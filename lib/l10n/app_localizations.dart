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
/// import 'l10n/app_localizations.dart';
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
    Locale('en'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @lite.
  ///
  /// In en, this message translates to:
  /// **'Lite'**
  String get lite;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome back.'**
  String get welcome;

  /// No description provided for @welcomeSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Your everyday favorites are waiting.'**
  String get welcomeSubTitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email address.'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'hello@example.com'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'••••••••'**
  String get passwordHint;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get login;

  /// No description provided for @continueWith.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get continueWith;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @newToShopLite.
  ///
  /// In en, this message translates to:
  /// **'New to ShopLite?'**
  String get newToShopLite;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an account'**
  String get createAnAccount;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @makeYour.
  ///
  /// In en, this message translates to:
  /// **'Make yourself at home.'**
  String get makeYour;

  /// No description provided for @makeYourSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Good finds start with a simple sign-up.'**
  String get makeYourSubTitle;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fullName;

  /// No description provided for @policy.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agree to our Terms of Service and Privacy Policy.'**
  String get policy;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPassword;

  /// No description provided for @forgotPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'No worries. Enter the email linked to your account and we’ll send you a reset link.'**
  String get forgotPasswordSubTitle;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your inbox and spam folder after sending.'**
  String get checkYourEmail;

  /// No description provided for @backToLogIn.
  ///
  /// In en, this message translates to:
  /// **'Back to log in'**
  String get backToLogIn;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get sendResetLink;

  /// No description provided for @shopLite.
  ///
  /// In en, this message translates to:
  /// **'ShopLite'**
  String get shopLite;

  /// No description provided for @everyday.
  ///
  /// In en, this message translates to:
  /// **'Everyday, upgraded.'**
  String get everyday;

  /// No description provided for @lessSearching.
  ///
  /// In en, this message translates to:
  /// **'Less searching. More good finds.'**
  String get lessSearching;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get searchProducts;

  /// No description provided for @featuredFinds.
  ///
  /// In en, this message translates to:
  /// **'Featured finds'**
  String get featuredFinds;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @exploreTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore product'**
  String get exploreTitle;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @wishlistTitle.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist'**
  String get wishlistTitle;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @cartTitle.
  ///
  /// In en, this message translates to:
  /// **'Shopping cart'**
  String get cartTitle;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'products'**
  String get products;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort & filter'**
  String get sort;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search products'**
  String get search;

  /// No description provided for @savedFav.
  ///
  /// In en, this message translates to:
  /// **'saved favorites'**
  String get savedFav;

  /// No description provided for @savedFavSubTitle.
  ///
  /// In en, this message translates to:
  /// **'A little inspiration for later.'**
  String get savedFavSubTitle;

  /// No description provided for @itemsInYourCart.
  ///
  /// In en, this message translates to:
  /// **'items in your cart'**
  String get itemsInYourCart;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCart;

  /// No description provided for @subTotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subTotal;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @tax.
  ///
  /// In en, this message translates to:
  /// **'Tax (8%)'**
  String get tax;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @continueToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Continue to checkout'**
  String get continueToCheckout;

  /// No description provided for @secure.
  ///
  /// In en, this message translates to:
  /// **'Secure checkout. No hidden fees.'**
  String get secure;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'items'**
  String get items;
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
    'that was used.',
  );
}
