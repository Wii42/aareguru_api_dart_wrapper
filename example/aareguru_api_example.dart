import 'package:aareguru_api/aareguru_api.dart';

void main() async{
  void main() async {
    AareGuruApi api = AareGuruApi(appName: 'Wi42_test', appVersion: '0.1');
    List<City> cities = await api.cities();
    print(await api.current(Cities.brienz.name));
  }
}
