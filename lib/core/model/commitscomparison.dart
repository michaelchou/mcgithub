import 'package:json_annotation/json_annotation.dart';

import 'package:mcgithub/core/model/repocommit.dart';
import 'package:mcgithub/core/model/commitfile.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 2:12 PM
///

class CommitsComparison {
  String url;
  String htmlUrl;
  RepoCommit baseCommit;
  RepoCommit mergeBaseCommit;
  String status;
  int totalCommits;
  List<RepoCommit> commits;
  List<CommitFile> files;

  CommitsComparison(this.url, this.htmlUrl, this.baseCommit,
      this.mergeBaseCommit, this.status, this.totalCommits, this.commits,
      this.files);

}