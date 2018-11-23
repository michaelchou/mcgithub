import 'package:mcgithub/core/model/user.dart';
import 'package:mcgithub/core/model/releaseassets.dart';

import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 6:01 PM
///
// {
//  "url": "https://api.github.com/repos/octocat/Hello-World/releases/1",
//  "html_url": "https://github.com/octocat/Hello-World/releases/v1.0.0",
//  "assets_url": "https://api.github.com/repos/octocat/Hello-World/releases/1/assets",
//  "upload_url": "https://uploads.github.com/repos/octocat/Hello-World/releases/1/assets{?name,label}",
//  "tarball_url": "https://api.github.com/repos/octocat/Hello-World/tarball/v1.0.0",
//  "zipball_url": "https://api.github.com/repos/octocat/Hello-World/zipball/v1.0.0",
//  "id": 1,
//  "node_id": "MDc6UmVsZWFzZTE=",
//  "tag_name": "v1.0.0",
//  "target_commitish": "master",
//  "name": "v1.0.0",
//  "body": "Description of the release",
//  "draft": false,
//  "prerelease": false,
//  "created_at": "2013-02-27T19:35:32Z",
//  "published_at": "2013-02-27T19:35:32Z",
//  "author": {
//    "login": "octocat",
//    "id": 1,
//    "node_id": "MDQ6VXNlcjE=",
//    "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/octocat",
//    "html_url": "https://github.com/octocat",
//    "followers_url": "https://api.github.com/users/octocat/followers",
//    "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//    "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//    "organizations_url": "https://api.github.com/users/octocat/orgs",
//    "repos_url": "https://api.github.com/users/octocat/repos",
//    "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/octocat/received_events",
//    "type": "User",
//    "site_admin": false
//  },
//  "assets": [
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
//}


class Releases {
  int id;
  String url;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'assets_url')
  String assetsUrl;
  @JsonKey(name: 'upload_url')
  String uploadUrl;
  @JsonKey(name: 'tarball_url')
  String tarBallUrl;
  @JsonKey(name: 'zipball_url')
  String zipBallUrl;
  @JsonKey(name: 'node_id')
  String nodeId;
  @JsonKey(name: 'tag_name')
  String tagName;
  @JsonKey(name: 'target_commitish')
  String targetCommitIsh;
  String name;
  String body;
  bool draft;
  @JsonKey(name: 'prerelease')
  bool preRelease;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'published_at')
  DateTime publishedAt;
  User author;
  List<ReleaseAssets> assets;

  Releases(this.id, this.url, this.htmlUrl, this.assetsUrl, this.uploadUrl,
      this.tarBallUrl, this.zipBallUrl, this.nodeId, this.tagName,
      this.targetCommitIsh, this.name, this.body, this.draft, this.preRelease,
      this.createdAt, this.publishedAt, this.author, this.assets);

}