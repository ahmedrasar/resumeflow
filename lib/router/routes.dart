class AppRoutes {
  static final root = RouteUrl('', '/');
  static final tutorial = RouteUrl(root.full, 'tutorial');
  static final home = RouteUrl(root.full, 'home');
  static final coverLettersDashboard = RouteUrl(home.full, '/cover-letters');
  static final resumesDashboard = RouteUrl(home.full, '/resumes');
  static final coverLetter = RouteUrl(coverLettersDashboard.full, '/create');
  static final resume = RouteUrl(resumeDashboard.full, '/create');
  static final resumeDashboard = RouteUrl(home.full, '/resumes');
  static final settings = RouteUrl(home.full, '/settings');
}

class RouteUrl {
  final String self;
  final String full;

  const RouteUrl(String parent, this.self) : full = '$parent$self';
}
