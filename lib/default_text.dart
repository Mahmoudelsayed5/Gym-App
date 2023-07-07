import 'package:flutter/material.dart';
import '../colors_images.dart';


//Title text
class TitleText extends StatefulWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;

  const TitleText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.textAlign
  }) : super(key: key);

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: (widget.textAlign != null) ? widget.textAlign : TextAlign.center,
      style: TextStyle(
        fontSize: (widget.size != null) ? widget.size : 25,
        fontWeight: (widget.fontWeight != null) ? widget.fontWeight : FontWeight.bold,
        color: (widget.color != null) ? widget.color : MyColors.white
      ),
    );
  }
}


//Subtitle text
class SubTitleText extends StatefulWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const SubTitleText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.textOverflow
  }) : super(key: key);

  @override
  State<SubTitleText> createState() => _SubTitleText();
}

class _SubTitleText extends State<SubTitleText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: (widget.textAlign != null) ? widget.textAlign : TextAlign.center,
      style: TextStyle(
        fontSize: (widget.size != null) ? widget.size : 20,
        fontWeight: (widget.fontWeight != null) ? widget.fontWeight : FontWeight.w500,
        color: (widget.color != null) ? widget.color : MyColors.white
      ),
      maxLines: widget.maxLines,
      overflow: widget.textOverflow,
    );
  }
}


//paragraph text
class ParagraphText extends StatefulWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;


  const ParagraphText({
    Key? key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textOverflow,
    this.maxLines
  }) : super(key: key);

  @override
  State<ParagraphText> createState() => _ParagraphText();
}

class _ParagraphText extends State<ParagraphText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      textAlign: (widget.textAlign != null) ? widget.textAlign : TextAlign.left,
      style: TextStyle(
        fontSize: (widget.size != null) ? widget.size : 15,
        fontWeight: (widget.fontWeight != null) ? widget.fontWeight : FontWeight.w400,
        color: (widget.color != null) ? widget.color : MyColors.white
      ),
      maxLines: widget.maxLines,
      overflow: widget.textOverflow,
    );
  }
}
