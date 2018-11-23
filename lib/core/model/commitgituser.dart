import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 2:09 PM
///

class CommitGitUser {
  String name;
  String email;
  DateTime date;

  CommitGitUser(this.name, this.email, this.date);


}