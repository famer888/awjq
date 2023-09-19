import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awjq/theme/default.dart';
import 'package:awjq/utils/common.dart';
import 'package:awjq/utils/http.dart';

class XFileProgressToast extends StatefulWidget {
  XFileProgressToast({Key key, this.file, this.response}) : super(key: key);
  final XFile file;
  final Function(Map) response;

  @override
  State<XFileProgressToast> createState() => _XFileProgressToastState();
}

class _XFileProgressToastState extends State<XFileProgressToast> {
  String progress = CommonUtils.txt('scz');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _upData();
  }

  _upData() async {
    if (kIsWeb) {
      var res = await PlatformAwareHttp.xfileBytesUploadMp4(
        file: widget.file,
        position: 'upload',
        progressCallback: (count, total) {
          CommonUtils.debugPrint("---${count}--${total}");
          Future.delayed(Duration(milliseconds: 1000)).then((value) {
            var tmp = (count / total * 100).toInt();
            if (tmp % 1 == 0) {
              progress = "${CommonUtils.txt('scz')} ${tmp}%";
              setState(() {});
            }
          });
        },
      );
      if (widget.response != null) widget.response(jsonDecode(res));
    } else {
      var res = await PlatformAwareHttp.xfileUploadMp4(
        file: widget.file,
        position: 'upload',
        progressCallback: (count, total) {
          var tmp = (count / total * 100).toInt();
          if (tmp % 1 == 0) {
            progress = "${CommonUtils.txt('scz')} ${tmp}%";
            setState(() {});
          }
        },
      );
      if (widget.response != null) widget.response(jsonDecode(res));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(54, 54, 54, 0.8),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      height: ScreenUtil().setWidth(110),
      width: ScreenUtil().setWidth(110),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40.w,
            height: 40.w,
            child: CircularProgressIndicator(
              color: GQStyle.jellyCyanColor103224185,
              strokeWidth: 1.w,
            ),
          ),
          SizedBox(height: 10.w),
          Text(progress, style: GQStyle.white255_14)
        ],
      ),
    );
  }
}
