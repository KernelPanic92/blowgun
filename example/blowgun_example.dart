import 'package:blowgun/blowgun.dart';

void main() async {
  print('started blowgun instance');
  final blowgun = Blowgun(peers: ['ws://gun-manhattan.herokuapp.com/gun']);
  print('get test node');
  blowgun
      .get('123456789')
      .listen((message) => print('reply: ${message.toString()}'));
}
