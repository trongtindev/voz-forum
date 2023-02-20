class CommentInterface {
  List<String> contents;
  String createdAt;
  bool newIndicator;

  String memberName;
  String memberTitle;
  String memberAvatar;
  bool memberIsOnline;
  String? memberSignature;

  CommentInterface(this.contents, this.createdAt, this.newIndicator, this.memberName, this.memberTitle, this.memberAvatar, this.memberIsOnline, this.memberSignature);
}
