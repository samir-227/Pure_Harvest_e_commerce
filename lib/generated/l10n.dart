// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to the `
  String get welcomeTitle {
    return Intl.message(
      'Welcome to the ',
      name: 'welcomeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get welcomeTitle2 {
    return Intl.message(
      'Search and Shop',
      name: 'welcomeTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh and high-quality fruits and get the best deals and top quality.`
  String get subtitle1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide range of fresh and high-quality fruits and get the best deals and top quality.',
      name: 'subtitle1',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the best carefully selected fruits. Check out the details, images, and reviews to ensure you choose the perfect fruit.`
  String get subtitle2 {
    return Intl.message(
      'We offer you the best carefully selected fruits. Check out the details, images, and reviews to ensure you choose the perfect fruit.',
      name: 'subtitle2',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get buttonText {
    return Intl.message('Get Started', name: 'buttonText', desc: '', args: []);
  }

  /// `Login`
  String get appBarLoginTitle {
    return Intl.message('Login', name: 'appBarLoginTitle', desc: '', args: []);
  }

  /// `Sign Up`
  String get appBarRegisterTitle {
    return Intl.message(
      'Sign Up',
      name: 'appBarRegisterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `You have an account?`
  String get doYouHaveAccount {
    return Intl.message(
      'You have an account?',
      name: 'doYouHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get register {
    return Intl.message('Sign Up', name: 'register', desc: '', args: []);
  }

  /// `Login with Google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with Google',
      name: 'loginWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get loginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get loginWithFacebook {
    return Intl.message(
      'Login with Facebook',
      name: 'loginWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get orDividerText {
    return Intl.message('Or', name: 'orDividerText', desc: '', args: []);
  }

  /// `Full Name`
  String get fullname {
    return Intl.message('Full Name', name: 'fullname', desc: '', args: []);
  }

  /// `Create new account`
  String get createNewAccount {
    return Intl.message(
      'Create new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to `
  String get TermsAndConditions {
    return Intl.message(
      'By creating an account, you agree to ',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions of use`
  String get Policy {
    return Intl.message(
      'Terms and Conditions of use',
      name: 'Policy',
      desc: '',
      args: [],
    );
  }

  /// `Please accept terms and conditions`
  String get PleaseAcceptTermsAndConditions {
    return Intl.message(
      'Please accept terms and conditions',
      name: 'PleaseAcceptTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `User not verified`
  String get UserNotVerified {
    return Intl.message(
      'User not verified',
      name: 'UserNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `Email not verified please verify your email`
  String get EmailNotVerified {
    return Intl.message(
      'Email not verified please verify your email',
      name: 'EmailNotVerified',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get GoodMorning {
    return Intl.message(
      'Good Morning',
      name: 'GoodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get GoodAfternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'GoodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Search about...`
  String get searchBarHintText {
    return Intl.message(
      'Search about...',
      name: 'searchBarHintText',
      desc: '',
      args: [],
    );
  }

  /// `Best Seller`
  String get bestSeller {
    return Intl.message('Best Seller', name: 'bestSeller', desc: '', args: []);
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `Cart`
  String get theCart {
    return Intl.message('Cart', name: 'theCart', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Products`
  String get products {
    return Intl.message('Products', name: 'products', desc: '', args: []);
  }

  /// `Our Products`
  String get ourProducts {
    return Intl.message(
      'Our Products',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get bestSelling {
    return Intl.message(
      'Best Selling',
      name: 'bestSelling',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message('Result', name: 'result', desc: '', args: []);
  }

  /// `Watermelon`
  String get watermelon {
    return Intl.message('Watermelon', name: 'watermelon', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
