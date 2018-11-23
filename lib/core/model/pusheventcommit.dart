import 'package:mcgithub/core/model/user.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 4:12 PM
///

class PushEventCommit {
  String sha;
  User author;
  String message;
  bool distinct;
  String url;

  PushEventCommit(this.sha, this.author, this.message, this.distinct, this.url);

}