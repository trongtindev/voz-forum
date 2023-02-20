class ThreadInterface {
  String url = '';
  String name = '';
  String createdAt = '';
  String replies = '';
  String updatedAt = '';
  String memberName = '';
  String memberAvatar = '';

  ThreadInterface(this.url, this.name, this.createdAt, this.replies, this.updatedAt, this.memberName, this.memberAvatar);

  fromJson(Map<String, dynamic> data) {
    print("Here is mandatory");
  }
}
