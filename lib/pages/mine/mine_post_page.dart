import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awjq/base/baseWidget.dart';
import 'package:awjq/model/homedata.dart';
import 'package:awjq/pages/mine/mine_user_center_post.dart';
import 'package:awjq/store/homeConfig.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/common.dart';
import 'package:awjq/utils/extensionlibrary.dart';
import 'package:provider/provider.dart';

class MinePostPage extends BaseWidget {
  MinePostPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> cState() {
    // TODO: implement cState
    return _MinePostPageState();
  }
}

class _MinePostPageState extends BaseWidgetState<MinePostPage> {
  @override
  void onCreate() {
    // TODO: implement onCreate
    setAppTitle(title: CommonUtils.txt("fbdtz"));
  }

  @override
  void onDestroy() {
    // TODO: implement onDestroy
  }

  @override
  Widget pageBody(BuildContext context) {
    // TODO: implement pageBody
    Member member = Provider.of<HomeConfig>(context, listen: true).member;
    return Column(
      children: [
        SizedBox(height: 10.w),
        Container(
          margin: EdgeInsets.symmetric(horizontal: GQStyle.pagePadding),
          padding: EdgeInsets.symmetric(horizontal: GQStyle.pagePadding),
          height: 100.w,
          decoration: BoxDecoration(
              color: Color(0xFF2a2a42),
              borderRadius: BorderRadius.all(Radius.circular(8.w))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  CommonUtils.txt('ktxsy') +
                      "：${member.incomeMoney}${CommonUtils.txt('jb')}",
                  style: GQStyle.white15),
              SizedBox(height: 10.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      context.push('/mineAgentToCashPage/0');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setWidth(30),
                      decoration: BoxDecoration(
                          gradient: GQStyle.gradient_90_114,
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(15))),
                      child: Text(
                        CommonUtils.txt('ljtx'),
                        style: GQStyle.white14,
                      ),
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      context.push('/minencomedetailed');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setWidth(30),
                      decoration: BoxDecoration(
                          gradient: GQStyle.gradient_90_114,
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(15))),
                      child: Text(
                        CommonUtils.txt('symx'),
                        style: GQStyle.white14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10.w),
        Expanded(child: MineUserCenterPost())
      ],
    );
  }
}
