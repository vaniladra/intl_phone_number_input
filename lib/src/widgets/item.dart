import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';
import 'package:intl_phone_number_input/src/utils/util.dart';

/// [Item]
class Item extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool useEmoji;
  final TextStyle textStyle;
  final bool withCountryNames;

  const Item({
    Key key,
    this.country,
    this.showFlag,
    this.useEmoji,
    this.textStyle,
    this.withCountryNames = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(width: 12.0),
          Icon(
            Icons.expand_more,
            color: textStyle.color,
          ),
          _Flag(
            country: country,
            showFlag: showFlag,
            useEmoji: useEmoji,
          ),
          SizedBox(width: 12.0),
          Text(
            '${(country?.dialCode ?? '').padRight(6, "   ")}',
            textDirection: TextDirection.ltr,
            style: textStyle,
          ),
          Container(
            width: 2,
            height: 28,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  final Country country;
  final bool showFlag;
  final bool useEmoji;

  const _Flag({Key key, this.country, this.showFlag, this.useEmoji})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return country != null && showFlag
        ? Container(
            child: useEmoji
                ? Text(
                    Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                    style: Theme.of(context).textTheme.headline5,
                  )
                : country?.flagUri != null
                    ? Image.asset(
                        country?.flagUri,
                        width: 32.0,
                        package: 'intl_phone_number_input',
                      )
                    : SizedBox.shrink(),
          )
        : SizedBox.shrink();
  }
}

