import 'package:mcgithub/core/model/user.dart';

import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 6:38 PM
///
/// "assets": [
//    {
//      "url": "https://api.github.com/repos/octocat/Hello-World/releases/assets/1",
//      "browser_download_url": "https://github.com/octocat/Hello-World/releases/download/v1.0.0/example.zip",
//      "id": 1,
//      "node_id": "MDEyOlJlbGVhc2VBc3NldDE=",
//      "name": "example.zip",
//      "label": "short description",
//      "state": "uploaded",
//      "content_type": "application/zip",
//      "size": 1024,
//      "download_count": 42,
//      "created_at": "2013-02-27T19:35:32Z",
//      "updated_at": "2013-02-27T19:35:32Z",
//      "uploader": {
//        "login": "octocat",
//        "id": 1,
//        "node_id": "MDQ6VXNlcjE=",
//        "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//        "gravatar_id": "",
//        "url": "https://api.github.com/users/octocat",
//        "html_url": "https://github.com/octocat",
//        "followers_url": "https://api.github.com/users/octocat/followers",
//        "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//        "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//        "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//        "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//        "organizations_url": "https://api.github.com/users/octocat/orgs",
//        "repos_url": "https://api.github.com/users/octocat/repos",
//        "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//        "received_events_url": "https://api.github.com/users/octocat/received_events",
//        "type": "User",
//        "site_admin": false
//      }
//    }
//  ]

class ReleaseAssets {
  int id;
  String url;
  @JsonKey(name: 'browser_download_url')
  String browserDownloadUrl;
  @JsonKey(name: 'node_id')
  String nodeId;
  String name;
  String label;
  String state;
  @JsonKey(name: 'content_type')
  String contentType;
  int size;
  @JsonKey(name: 'download_count')
  int downloadCount;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;
  User uploader;

  ReleaseAssets(this.id, this.url, this.browserDownloadUrl, this.nodeId,
      this.name, this.label, this.state, this.contentType, this.size,
      this.downloadCount, this.createdAt, this.updatedAt, this.uploader);

}
