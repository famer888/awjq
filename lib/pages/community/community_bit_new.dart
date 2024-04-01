import 'package:flutter/material.dart';
import 'package:awjq/components/common/pullrefreshlist.dart';
import 'package:awjq/components/page_status.dart';
import 'package:awjq/pages/community/community_bit_post.dart';
import 'package:awjq/pages/community/community_post.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/api.dart';

class CommunityBitNew extends StatefulWidget {
  CommunityBitNew(
      {Key key, this.id = 0, this.sort = "new", this.type = "", this.call})
      : super(key: key);
  final int id;

  final String sort;
  final String type;
  final Function(dynamic) call;

  @override
  State<CommunityBitNew> createState() => _CommunityBitNewState();
}

class _CommunityBitNewState extends State<CommunityBitNew> {
  int page = 1;
  bool noMore = false;
  bool networkErr = false;
  bool isHud = true;
  List<dynamic> data = [];
  List<dynamic> topics = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    bitSortList(id: widget.id, sort: widget.sort, page: page).then((res) {
      if (res.data == null) {
        networkErr = true;
        setState(() {});
        return;
      }
      List st = List.from(res.data["posts"] ?? []);
      if (page == 1) {
        noMore = false;
        data = st;
        if (widget.call != null) widget.call(res.data);
      } else if (st.length > 0) {
        data.addAll(st);
      } else {
        noMore = true;
      }
      isHud = false;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return networkErr
        ? PageStatus.noNetWork(onTap: () {
            networkErr = false;
            _getData();
          })
        : isHud
            ? PageStatus.loading(mounted)
            : data.isEmpty
                ? PageStatus.noData()
                : PullRefreshList(
                    onRefresh: () {
                      page = 1;
                      _getData();
                    },
                    onLoading: () {
                      page++;
                      _getData();
                    },
                    isAll: noMore,
                    child: ListView.builder(
                        padding:
                            EdgeInsets.symmetric(vertical: GQStyle.pagePadding),
                        itemCount: 1, //标签+帖子
                        itemBuilder: (context, index) {
                          return CommunityBitPost(data: data);
                        }),
                  );
  }
}
