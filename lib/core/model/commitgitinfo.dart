import 'package:json_annotation/json_annotation.dart';

import 'package:mcgithub/core/model/commitgituser.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 2:08 PM
///

class CommitGitInfo {
  String message;
  String url;
  @JsonKey(name: 'comment_count')
  int commentCount;
  CommitGitUser author;
  CommitGitUser committer;

  CommitGitInfo(this.message, this.url, this.commentCount, this.author,
      this.committer);

}
