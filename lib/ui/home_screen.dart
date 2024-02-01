import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 4,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: NestedScrollView(
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: _salam(),
                    ),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: primary,
                    )
                  ],
                  body: Container()
              ),
          ),
      ),
    );
  }

  Column _salam() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
            color: secondary,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Username',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 131,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [gradient1, gradient2]
            )
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SvgPicture.asset('/svg/images/banner.svg')),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('/svg/icons/book.svg'),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Last Read',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Text(
                'Al-Fatihah',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4,),
              Text(
                'Ayah No: 1',
                style: GoogleFonts.poppins(
                  color: Colors.white
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
      items: [
        _bottomNavigationBarItem(icon: '/svg/icons/quran.svg', label: 'Quran'),
        _bottomNavigationBarItem(icon: '/svg/icons/lightbulb.svg', label: 'Lightbulb'),
        _bottomNavigationBarItem(icon: '/svg/icons/prayer.svg', label: 'Prayer'),
        _bottomNavigationBarItem(icon: '/svg/icons/doa.svg', label: 'Doa'),
        _bottomNavigationBarItem(icon: '/svg/icons/bookmark.svg', label: 'Bookmark'),
      ]
  );
  
  BottomNavigationBarItem _bottomNavigationBarItem({required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(
            icon,
            color: secondary,
          ),
          activeIcon: SvgPicture.asset(
            icon,
            color: primary,
          ),
          label: label
      );
  
  AppBar _appBar() => AppBar(
    backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/icons/menu.svg')
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          'Quran App',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        IconButton(onPressed: (() => {}),
            icon: SvgPicture.asset('/svg/icons/search.svg'))
      ],
    ),
  );

}

