import 'package:equatable/equatable.dart';

class BookmarkEntity extends Equatable {
  final String? bookmarkId;
  final String title;
  final String desc;
  final String company;
  final String location;
  @override
  List<Object?> get props => [bookmarkId, title, desc, company, location];

  const BookmarkEntity({
    this.bookmarkId,
    required this.title,
    required this.desc,
    required this.company,
    required this.location,  });

  factory BookmarkEntity.fromJson(Map<String, dynamic> json) => BookmarkEntity(
        bookmarkId: json["bookmarkId"] as String?,
        title: json["title"] as String,
        desc: json["desc"] as String,
        company: json["company"] as String,
        location: json["location"] as String,
      );

  Map<String, dynamic> toJson() => {
        "bookmarkId": bookmarkId,
              "title": title,
        "desc": desc,
        "company": company,
        "location": location,
      };

  @override
  String toString() {
    return 'BookmarkEntity(bookmarkId: $bookmarkId,title: $title, desc: $desc, company: $company, location: $location)';
  }
}


