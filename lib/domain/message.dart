class Message {
  String sender, receiver;
  String body;
  String image;
  Message.textMessage({this.sender, this.receiver, this.body});
  Message.image({this.sender, this.receiver, this.image});
}
