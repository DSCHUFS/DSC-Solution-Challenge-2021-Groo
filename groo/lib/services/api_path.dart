class APIPath {
  static String accountInfo(String uid) => 'users/$uid';

  static String myBadges(String uid) => 'users/$uid/my_badges';
  static String myBadge(String uid, String myBadgeId) =>
      'users/$uid/my_badges/$myBadgeId';
  static String myCampaigns(String uid) => 'users/$uid/participated_campaigns';
  static String myCampaign(String uid, String myCampaignId) =>
      'users/$uid/participated_campaigns/$myCampaignId';
  static String followers(String uid) => 'users/$uid/followers';
  static String followings(String uid) => 'users/$uid/followings';
  static String counseling(String uid) => 'users/$uid/counseling';

  static String counselors() => 'counselors';
  static String counselor(String counselorId) => 'counselors/$counselorId';
}

//파이어스토어 경로, 컬렉션/도큐먼트/... 순서로 이뤄짐

// 1. api_path.dart 에서 데이터베이스 경로 지정
// 2. database.dart 에서 set, delete, stream 함수 생성
// 3. 사용하는 곳에서 final database = Provider.of<Database>(context, listen: false); 로 정의하고
// 4. stream과 set, delete을 적절히 사용 (profile_screen.dart와 setting_screen.dart 참고)