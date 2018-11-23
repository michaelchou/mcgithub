import 'package:json_annotation/json_annotation.dart';

import 'package:mcgithub/core/model/commitgitinfo.dart';
import 'package:mcgithub/core/model/user.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 2:14 PM
///

class RepoCommit {
  String sha;
  String url;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'comments_url')
  String commentsUrl;
  CommitGitInfo commit;
  User author;
  User committer;
  List<RepoCommit> parents;

  RepoCommit(this.sha, this.url, this.htmlUrl, this.commentsUrl, this.commit,
      this.author, this.committer, this.parents);

}