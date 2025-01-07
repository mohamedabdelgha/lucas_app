import 'package:flutter/material.dart';
import 'package:lucas_app/widgets/colors.dart';
import 'package:lucas_app/widgets/constants.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _tabController2;
  String selectedFilter = 'Suggestions'; // Initial selected filter

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController2 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // _controller.dispose();
    _tabController.dispose();
    _tabController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchInput(),
          SizedBox(
            width: Width,
            height: Height / 15,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                StatusAvatar(
                  image: 'images/profile.png',
                ),
                StatusAvatar(
                  image: 'images/profile.png',
                ),
                StatusAvatar(
                  image: 'images/profile.png',
                ),
                StatusAvatar(
                  image: 'images/profile.png',
                ),
                StatusAvatar(
                  image: 'images/profile.png',
                ),
                StatusAvatar(
                  image: 'images/profile.png',
                ),
                StatusAvatar(
                  image: 'images/profile.png',
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: darkBrownColor,
            labelColor: darkBrownColor,
            unselectedLabelColor: grayColor,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'inter', fontSize: 16),
            tabs: [
              Tab(text: 'Posts'),
              Tab(text: 'People'),
              Tab(text: 'My Posts'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Page 1: posts
                buildPosts(Width, Height),
                // Page 2: people
                buildPeople(Width, Height),
                // Page 3: My posts
                buildMyPosts(Width, Height),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPosts(width, height) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(8),
          width: width,
          height: height / 13,
          decoration: BoxDecoration(
              border: Border.all(color: grayColor, width: 0.7),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: darkBrownColor,
                child: Image.asset('images/profile.png'),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      color: lightGrayColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'What’s on your mind ?',
                            hintStyle: TextStyle(
                                fontFamily: 'inter',
                                fontSize: 14,
                                color: grayColor)),
                      )),
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 30,
                        color: grayColor,
                      )
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: darkBrownColor,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 30,
                      color: whiteColor,
                    )),
              )
            ],
          ),
        ),
        PostCard(width: width, height: height),
        PostCard(width: width, height: height),
        PostCard(width: width, height: height),
      ],
    );
  }

  Widget buildMyPosts(width, height) {
    return ListView(
      children: [
        PostCard(width: width, height: height),
        PostCard(width: width, height: height),
        PostCard(width: width, height: height),
      ],
    );
  }

  Widget buildPeople(width, height) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            width: width,
            height: height / 17,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PeopleFilterWidget(
                  text: 'Suggestions',
                  isPressed: selectedFilter == 'Suggestions',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Suggestions';
                    });
                  },
                ),
                PeopleFilterWidget(
                  text: 'Requests',
                  isPressed: selectedFilter == 'Requests',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Requests';
                    });
                  },
                ),
                PeopleFilterWidget(
                  text: 'Your Friends',
                  isPressed: selectedFilter == 'Your_Friends',
                  onTap: () {
                    setState(() {
                      selectedFilter = 'Your_Friends';
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        selectedFilter == 'Suggestions'
            ? Expanded(
                child: ListView(
                  children: [
                    PeopleCard(
                      username: 'rahma salem',
                      email: 'rahoma@gmail.com',
                      width: width,
                      height: height,
                    ),
                    PeopleCard(
                      username: 'rahma salem',
                      email: 'rahoma@gmail.com',
                      width: width,
                      height: height,
                    ),
                    PeopleCard(
                      username: 'mohamed abd elghany',
                      email: 'mohamed@gmail.com',
                      width: width,
                      height: height,
                    ),
                  ],
                ),
              )
            : selectedFilter == 'Requests'
                ? Expanded(
                    child: ListView(
                      children: [
                        RequestCard(
                            username: 'username',
                            email: 'email',
                            width: width,
                            height: height),
                        RequestCard(
                            username: 'username',
                            email: 'email',
                            width: width,
                            height: height),
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView(
                    children: [
                      FriendsCard(
                          username: 'username',
                          email: 'email',
                          width: width,
                          height: height),
                      FriendsCard(
                          username: 'username',
                          email: 'email',
                          width: width,
                          height: height),
                      FriendsCard(
                          username: 'username',
                          email: 'email',
                          width: width,
                          height: height),
                    ],
                  ))
      ],
    );
  }
}
