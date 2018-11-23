import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 1:19 PM
///

class CommitFile {
  String sha;
  @JsonKey(name: 'filename')
  String fileName;
  String status;
  int additions;
  int deletions;
  int changes;
  @JsonKey(name: 'blob_url')
  String blobUrl;
  @JsonKey(name: 'raw_url')
  String rawUrl;
  @JsonKey(name: 'content_url')
  String contentUrl;
  String patch;

  CommitFile(this.sha, this.fileName, this.status, this.additions,
      this.deletions, this.changes, this.blobUrl, this.rawUrl, this.contentUrl,
      this.patch);

}