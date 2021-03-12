class APIPath {
  static String accountInfo(String uid) => 'users/$uid';

  static String myBadges(String uid) => 'users/$uid/my_badges';
  static String followers(String uid) => 'users/$uid/followers';
  static String followings(String uid) => 'users/$uid/followings';
  static String counseling(String uid) => 'users/$uid/counseling';
  static String myCampaigns(String uid) => 'users/$uid/participated_campaigns';
  static String myCampaign(String uid, String myCampaignId) =>
      'users/$uid/participated_campaigns/$myCampaignId';

  static String badge(String badgeId) => 'badges/$badgeId';

  static String counselors() => 'counselors';
  static String counselor(String counselorId) => 'counselors/$counselorId';
}

//파이어스토어 경로, 컬렉션/도큐먼트/... 순서로 이뤄짐
