import 'package:mcgithub/core/model/user.dart';

import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 1:10 PM
///

class CommitComment {
  int id;
  String body;
  String path;
  int position;
  int line;
  @JsonKey(name: 'commit_id')
  String commitId;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  String url;
  User user;

  CommitComment(this.id, this.body, this.path, this.position, this.line,
      this.commitId, this.createdAt, this.updatedAt, this.htmlUrl, this.url,
      this.user);


}