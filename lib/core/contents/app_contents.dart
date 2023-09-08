class AppContents {
  const AppContents._();

  /// ICON's
  static final String icBehance = "ic_behance.svg".fromIcons;
  static final String icDribble = "ic_dribble.svg".fromIcons;
  static final String icFacebook = "ic_facebook.svg".fromIcons;
  static final String icInstagram = "ic_instagram_regular.svg".fromIcons;
  static final String icLinkedin = "ic_linkedin.svg".fromIcons;
}

extension StringExtension on String {
  String get fromContents => "assets/contents/$this";

  String get fromIcons => "assets/icons/$this";

  String get fromImages => "assets/images/$this";

  String get fromSvg => "assets/svg/$this";
}
