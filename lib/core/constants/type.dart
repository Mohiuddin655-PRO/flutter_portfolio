import 'package:flutter_andomie/core.dart';

enum ScreenType {
  main(title: "Main", route: "/"),
  about(title: "About", route: "about"),
  projects(title: "Projects", route: "projects"),
  services(title: "Services", route: "services"),
  blogs(title: "Blogs", route: "blogs"),
  contact(title: "Contact", route: "contact");

  final String title;
  final String route;

  const ScreenType({
    this.route = "",
    this.title = "",
  });

  factory ScreenType.from(String route) {
    if (route.equals(about.route)) {
      return ScreenType.about;
    } else if (route.equals(projects.route)) {
      return ScreenType.projects;
    } else if (route.equals(services.route)) {
      return ScreenType.services;
    } else if (route.equals(blogs.route)) {
      return ScreenType.blogs;
    } else if (route.equals(contact.route)) {
      return ScreenType.contact;
    } else {
      return ScreenType.about;
    }
  }
}
