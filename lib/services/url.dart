class Url {
  //Base URLs
  static const spacexBaseUrl = 'https://api.spacexdata.com';

  // Vechiles URLs
  static const rockets = '$spacexBaseUrl/v4/rockets/query';
  static const dragons = '$spacexBaseUrl/v4/dragons/query';
  static const roadster = '$spacexBaseUrl/v4/roadster/query';
  static const ships = '$spacexBaseUrl/v4/ships/query';

  // Launch URL
  static const launches = '$spacexBaseUrl/v5/launches/query';

  // SpaceX info URLs
  static const companyInformation = '$spacexBaseUrl/v4/company';
  static const companyAchievements = '$spacexBaseUrl/v4/history';
}
