// class MyProfileModel {
//   User? user;

//   MyProfileModel({this.user});

//   MyProfileModel.fromJson(Map<String, dynamic> json) {
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.user != null) {
//       data['user'] = this.user!.toJson();
//     }
//     return data;
//   }
// }

// class User {
//   Avater? avater;
//   String? sId;
//   String? name;
//   String? email;
//   List<String>? posts;
//   List<String>? followers;
//   List<String>? following;
//   String? date;
//   int? iV;
//   int? userverify;
//   String? createdAt;

//   User(
//       {this.avater,
//       this.sId,
//       this.name,
//       this.email,
//       this.posts,
//       this.followers,
//       this.following,
//       this.date,
//       this.iV,
//       this.userverify,
//       this.createdAt});

//   User.fromJson(Map<String, dynamic> json) {
//     avater =
//         json['avater'] != null ? new Avater.fromJson(json['avater']) : null;
//     sId = json['_id'];
//     name = json['name'];
//     email = json['email'];
//     posts = json['posts'].cast<String>();
//     followers = json['followers'].cast<String>();
//     following = json['following'].cast<String>();
//     date = json['date'];
//     iV = json['__v'];
//     userverify = json['userverify'];
//     createdAt = json['createdAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.avater != null) {
//       data['avater'] = this.avater!.toJson();
//     }
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['posts'] = this.posts;
//     data['followers'] = this.followers;
//     data['following'] = this.following;
//     data['date'] = this.date;
//     data['__v'] = this.iV;
//     data['userverify'] = this.userverify;
//     data['createdAt'] = this.createdAt;
//     return data;
//   }
// }

// class Avater {
//   String? publicId;
//   String? url;

//   Avater({this.publicId, this.url});

//   Avater.fromJson(Map<String, dynamic> json) {
//     publicId = json['public_id'];
//     url = json['url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['public_id'] = this.publicId;
//     data['url'] = this.url;
//     return data;
//   }
// }






// To parse this JSON data, do
//
//     final myProfileModel = myProfileModelFromJson(jsonString);

import 'dart:convert';

MyProfileModel myProfileModelFromJson(String str) => MyProfileModel.fromJson(json.decode(str));

String myProfileModelToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
    MyProfileModel({
        required this.user,
    });

    final User user;

    factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.avater,
        required this.id,
        required this.name,
        required this.email,
        required this.posts,
        required this.followers,
        required this.following,
        required this.date,
        required this.userverify,
        required this.createdAt,
    });

    final Avater avater;
    final String id;
    final String name;
    final String email;
    final List<Post> posts;
    final List<Follow> followers;
    final List<Follow> following;
    final DateTime date;
    final int userverify;
    final DateTime createdAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        avater: Avater.fromJson(json["avater"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        followers: List<Follow>.from(json["followers"].map((x) => Follow.fromJson(x))),
        following: List<Follow>.from(json["following"].map((x) => Follow.fromJson(x))),
        date: DateTime.parse(json["date"]),
        userverify: json["userverify"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "avater": avater.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
        "followers": List<dynamic>.from(followers.map((x) => x.toJson())),
        "following": List<dynamic>.from(following.map((x) => x.toJson())),
        "date": date.toIso8601String(),
        "userverify": userverify,
        "createdAt": createdAt.toIso8601String(),
    };
}

class Avater {
    Avater({
        required this.publicId,
        required this.url,
    });

    final String publicId;
    final String url;

    factory Avater.fromJson(Map<String, dynamic> json) => Avater(
        publicId: json["public_id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicId,
        "url": url,
    };
}

class Follow {
    Follow({
        required this.avater,
        required this.id,
        required this.name,
        required this.email,
        required this.posts,
        required this.followers,
        required this.following,
        required this.userverify,
        required this.createdAt,
        required this.v,
        this.date,
    });

    final Avater avater;
    final String id;
    final String name;
    final String email;
    final List<dynamic> posts;
    final List<String> followers;
    final List<String> following;
    final int userverify;
    final DateTime createdAt;
    final int v;
    final DateTime? date;

    factory Follow.fromJson(Map<String, dynamic> json) => Follow(
        avater: Avater.fromJson(json["avater"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        userverify: json["userverify"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "avater": avater.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "userverify": userverify,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "date": date?.toIso8601String(),
    };
}

class Post {
    Post({
        required this.image,
        required this.id,
        required this.caption,
        required this.owner,
        required this.likes,
        required this.createdAt,
        required this.comments,
        required this.v,
    });

    final Avater image;
    final String id;
    final String caption;
    final String owner;
    final List<dynamic> likes;
    final DateTime createdAt;
    final List<dynamic> comments;
    final int v;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        image: Avater.fromJson(json["image"]),
        id: json["_id"],
        caption: json["caption"],
        owner: json["owner"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "_id": id,
        "caption": caption,
        "owner": owner,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "__v": v,
    };
}





