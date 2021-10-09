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
      video: "assets/videos/1.mp4",
      ownerName: "@pink.candyx",
      ownerProfilePicture: "",
      textContent: "",
      comments: 12),
  PostModel(
      id: 1,
      likes: 67,
      video: "assets/videos/2.mp4",
      ownerName: "@Jack",
      ownerProfilePicture: "",
      textContent: "",
      comments: 12),
  PostModel(
      id: 1,
      likes: 98,
      video: "assets/videos/3.mp4",
      ownerName: "@Will",
      ownerProfilePicture:
          "https://image.freepik.com/free-photo/medium-shot-happy-man-smiling_23-2148221808.jpg",
      textContent: "",
      comments: 1223),
  PostModel(
      id: 1,
      likes: 98,
      video: "assets/videos/4.mp4",
      ownerName: "@pAlan",
      ownerProfilePicture:
          "https://image.freepik.com/free-photo/medium-shot-happy-man-smiling_23-2148221808.jpg",
      textContent: "",
      comments: 1223)
];
