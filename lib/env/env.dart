import 'package:envify/envify.dart';
part 'env.g.dart';

@Envify()
abstract class Env {
  static const key = _Env.key;
  static const pkey = _Env.pkey;
  static const pid = _Env.pid;
  static const tokenid = _Env.tokenid;
  static const atoken = _Env.atoken;
}
