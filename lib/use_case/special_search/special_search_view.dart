import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/special_search/model/reply.dart';
import 'package:use_case_flutter/use_case/special_search/model/user.dart';

class SpecialSearchView extends StatefulWidget {
  const SpecialSearchView({super.key});

  @override
  State<SpecialSearchView> createState() => _SpecialSearchViewState();
}

class _SpecialSearchViewState extends State<SpecialSearchView> {
  late final SearchUserReply _searchUserReply;

  List<User> _searchedUsers = [];
  List<Reply> _searchedReplies = [];

  @override
  void initState() {
    super.initState();
    _searchUserReply = SearchUserReply(users: User.users, replies: Reply.replies);
    _searchListUpdate(_searchUserReply);
  }

  void _searchListUpdate(SearchUserReply model){
    _searchedUsers = model.users;
    _searchedReplies = model.replies;
  }

  void _searchKey(String key){
    final newSearch = _searchUserReply.find(key);
    setState(() {
      _searchListUpdate(newSearch);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          TextField(
            onChanged: _searchKey,
          ).toSliver,
          SizedBox(height: 8).toSliver,
          Text(
            'User List',
            style: Theme.of(context).textTheme.titleLarge,
          ).toVisible(_searchedUsers.isNotEmpty).toSliver,
          SizedBox(height: 8).toSliver,
          SliverList(
            delegate: SliverChildBuilderDelegate((context, i){
              return Card(
                child: Text(_searchedUsers[i].name)
              );
            },
            childCount: _searchedUsers.length
          )),
          SizedBox(height: 32).toSliver,
          Text(
            'Reply List',
            style: Theme.of(context).textTheme.titleLarge,
          ).toVisible(_searchedReplies.isNotEmpty).toSliver,
          SizedBox(height: 8).toSliver,
          SliverList(
            delegate: SliverChildBuilderDelegate((context, i){
              return Card(
                child: Text(_searchedReplies[i].result)
              );
            },
            childCount: _searchedReplies.length
          )),
        ],
      ),
    );
  }
}

extension WidgetExtension on Widget{
  Widget get toSliver => SliverToBoxAdapter(child: this);
  Widget toVisible(bool result) => result ? this : const SizedBox.shrink();
}

class SearchUserReply{
  final List<User> users;
  final List<Reply> replies;

  SearchUserReply({required this.users, required this.replies});

  SearchUserReply find(String key){
    final userItems = users.where((e) => e.name.contains(key)).toList();
    final replyItems = replies.where((e) => e.result.contains(key)).toList();

    return SearchUserReply(users: userItems, replies: replyItems);
  }
}