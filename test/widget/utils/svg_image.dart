import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

Finder findSvgImage(String assetName) {
  return find.byWidgetPredicate(
    (widget) =>
        widget is SvgPicture &&
        (widget.bytesLoader as SvgAssetLoader) // Here!
                .assetName ==
            assetName,
  );
}
