class AppImages {
  AppImages._();
  static const String logo = 'assets/images/logo_light.png';
  static const String logoDark = 'assets/images/logo_dark.png';
  static const String onboarding1 = 'assets/images/onboarding1.png';
  static const String onboarding2 = 'assets/images/onboarding2.png';
  static const String onboarding3 = 'assets/images/onboarding3.png';
  static const String onboarding4 = 'assets/images/onboarding4.png';
  static const List<String> onBoardingSlides = [
    onboarding1,
    onboarding2,
    onboarding3,
    onboarding4,
  ];
  static const List<String> maleAvatars = [
    "assets/images/male0.png",
    "assets/images/male1.png",
    "assets/images/male2.png",
  ];
  static const List<String> femaleAvatars = [
    "assets/images/female0.png",
    "assets/images/female1.png",
    "assets/images/female2.png",
  ];
  static const Map<String, List<String>> avatars = {
    'male': maleAvatars,
    'female': femaleAvatars,
  };
}
