import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../values/app_assets.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';
import '../values/share_keys.dart';

class YourControlPage extends StatefulWidget {
  YourControlPage({Key? key}) : super(key: key);

  @override
  State<YourControlPage> createState() => _YourControlPageState();
}

class _YourControlPageState extends State<YourControlPage> {
  late SharedPreferences prefs;
  double SliderValue = 6;

  @override
  void initState() {
    super.initState();
    initDefaultValue(); // phải gọi lại hàm này nó mới set giá trị đã kéo thanh slider trước đó
  }
  //xét số khi kéo thanh slider
  initDefaultValue()async{
    prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(ShareKeys.counter) ?? 6;
    setState(() {
      SliderValue = value.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0, //xoá viền dưới của appbar
        title: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            "Your Control",
            style:
                AppStyles.h3.copyWith(color: AppColors.textColor, fontSize: 36),
          ),
        ),
        //inkwell là widget cho phép click sự kiện
        leading: InkWell(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setInt(ShareKeys.counter, SliderValue.toInt());
            Navigator.pop(context);
            // sự kiện ontap
            print("Back go HomePage");
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      // ------------------------------------------------------------------------
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Text(
              'How much to words one',
              style: AppStyles.h4.copyWith(
                  color: Color.fromARGB(255, 100, 100, 104), fontSize: 18),
            ),
            Spacer(),
            Text(
              '${SliderValue.toInt()}', // lấy số nguyên
              style: AppStyles.h4.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 200,
                  fontWeight: FontWeight.bold),
            ),
            Slider(
                value: SliderValue,
                min: 6,
                max: 100,
                // divisions: 95, cho các số thành số chẵn vd: 11.0
                divisions: 94,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    SliderValue = value;
                  });
                }),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              alignment: Alignment.centerLeft,
              child: Text(
                'Slide to set ',
                style: AppStyles.h4
                    .copyWith(color: AppColors.textColor, fontSize: 18),
              ),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
