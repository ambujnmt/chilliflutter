class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: 'Welcome to Chilli',
    image: 'assets/image/rafikis.png',
    desc: 'A social media platform for verified users aged 21',
  ),
  OnboardingContents(
    title: 'Stay Authentic',
    image: 'assets/image/rafiki.png',
    desc: 'No bots, no fake accounts only real conversations',
  ),
  OnboardingContents(
    title: 'Get Daily Motivation',
    image: 'assets/image/pana.png',
    desc: 'Access uplifting content and meaningful interactions every day',
  ),
  OnboardingContents(
    title: 'Keep It Positive',
    image: 'assets/image/panas.png',
    desc: 'Enjoy a safe space for positive and supportive communication',
  ),

];