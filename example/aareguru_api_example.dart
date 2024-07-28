import 'package:aareguru_api/aareguru_api.dart';

void main() async{
  AareGuruApi api = AareGuruApi(appName: 'test', appVersion: '0.1');
  print(await api.today('bern'));
  print(await api.todayValues('bern', ['temperature', 'flow']));
  print(await api.current('bern'));
  print(await api.currentValues('bern', ['temperature', 'flow']));
  print(await api.widget());
  print(await api.widgetValues(['temperature', 'flow']));
}
