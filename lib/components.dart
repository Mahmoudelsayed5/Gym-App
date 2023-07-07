import 'package:flutter/material.dart';
import '../colors.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required String hint,
  bool? isPassword = false,
  bool? suffix = false,
  String? Function(String?)? validator,
  Function(String)? onSubmit,
  Function(String)? onChanged,
  Function()? suffixPressed,
  InputBorder? border,
  TextInputType? textInputType,
  Color? hintTexColor,
  Color? textStyle,
}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 15.0),
  child: Stack(
    alignment: Alignment.centerRight,
    children: [
      TextFormField(
        controller: controller,
        keyboardType: (hint == "Username") ? TextInputType.text :
        (hint == "Password" || hint == "ConfirmPassword") ? TextInputType.visiblePassword :
        (hint == "Email") ? TextInputType.emailAddress : textInputType,
        style: TextStyle(color: textStyle ?? TextColors.whiteText),
        textAlign: TextAlign.center,
        obscureText: isPassword!,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: hintTexColor ?? TextColors.whiteText,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: BackgroundColors.whiteBG
            )
          ),
          enabledBorder: border ?? const UnderlineInputBorder(
            borderSide: BorderSide(
              color: BackgroundColors.whiteBG
            )
          ),
        ),
      ),
      Visibility(
          visible: suffix! ? true : false,
          child: IconButton(
            onPressed: suffixPressed,
            icon: isPassword ? const Icon(Icons.remove_red_eye_outlined, color: BackgroundColors.whiteBG) :
                               const Icon(Icons.visibility_off_outlined, color: BackgroundColors.whiteBG)
          )
      )
    ],
  ),
);

Widget titleText({
  required String text,
  double? size = 25,
  FontWeight? fontWeight = FontWeight.bold,
  Color? color = TextColors.whiteText,
  TextAlign? textAlign = TextAlign.center,
}) => Text(
  text,
  textAlign: textAlign,
  style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color
  ),
);

Widget subTitleText({
  required String text,
  double? size = 20,
  FontWeight? fontWeight = FontWeight.w500,
  Color? color = TextColors.whiteText,
  TextAlign? textAlign = TextAlign.center,
  int? maxLines = 2,
  TextOverflow? textOverflow
}) => Text(
  text,
  textAlign: textAlign,
  style: TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    color: color,
  ),
  maxLines: maxLines,
  overflow: textOverflow,
);

Widget paragraphText({
  required String text,
  double? size = 15.0,
  FontWeight? fontWeight = FontWeight.w400,
  Color? color = TextColors.whiteText,
  TextAlign? textAlign = TextAlign.center,
  int? maxLines = 2,
  TextOverflow? textOverflow
}) => Text(
  text,
  textAlign: textAlign,
  style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color
  ),
  maxLines: maxLines,
  overflow: textOverflow,
);

Widget defaultDropDownMenu({
  required List<String> content,
  required String value,
  Function(String?)? function,
  Color? textColor,
  Color? backgroundColor
}) => DropdownButton<String>(
    dropdownColor: backgroundColor ?? BackgroundColors.whiteBG,
    underline: Container(),
    isExpanded: true,
    value: value,
    items: content
        .map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: subTitleText(text: value, color: textColor ?? TextColors.blackText),
        ),
      );
    }).toList(),
    onChanged: function
);

Widget defaultInkWell({
  required final String title,
  required final Widget subtitle,
  required final Widget child,
  required final Function() function,
  required final String image,
  double? borderRadius,
  double? width,
  bool? recommended = false,
}) => InkWell(
  onTap: function,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: width,
      height: 110,
      decoration: BoxDecoration(
          color: BackgroundColors.inkWellBG,
          borderRadius: BorderRadius.circular(borderRadius ?? 10)
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
                child: Image.asset(image)),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleText(text: title),
                    Visibility(
                        visible: (recommended!) ? true : false,
                        child: paragraphText(text: "Recommended", color: TextColors.recommendedText)
                    )
                  ],
                ),
                subtitle,
                child
              ],
            ),
          ],
        ),
      ),
    ),
  ),
);

Widget defaultDialog({
  required BuildContext context,
  required Widget title,
  required Widget body,
  required bool quickExit,
  required bool setBackIcon,
  required bool setNextIcon,
  required bool cancelButton,
  Function()? prevDialog,
  Function()? nextDialog,
}) => Column(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
  children: [
    Dialog(
      backgroundColor: BackgroundColors.dialogBG,
      child: Column(
        children: [
          //title
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //back button
              Visibility(
                visible: (setBackIcon) ? true : false,
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: BackgroundColors.whiteBG,
                    ),
                    onPressed: prevDialog
                ),
              ),
              //title
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: title
              ),
            ],
          ),
          //content required
          body,
          //next button or confirm
          Visibility(
            visible: (setNextIcon) ? true : false,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: nextDialog,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Next',
                        style: TextStyle(
                            color: TextColors.whiteText,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Icon(Icons.chevron_right, color: TextColors.whiteText,)
                    ],
                  )
              ),
            ),
          ),
        ],
      ),
    ),
    Visibility(
        visible: (cancelButton) ? true : false,
        child: DefaultButton(
          function: (){
            Navigator.pop(context);
          },
          backgroundColor: Colors.red,
          text: "Cancel",
        )
    )
  ],
);

class DefaultButton extends StatefulWidget{
  final Function() function;
  final String text;
  Color? textColor;
  double? borderRadius;
  double? width;
  double? height;
  Color? backgroundColor;
  double? borderWidth;
  Color? borderColor;
  bool? bigButton;
  DefaultButton({
    required this.function,
    required this.text,
    this.textColor,
    this.borderRadius,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderWidth,
    this.borderColor,
    this.bigButton
  });

  @override
  State<DefaultButton> createState() => _ButtonState();
}

class _ButtonState extends State<DefaultButton>{
  @override
  Widget build(BuildContext context) {
    //if values = null set default value
    widget.height ??=MediaQuery.of(context).size.height*.06;
    widget.width ??=MediaQuery.of(context).size.width*.4;
    widget.backgroundColor ??=BackgroundColors.button;
    widget.borderRadius ??=0;
    widget.borderWidth ??=0;
    widget.borderColor ??=Colors.transparent;
    widget.textColor ??=TextColors.whiteText;
    widget.bigButton ??=true;
    return SizedBox(
      width: widget.width,
      child: MaterialButton(
        height: widget.height,
        color: widget.backgroundColor,
        onPressed: widget.function,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          side: BorderSide(
            width: widget.borderWidth!,
            color: widget.borderColor!
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (widget.bigButton!) ? subTitleText(text: widget.text, color: widget.textColor) : paragraphText(text: widget.text, color: widget.textColor),
        )
      )
    );
  }
}