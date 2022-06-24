class NavModel{
  final int count;
  final String title;
  final String subtitle;
  final String image;

  NavModel({
    required this.count,
    required this.title,
    required this.subtitle,
    required this.image
});

  static final demo = <NavModel>[
    NavModel(count: 4, title: 'Professors', subtitle: 'Connections', image: '1.png'),
    NavModel(count: 2, title: 'Open', subtitle: 'Applications', image: '2.png'),
    NavModel(count: 1, title: 'Mentorship', subtitle: 'Program', image: '3.png'),
  ];

}