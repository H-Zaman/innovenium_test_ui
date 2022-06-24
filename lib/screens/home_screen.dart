import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovenium/model/navigation_model.dart';
import 'package:innovenium/model/oppotunity_model.dart';
import 'package:innovenium/widgets/swiper_cards_mod/tcard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final grey = Color(0xff1D1D1D);
  final lightGrey = Color(0xff606060);

  TCardController _controller = TCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///appbar section
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        'https://images.unsplash.com/photo-1580518324671-c2f0833a3af3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
                      ),
                      radius: 28,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          )
                        ),
                        Text(
                          'Hasib!',
                          style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                            fontSize: 36,
                            height: 1,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset(
                      'asset/icon1.png',
                    )
                  ],
                ),
              ),

              /// search
              Container(
                margin: EdgeInsets.only(
                  top: 22,
                  bottom: 22,
                  left: 12,
                  right: 12
                ),
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(111),
                  color: grey,
                ),
                child: Center(
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: 4
                          ),
                          child: Icon(
                            CupertinoIcons.search,
                            color: lightGrey
                          ),
                        ),
                        hintText: 'Search innovenium...',
                        hintStyle: GoogleFonts.openSans(
                          color: lightGrey,
                          fontWeight: FontWeight.w400
                        )
                    ),
                  ),
                ),
              ),

              /// navigation
              _Header(title: 'My', subTitle: 'Navigation'),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12
                ),
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: NavModel.demo.length,
                  itemBuilder: (_, index) => _NavItem(item: NavModel.demo[index]),
                ),
              ),

              /// opportunities
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: _Header(title: 'My', subTitle: 'Opportunities'),
              ),
              Expanded(
                child: TCard(
                  controller: _controller,
                  onEnd: (){
                    _controller.reset();
                  },
                  onBack: (newIndex, __){
                  },
                  onForward: (newIndex,__){
                  },
                  cards: OpportunityModel.demo.map((item) => _OpportunitiesCards(item: item)).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final String subTitle;
  final double size;
  const _Header({Key? key, required this.title, required this.subTitle, this.size = 24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12
      ),
      child: RichText(
        text: TextSpan(
          text: title,
          style: GoogleFonts.nunito(
            fontSize: size,
            fontWeight: FontWeight.w300
          ),
          children: [TextSpan(
            text: ' $subTitle',
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: size
            )
          )]
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final NavModel item;
  const _NavItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8
      ),
      child: AspectRatio(
        aspectRatio: 120/160,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'asset/${item.image}'
              )
            )
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Color(0xff5741F2),
                  radius: 14,
                  child: Text(
                    item.count.toString(),
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    item.subtitle,
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

class _OpportunitiesCards extends StatelessWidget {
  final OpportunityModel item;
  const _OpportunitiesCards({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffB050FA),
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 22
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xff8A3FC3),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(item.image),
                          fit: BoxFit.cover
                        ),

                      ),
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        item.title,
                        maxLines: 2,
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CIcon(
                      icon: Icons.location_pin,
                      label: 'Houston, TX',
                    ),
                    _CIcon(
                      icon: CupertinoIcons.lab_flask,
                      label: 'Kutsande Lab',
                    ),
                    _CIcon(
                      icon: Icons.access_time_sharp,
                      label: 'Full-time',
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 14),
          Container(
            width: 200,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Color(0xff8A3FC3)
            ),
            child: Center(
              child: _Header(
                title: 'Apply',
                subTitle: 'Now',
                size: 14,
              ),
            ),
          )
        ],
      )
    );
  }
}

class _CIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _CIcon({Key? key, required this.icon, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.075),
                offset: Offset(0,0),
                blurRadius: .5,
                spreadRadius: .5
              )
            ]
          ),
          padding: EdgeInsets.all(3),
          child: CircleAvatar(
            backgroundColor: Color(0xffB050FA),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 12
          ),
        )
      ],
    );
  }
}