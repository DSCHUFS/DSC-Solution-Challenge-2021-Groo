class CounselingInfo {
  final String name;
  final String keyword;
  final String profile;
  final bool like;
  final bool list;

  CounselingInfo.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        keyword = map['keyword'],
        profile = map['profile'],
        like = map['like'],
        list = map['list'];

  @override
  String toString() => "Counseling<$name:$keyword>";
}
