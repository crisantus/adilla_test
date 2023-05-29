class OnboardingModel {
  String image;
  String text;
  String title;

  OnboardingModel(
      {required this.image, required this.text, required this.title});
  static List<OnboardingModel> list = [
    OnboardingModel(
        image: "assets/images/top.png",
        title: "Lorem Ipsum Kip Antares Lorem",
        text: "Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.",),
    OnboardingModel(
        image: "assets/images/top.png",
        title: "Lorem Ipsum ",
        text: "Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.",),
    OnboardingModel(
        image: "assets/images/top.png",
        title: "Kip Antares Lorem",
        text: "Lorem ipsum dolor sit amet consectetur. Congue eget aliquet nullam velit volutpat in viverra. Amet integer urna ornare congue ultrices at.",),
  ];
}
