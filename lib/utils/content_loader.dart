class ContentLoader {
  const ContentLoader._();

  static String loadIcon(String name) => "assets/icons/$name";

  static String loadContent(String name) => "assets/contents/$name";

  static String loadFont(String name) => "assets/fonts/$name";

  static String loadImage(String name) => "assets/images/$name";

  static String loadSvg(String path) => loadIcon(path);

  static String loadSvgIcon(String name) => loadIcon("$name.svg");

  static String loadPngIcon(String name) => loadIcon("$name.png");

  static String loadJpgIcon(String name) => loadIcon("$name.jpg");

  static String loadSvgImage(String name) => loadImage("$name.svg");

  static String loadPngImage(String name) => loadImage("$name.png");

  static String loadJpgImage(String name) => loadImage("$name.jpg");
}
