enum AppPages {
  splash('splash', '/splash-view'),
  homePage('home', '/home-view'),
  skills('skills', '/skills-view'),
  contactPage('contact', '/contact-view'),
  projects('projects', '/projects-view'),
  whyAmIBetterCandidate('whyAmIBetterCandidate', '/whyAmIBetterCandidate-view'),
  ;

  const AppPages(this.name, this.path);

  final String name;
  final String path;

  static List<AppPages> get bottomNavPages {
    return [
      AppPages.homePage,
      AppPages.skills,
      AppPages.projects,
    ];
  }

  static bool isHomePage(String path) {
    print('OOOOOOOOOOO$path');
    return bottomNavPages.map((e) => e.path).contains(path);
  }
}
