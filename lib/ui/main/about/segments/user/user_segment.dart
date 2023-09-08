import 'package:flutter/material.dart';
import 'package:flutter_androssy/widgets.dart';
import 'package:flutter_portfolio/core/contents/app_contents.dart';

part 'social_icon.dart';

class AboutUserDetailsSegment extends StatelessWidget {
  final String Function(String value) translate;
  final Color Function(Color value) themeColor;

  const AboutUserDetailsSegment({
    super.key,
    required this.translate,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      width: double.infinity,
      padding: 24,
      layoutGravity: LayoutGravity.center,
      children: [
        const ImageView(
          image:
              "https://media.licdn.com/dms/image/C4D03AQHk17MQXBeSAw/profile-displayphoto-shrink_800_800/0/1646826743327?e=2147483647&v=beta&t=EuIC-hw_Cy5YGDNQPWC66L_76IdAOB11woGCZs-7ujo",
          width: 90,
          shape: ViewShape.circular,
          cacheMode: true,
        ),
        TextView(
          marginTop: 16,
          text: translate("Md. Mohi-Uddin"),
          textColor: themeColor(Colors.black),
          textSize: 18,
          textFontWeight: FontWeight.w600,
        ),
        TextView(
          marginTop: 8,
          gravity: Alignment.center,
          text: translate(
              "UX/UI Designer | Accessibility expert | GOOGLE UX professional Certified"),
          textAlign: TextAlign.center,
          textColor: themeColor(Colors.black),
          textSize: 12,
          textFontWeight: FontWeight.w400,
        ),
        LinearLayout(
          marginTop: 32,
          width: double.infinity,
          orientation: Axis.horizontal,
          crossGravity: CrossAxisAlignment.end,
          children: [
            LinearLayout(
              flex: 1,
              layoutGravity: LayoutGravity.start,
              children: [
                TextView(
                  text: translate("Reach Me"),
                  textColor: themeColor(Colors.black),
                  textSize: 14,
                  textFontWeight: FontWeight.w600,
                ),
                TextView(
                  marginTop: 8,
                  text: translate("+880 1313670655"),
                  textColor: themeColor(Colors.black),
                  textSize: 12,
                  textFontWeight: FontWeight.w400,
                ),
                TextView(
                  text: translate("mohiuddin655.bd@gmail.com"),
                  textColor: themeColor(Colors.black),
                  textSize: 12,
                  textFontWeight: FontWeight.w400,
                ),
              ],
            ),
            LinearLayout(
              flex: 1,
              orientation: Axis.horizontal,
              layoutGravity: LayoutGravity.end,
              crossGravity: CrossAxisAlignment.end,
              children: [
                _SocialIcons(
                  icons: [
                    AppContents.icInstagram,
                    AppContents.icFacebook,
                    AppContents.icBehance,
                    AppContents.icLinkedin,
                    AppContents.icDribble,
                    Icons.supervised_user_circle,
                    Icons.supervised_user_circle_outlined,
                    Icons.supervised_user_circle_rounded,
                    Icons.supervised_user_circle_sharp,
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
