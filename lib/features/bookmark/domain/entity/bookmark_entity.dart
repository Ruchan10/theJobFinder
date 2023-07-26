import 'package:equatable/equatable.dart';

class BookmarkEntity extends Equatable {
  final String? bookmarkId;
  final String title;
  final String desc;
  final String company;
  final String location;
    final String logo;
  final String postedBy;
  final List<String> bookmarkedBy;
  final List<String> appliedBy;
  final List<String> acceptedUser;
  @override
  List<Object?> get props => [bookmarkId, title, desc, company, location,logo,
        postedBy,
        bookmarkedBy,
        appliedBy,
        acceptedUser];

  const BookmarkEntity({
    this.bookmarkId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,   required this.logo,
    required this.postedBy,
    required this.bookmarkedBy,
    required this.appliedBy,
    required this.acceptedUser,  });

  factory BookmarkEntity.fromJson(Map<String, dynamic> json) => BookmarkEntity(
        bookmarkId: json["bookmarkId"] as String?,
        title: json["title"] as String,
        desc: json["desc"] as String,
        company: json["company"] as String,
        location: json["location"] as String,
                logo: json["logo"],
        postedBy: json["postedBy"],
        bookmarkedBy: json["bookmarkedBy"],
        appliedBy: json["appliedBy"],
        acceptedUser: json["acceptedUser"],
      );

  Map<String, dynamic> toJson() => {
        "bookmarkId": bookmarkId,
              "title": title,
        "desc": desc,
        "company": company,
        "location": location,
                "logo": logo,
        "postedBy": postedBy,
        "appliedBy": appliedBy,
        "acceptedUser": acceptedUser,
        "bookmarkedBy": bookmarkedBy,
      };

  @override
  String toString() {
    return 'BookmarkEntity(bookmarkId: $bookmarkId,title: $title, desc: $desc, company: $company, location: $location,logo:$logo,postedBy:$postedBy,appliedBy:$appliedBy,acceptedUser:$acceptedUser,bookmarkedBy:$bookmarkedBy)';
  }
}


