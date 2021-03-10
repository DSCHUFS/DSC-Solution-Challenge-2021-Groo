class APIPath {
  static String counselors() => 'counselors';
  static String counselor(String counselorId) => 'counselors/$counselorId';

  static String counseling(String uid, String counselingId) =>
      'users/$uid/counseling/$counselingId';
}

//파이어스토어 경로, 컬렉션/도큐먼트/... 순서로 이뤄짐
