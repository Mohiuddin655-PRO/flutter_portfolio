part of 'user_segment.dart';

class _SocialIcons extends StatelessWidget {
  final List<dynamic> icons;

  const _SocialIcons({
    this.icons = const [],
  });

  @override
  Widget build(BuildContext context) {
    return LinearLayout(
      orientation: Axis.horizontal,
      children: icons.map((icon) {
        return IconView(
          marginStart: 8,
          icon: icon,
          borderRadius: 0,
          tint: Colors.black,
        );
      }).toList(),
    );

  }
}
