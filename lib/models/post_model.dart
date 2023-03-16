// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
    PostModel({
        required this.status,
        required this.post,
    });

    bool status;
    List<Post> post;

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        status: json["status"],
        post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "post": List<dynamic>.from(post.map((x) => x.toJson())),
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

    Image image;
    String id;
    String caption;
    Owner owner;
    List<dynamic> likes;
    DateTime createdAt;
    List<Comment> comments;
    int v;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        image: Image.fromJson(json["image"]),
        id: json["_id"],
        caption: json["caption"],
        owner: Owner.fromJson(json["owner"]),
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "image": image.toJson(),
        "_id": id,
        "caption": caption,
        "owner": owner.toJson(),
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "__v": v,
    };
}

class Comment {
    Comment({
        required this.user,
        required this.comment,
        required this.id,
        required this.commentdate,
    });

    String user;
    String comment;
    String id;
    DateTime commentdate;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        user: json["user"],
        comment: json["comment"],
        id: json["_id"],
        commentdate: DateTime.parse(json["commentdate"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "comment": comment,
        "_id": id,
        "commentdate": commentdate.toIso8601String(),
    };
}

class Image {
    Image({
        required this.publicId,
        required this.url,
    });

    PublicId publicId;
    String url;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: publicIdValues.map[json["public_id"]]!,
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "public_id": publicIdValues.reverse[publicId],
        "url": url,
    };
}

enum PublicId { REQ_BODY_PUBLIC_ID, SAMPLE_ID }

final publicIdValues = EnumValues({
    "req.body.public_id": PublicId.REQ_BODY_PUBLIC_ID,
    "sample_id": PublicId.SAMPLE_ID
});

class Owner {
    Owner({
        required this.avater,
        required this.id,
        required this.name,
        required this.email,
        required this.posts,
        required this.followers,
        required this.following,
        required this.date,
        required this.v,
        required this.createdAt,
        required this.userverify,
    });

    Image avater;
    String id;
    String name;
    String email;
    List<dynamic> posts;
    List<dynamic> followers;
    List<dynamic> following;
    DateTime date;
    int v;
    DateTime createdAt;
    int userverify;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        avater: Image.fromJson(json["avater"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        posts: List<dynamic>.from(json["posts"].map((x) => x)),
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        date: DateTime.parse(json["date"]),
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        userverify: json["userverify"],
    );

    Map<String, dynamic> toJson() => {
        "avater": avater.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "posts": List<dynamic>.from(posts.map((x) => x)),
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "date": date.toIso8601String(),
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "userverify": userverify,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
