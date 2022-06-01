const String InformationRoute = "/info";
const String NeuigkeitenRoute = "/news";
const String AuthenticationPageRoute = "/login";
const String RegristrationRoute = "/registrieren";
const String DashboardRoute = "/dashboard";
const String ForgotPasswordRoute = "/forgot_password";
const String ProfileRoute = "/profile";


class MenuItem{
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List <MenuItem> sideMenuItems = [
  MenuItem('Information', InformationRoute),
  MenuItem('Episodes', NeuigkeitenRoute),
  MenuItem('Login', AuthenticationPageRoute),
  MenuItem('Registrieren', RegristrationRoute),
  MenuItem('Dashboard', DashboardRoute),
  MenuItem('Passwort vergessen', ForgotPasswordRoute),
  MenuItem('Profile', ProfileRoute),
];