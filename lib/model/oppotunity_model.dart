class OpportunityModel{
  final String image;
  final String title;

  OpportunityModel({
    required this.image,
    required this.title
});

  static final demo = <OpportunityModel>[
    OpportunityModel(
      image: 'https://images.unsplash.com/photo-1620932934088-fbdb2920e484?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGhlYWRzaG90fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      title: 'Research Assistant - Neuroscience'
    ),
    OpportunityModel(
      image: 'https://images.unsplash.com/photo-1562788869-4ed32648eb72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80',
      title: 'Data Analyst - IT'
    ),
    OpportunityModel(
      image: 'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'Photographer'
    )
  ];
}