import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 1:01 PM
///

class Branch {
  String name;
  @JsonKey(name: 'tarball_url')
  String tarBallUrl;
  @JsonKey(name: 'zipball_url')
  String zipBallUrl;
  bool isBranch = true;

  Branch(this.name, this.tarBallUrl, this.zipBallUrl, this.isBranch);

}