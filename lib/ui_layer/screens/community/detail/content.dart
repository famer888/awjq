import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../domain/api_validator.dart';
import '../../../notifiers/home_config_notifier.dart';
import '../../../notifiers/user_notifier.dart';
import '../../../router/routes.dart';
import '../../common_widgets/follow_button.dart';
import '../../common_widgets/general_banner.dart';
import '../../common_widgets/my_image.dart';
import '../../common_widgets/post/content/like_collect_share_area.dart';

import '../../../../domain/domain.dart';
import '../../../../domain/enum.dart';
import '../../../../domain/model/topic_detail_model.dart';
import '../../../../domain/type_def.dart';
import '../../../utils/my_toast.dart';
import '../../common_widgets/post/content/comment_count.dart';
import '../../common_widgets/post/content/content.dart';
import '../../common_widgets/post/content/media.dart';
import '../../common_widgets/post/content/title.dart';
import '../../theme.dart';

import '../../../../report/ui_layer/report_gesture_detector.dart';

import '../../../../report/ui_layer/report_general_banner.dart';

class CommunityDetailContentView extends StatelessWidget {
  const CommunityDetailContentView({super.key, required this.data});

  final TopicDetail data;

  bool get isFish {
    return data.type == 'fish';
  }

  @override
  Widget build(BuildContext context) {
    // return isFish ? _fishContenWidgets(context, data) : _contenWidgets();//暂时隐藏，产品目前需要咸鱼和帖子详情UI显示一致
    return _contenWidgets();
  }

