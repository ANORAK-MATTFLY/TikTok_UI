class PostModel {
  int? id;
  String? ownerName;
  String? ownerProfilePicture;
  String? textContent;
  String? video;
  int? likes;
  int? comments;
  DateTime? createdAt;

  PostModel({
    this.id,
    this.ownerName,
    this.ownerProfilePicture,
    this.textContent,
    this.video,
    this.likes,
    this.comments,
    this.createdAt,
  });
}

final List<PostModel> posts = [
  PostModel(
      id: 1,
      likes: 83,
      video:
          "https://firebasestorage.googleapis.com/v0/b/dote-bb913.appspot.com/o/image_picker4117512403721228152_trimmed%3AAug12%2C2021-13%3A49%3A34.mp4?alt=media&token=c9567a41-09d1-46de-872c-db5deebe8721",
      ownerName: "@pink.candyx",
      ownerProfilePicture: "",
      textContent: "",
      comments: 12),
  PostModel(
      id: 1,
      likes: 67,
      video:
          "https://firebasestorage.googleapis.com/v0/b/dote-bb913.appspot.com/o/image_picker4117512403721228152_trimmed%3AAug12%2C2021-13%3A49%3A34.mp4?alt=media&token=c9567a41-09d1-46de-872c-db5deebe8721",
      ownerName: "@pink.candyx",
      ownerProfilePicture: "",
      textContent: "",
      comments: 12),
  PostModel(
      id: 1,
      likes: 98,
      video:
          "https://firebasestorage.googleapis.com/v0/b/dote-bb913.appspot.com/o/image_picker4117512403721228152_trimmed%3AAug12%2C2021-13%3A49%3A34.mp4?alt=media&token=c9567a41-09d1-46de-872c-db5deebe8721",
      ownerName: "@pink.candyx",
      ownerProfilePicture:
          "https://image.freepik.com/free-photo/medium-shot-happy-man-smiling_23-2148221808.jpg",
      textContent: "",
      comments: 1223),
];
