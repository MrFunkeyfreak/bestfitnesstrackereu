const String InformationRoute = "/info";
const String NeuigkeitenRoute = "/news";
const String AuthenticationPageRoute = "/login";
const String RegristrationRoute = "/registrieren";


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
];