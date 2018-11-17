import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

///
/// @author MichaelChou
/// @date 2018/11/16 10:11 PM
/// 用户

@JsonSerializable()
class User {
  String login;
  int id;
  @JsonKey(name: 'node_id')
  String nodeId;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'gravatar_id')
  String grAvatarId;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'followers_url')
  String followersUrl;
  @JsonKey(name: 'following_url')
  String followingUrl;
  @JsonKey(name: 'gists_url')
  String gistsUrl;
  @JsonKey(name: 'starred_url')
  String starredUrl;
  @JsonKey(name: 'subscription_url')
  String subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  String organizationsUrl;
  @JsonKey(name: 'repos_url')
  String reposUrl;
  @JsonKey(name: 'events_url')
  String eventsUrl;
  @JsonKey(name: 'received_events_url')
  String receivedEventsUrl;
  String type;
  @JsonKey(name: 'site_admin')
  bool siteAdmin;
  String name;
  String company;
  String blog;
  String location;
  String email;
  @JsonKey(name: 'hireable')
  String hireAble;
  String bio;
  @JsonKey(name: 'public_repos')
  int publicRepos;
  @JsonKey(name: 'public_gists')
  int publicGists;
  int followers;
  int following;
  @JsonKey(name: 'create_at')
  DateTime createdAt;
  @JsonKey(name: 'update_at')
  DateTime updatedAt;
  @JsonKey(name: 'private_gists')
  int privateGists;
  @JsonKey(name: 'total_private_repos')
  int totalPrivateRepos;
  @JsonKey(name: 'owned_private_repos')
  int ownedPrivateRepos;
  @JsonKey(name: 'disk_usage')
  int diskUsage;
  int collaborators;
  @JsonKey(name: 'two_factor_authentication')
  bool twoFactorAuthentication;
  String plan;

  User(this.login, this.id, this.nodeId, this.avatarUrl, this.grAvatarId,
      this.htmlUrl, this.followersUrl, this.followingUrl, this.gistsUrl,
      this.starredUrl, this.subscriptionsUrl, this.organizationsUrl,
      this.reposUrl, this.eventsUrl, this.receivedEventsUrl, this.type,
      this.siteAdmin, this.name, this.company, this.blog, this.location,
      this.email, this.hireAble, this.bio, this.publicRepos, this.publicGists,
      this.followers, this.following, this.createdAt, this.updatedAt,
      this.privateGists, this.totalPrivateRepos, this.ownedPrivateRepos,
      this.diskUsage, this.collaborators, this.twoFactorAuthentication,
      this.plan);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserToJson(this);

}