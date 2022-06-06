const String InformationRoute = "/info";
const String NeuigkeitenRoute = "/news";
const String AuthenticationPageRoute = "/login";
const String RegristrationUserRoute = "/registrieren";
const String RegristrationScientistRoute = "/scientistregistrieren";
const String RegristrationAdminRoute = "/adminregistrieren";
const String DashboardRoute = "/dashboard";
const String ForgotPasswordRoute = "/forgot_password";
const String ProfileRoute = "/profile";
const String UsersAdministrationRoute = "/userverwaltung";


class MenuItem{
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List <MenuItem> sideMenuItems = [
  MenuItem('Information', InformationRoute),
  MenuItem('Episodes', NeuigkeitenRoute),
  MenuItem('Login', AuthenticationPageRoute),
  MenuItem('Registrieren', RegristrationUserRoute),
  MenuItem('Wissenschaftler-Registrieren', RegristrationScientistRoute),
  MenuItem('Admin-Registrieren', RegristrationAdminRoute),
  MenuItem('Dashboard', DashboardRoute),
  MenuItem('Passwort vergessen', ForgotPasswordRoute),
  MenuItem('Profile', ProfileRoute),
  MenuItem('Userverwaltung', UsersAdministrationRoute),
];