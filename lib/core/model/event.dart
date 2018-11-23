import 'package:mcgithub/core/model/user.dart';
import 'package:mcgithub/core/model/repository.dart';

import 'package:json_annotation/json_annotation.dart';

///
/// @author MichaelChou
/// @date 2018/11/18 1:00 PM
/// GitHub events. These events power the various activity streams on the site.
/// [
//  {
//    "type": "Event",
//    "public": true,
//    "payload": {
//    },
//    "repo": {
//      "id": 3,
//      "name": "octocat/Hello-World",
//      "url": "https://api.github.com/repos/octocat/Hello-World"
//    },
//    "actor": {
//      "id": 1,
//      "login": "octocat",
//      "gravatar_id": "",
//      "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//      "url": "https://api.github.com/users/octocat"
//    },
//    "org": {
//      "id": 1,
//      "login": "github",
//      "gravatar_id": "",
//      "url": "https://api.github.com/orgs/github",
//      "avatar_url": "https://github.com/images/error/octocat_happy.gif"
//    },
//    "created_at": "2011-09-06T17:26:27Z",
//    "id": "12345"
//  }
//]

class Event {
  String id;
  String type;
  User actor;
  Repository repo;
  User org;
  @JsonKey(name: 'create_at')
  DateTime createAt;
  bool isPublic;

  Event(this.id, this.type, this.actor, this.repo, this.org, this.createAt,
      this.isPublic);

}