  Widget _fishContenWidgets(BuildContext context, TopicDetail data) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _userContenWidget(context, data),
          PostTitleView(
            topicTitle: data.title,
            viewCount: data.viewNum,
            createdAt: data.createdAt,
          ),
          PostContentView(
            content: data.content,
          ),
          SizedBox(height: 10.w),
          _ContactView(
            data: data,
          ),
          _LikeCollectShareArea(
            data: data,
          ),
          Divider(
            height: 1,
            thickness: 0.5.w,
            color: const Color(0xFF2a2a33),
          ),
          SizedBox(height: 20.w),
          PostCommentCountView(commentCount: data.commentNum ?? 0),
        ],
      ),
    );
  }

  Widget _userContenWidget(BuildContext context, TopicDetail data) {
    return Padding(
      padding: EdgeInsets.only(top: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReportGestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              UserCenterRoute('${data.user?.aff}').push(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: MyImage.network(
                    data.user?.thumb ?? '',
                    borderRadius: 25.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  data.user?.nickname ?? '',
                  style: MyTheme.white25508_16_M,
                ),
                SizedBox(width: 2.w),
                if (data.user?.agent == 1)
                  Icon(Icons.verified_sharp,
                      size: 14.w, color: const Color.fromRGBO(247, 208, 93, 1))
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 65.w,
            height: 25.w,
            child: Selector<UserNotifier, bool>(
              selector: (_, notifier) =>
                  notifier.userFollowingStatus.contains('${data.user?.aff}'),
              builder: (_, isFollowed, __) => FollowButton(
                isFollowed: isFollowed,
                onTap: () => context
                    .read<UserNotifier>()
                    .changeUserFollow('${data.user?.aff}'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _contenWidgets() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MyTheme.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TopAppsListWidget(),
          PostTitleView(
            topicTitle: data.title,
            viewCount: data.viewNum,
            createdAt: data.createdAt,
          ),
          PostContentView(
            content: data.content,
          ),
          SizedBox(height: 10.w),
          PostMediaView(
            medias: data.medias ?? [],
            unlockCoins: data.unlockCoins ?? 0,
          ),
          _ContactView(
            data: data,
          ),
          _LikeCollectShareArea(
            data: data,
          ),
          Divider(
            height: 1,
            thickness: 0.5.w,
            color: const Color(0xFF2a2a33),
          ),
          SizedBox(height: 20.w),
          PostCommentCountView(commentCount: data.commentNum ?? 0),
        ],
      ),
    );
  }
}

class _ContactView extends StatefulWidget {
  const _ContactView({required this.data});

  final TopicDetail data;

  @override
  State<_ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<_ContactView> {
  late final _domain = context.read<CommunityDomain>();

  Future<void> _pay() async {
    MyToast.showLoading();
    final result = await _domain.reqGetPostURL(id: widget.data.id ?? 0);
    MyToast.closeAllLoading();
    if (result.isValid) {
      if (mounted) {
        setState(() {
          widget.data.contact = result.data['contact'] ?? '';
          widget.data.isPay = 1;
        });
      }
    } else {
      MyToast.showText(text: result.msg ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    if (data.contact case final contact? when contact.isNotEmpty) {
      final unlockCoins = data.unlockCoins ?? 0;
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
        ),
        child: unlockCoins > 0 && contact.contains('***')
            ? Column(
                children: [
                  Container(
                    height: 75.w,
                    decoration: DottedDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4.w)),
                        shape: Shape.box,
                        color: MyTheme.cyanColor00edfd,
                        strokeWidth: 1.w),
                    alignment: Alignment.center,
                    child: Text(tr('lxfsyyc'),
                        style: MyTheme.blue80_14_M), //联系方式已隐藏，解锁后查看
                  ),
                  SizedBox(height: 10.w),
                  ReportGestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: _pay,
                    child: Container(
                      height: 40.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: MyTheme.gradient_90_114,
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      child: Text(
                        '$unlockCoins${tr('jbjslxfs')}', //金币解锁联系方式，点击支付金币解锁
                        style: MyTheme.white14Medium,
                      ),
                    ),
                  )
                ],
              )
            : contact.contains('111111')
                ? const SizedBox.shrink()
                : ReportGestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                        text: contact,
                      ));
                      MyToast.showText(text: tr('fzcglx')); //复制成功,快去联系吧
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            children: [
                              TextSpan(
                                text: tr('sjlxfs'), //楼主联系方式：
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: contact,
                                style: TextStyle(
                                  color: MyTheme.cyanColor00edfd,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: "【${tr('dwfz')}】", //点我复制
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _LikeCollectShareArea extends StatefulWidget {
  const _LikeCollectShareArea({required this.data});

  final TopicDetail data;

  @override
  State<_LikeCollectShareArea> createState() => _LikeCollectShareAreaState();
}

class _LikeCollectShareAreaState extends State<_LikeCollectShareArea> {
  late final _domain = context.read<CommunityDomain>();
  bool _isChangeLikeLoading = false;
  bool _isChangeCollectLoading = false;

  Future<void> _changeLike() async {
    if (_isChangeLikeLoading) return;
    _isChangeLikeLoading = true;

    try {
      final result = await _domain.communityTopicLike(
          id: '${widget.data.id}', type: MyLikeType.post);
      if (result.status == 1) {
        final oldValue = widget.data.isLike ?? 0;
        final newValue = oldValue == 0 ? 1 : 0;
        widget.data.isLike = newValue;

        if (mounted) {
          setState(() {});
        }
      } else {
        MyToast.showText(text: result.msg ?? '');
      }
    } catch (_) {}

    _isChangeLikeLoading = false;
  }

  Future<void> _changeCollect() async {
    if (_isChangeCollectLoading) return;
    _isChangeCollectLoading = true;

    try {
      final result =
          await _domain.communityTopicFavorite(id: '${widget.data.id}');
      if (result.status == 1) {
        final oldValue = widget.data.isFavorite ?? 0;
        final newValue = oldValue == 0 ? 1 : 0;
        widget.data.isFavorite = newValue;
        if (mounted) {
          setState(() {});
        }
      } else {
        MyToast.showText(text: result.msg ?? '');
      }
    } catch (_) {}

    _isChangeCollectLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: MyTheme.pagePadding, vertical: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          PostLikeButton(isLiked: widget.data.isLike == 1, onTap: _changeLike),
          SizedBox(width: 20.w),
          PostCollectButton(
              isCollected: widget.data.isFavorite == 1, onTap: _changeCollect),
          SizedBox(width: 20.w),
          PostShareButton(onTap: () {
            const MineShareToUserRoute().push(context);
          }),
        ],
      ),
    );
  }
}

class TopAppsListWidget extends StatefulWidget {
  const TopAppsListWidget();

  @override
  State<TopAppsListWidget> createState() => _TopAppsListWidgetState();
}

class _TopAppsListWidgetState extends State<TopAppsListWidget> {
  late final homeConfigNotifier = context.read<HomeConfigNotifier>();

  @override
  Widget build(BuildContext context) {
    return (homeConfigNotifier.config.postDetailAds ?? []).isNotEmpty
        ? ReportGeneralAppsListVidget(
            data: homeConfigNotifier.config.postDetailAds ?? [])
        : Container();
  }
}
