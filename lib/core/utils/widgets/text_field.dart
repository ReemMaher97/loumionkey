
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils.export.dart';


class TextFieldApp extends StatelessWidget {
  final double? height;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final double? cursorWidth;
  final double? cursorHeight;
  final double? borderRadius;
  final double? borderSideWidth;
  final FocusNode? focusNode;
  final Color? cursorColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final bool? readOnly;
  final bool? enable;
  final bool? showCursor;
  final bool? obscureText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final bool? inputBorderFlag;

  const TextFieldApp({
    Key? key,
    this.height,
    this.maxLines,
    this.cursorWidth,
    this.cursorHeight,
    this.borderRadius,
    this.borderSideWidth =1.0,
    this.cursorColor,
    this.borderColor,
    this.inputFormatters,
    this.validator,
    this.readOnly ,
    this.showCursor,
    this.obscureText,
    this.onTap,
    this.onChanged,
    this.labelText,
    this.labelStyle,
    this.suffixIcon,
    required this.controller,
    this.enable = true, this.prefixIcon,
    this.inputBorderFlag = true,
    this.hintText,
    this.hintStyle, this.style, this.focusNode, this.keyboardType, this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        focusNode: focusNode,
        enabled: enable,
        maxLines: maxLines ?? 1,
        controller: controller,
        inputFormatters: inputFormatters ?? [] ,
        validator: validator ?? (value){return null;},
        readOnly:readOnly ??false,
        showCursor:showCursor ?? true,
        obscureText:obscureText ?? false,
        cursorWidth:cursorWidth ?? 1,
        cursorColor: cursorColor ?? ColorHelper.primaryColor,
        cursorHeight: cursorHeight ?? 20,
        style: style,
        onTap: onTap ?? (){},
        onChanged: onChanged ?? (text){},

        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
          //border: InputBorder.none,
          border:inputBorderFlag == false ? InputBorder.none: OutlineInputBorder(
            borderSide: BorderSide(color:borderColor?? ColorHelper.primaryColor2),
            borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: borderColor?? ColorHelper.primaryColor, width: borderSideWidth!),
            borderRadius: BorderRadius.circular(borderRadius ?? 2.0),
          ),
          hintText: hintText ?? '',
          hintStyle:hintStyle ?? const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: FontsHelper.cairo,
            fontWeight: FontWeight.w500,
          ),
          labelText: labelText,
          labelStyle:labelStyle ?? const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: FontsHelper.cairo,
            fontWeight: FontWeight.w500,
          ),

          suffixIcon:suffixIcon == null ? null : Padding(padding: const EdgeInsets.all(0.0), child: suffixIcon,),
          prefixIcon:prefixIcon == null ? null : Padding(padding: const EdgeInsets.all(0.0), child: prefixIcon,),

        ),
      ),
    );
  }
}


class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final double? height;
  final TextEditingController controller;
  final bool enableInteractiveSelection;
  final TextInputType? type;
  final int? maxLength;
  final bool radiusSide;
  final bool? obscureText;
  final bool enableInput;
  final bool showCursor;
  final bool isExpands;
  final bool isRTL ;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Color? fillColor;
  final Color? borderSideColor;
  final TextStyle? hintStyle;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final VoidCallback? onActionComplete;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final Widget? suffixIcon;
  final double? paddingIcon;
  final double marginHorizontal;
  final BorderRadius? borderRadius;
  const TextFieldWidget(
      {Key? key,
        required this.controller,
        required this.hintText,
        this.enableInteractiveSelection = true,
        this.type,
        this.maxLength,
        this.obscureText,
        this.enableInput = true,
        this.isRTL = true,
        this.maxLines,
        this.prefixIcon,
        this.radiusSide = true,
        this.validator,
        this.margin,
        this.readOnly = false,
        this.onTap,
        this.onChanged,
        this.textAlign,
        this.onActionComplete,
        this.inputFormatters,
        this.width,
        this.suffixIcon,
        this.paddingIcon,
        this.marginHorizontal = 15.0,
        this.borderRadius,
        this.showCursor = false,
        this.height = 40.0,
        this.isExpands = false,
        this.fillColor,
        this.suffix,
        this.borderSideColor, this.hintStyle,
      }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  String text = "";

  @override
  void initState() {
    super.initState();

    text = widget.controller.text ;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:widget.isRTL ?  TextDirection.rtl:TextDirection.ltr,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: Theme.of(context).textTheme.bodyText2!.color,),
        child: Container(
          height: widget.height,
          width: widget.width ?? double.infinity,
          margin: widget.margin,
          child: Material(
            elevation: 16.0,
            borderRadius: widget.radiusSide
                ? widget.borderRadius ?? BorderRadius.circular(8.0)
                : const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0)),
            color: Colors.transparent,
            child: TextFormField(
              expands: widget.isExpands,
              controller: widget.controller,
              textDirection:widget.isRTL ?  TextDirection.rtl : TextDirection.ltr ,
              style: const TextStyle(color: Colors.black),
              enabled: widget.enableInput ,
              keyboardType: widget.type ?? TextInputType.text,
              autofocus: false,
              inputFormatters: widget.inputFormatters,
              maxLines: widget.type == TextInputType.multiline
                  ? null
                  : widget.maxLines ?? 1,
              textAlign: widget.textAlign ?? TextAlign.start,
              validator: widget.validator,
              readOnly: widget.readOnly ,
              showCursor: widget.showCursor,
              onChanged: (text) {
                setState(() {
                  this.text = text;
                });

                widget.onChanged?.call(text);
              },
              maxLength: widget.maxLength,
              obscureText: widget.obscureText ?? false,
              onTap: widget.onTap,
              cursorWidth: 2,

              ///onEditingComplete: widget.onActionComplete ?? () => FocusScope.of(context).nextFocus(),
              decoration: InputDecoration(
                errorStyle: const TextStyle(fontSize: 0.01,),

                hintTextDirection: widget.isRTL ? TextDirection.rtl : TextDirection.ltr,
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ??const TextStyle(color: Colors.black,fontSize: 18.0,fontFamily: FontsHelper.cairo),
                counterText:'',
                border: OutlineInputBorder(
                  borderRadius: widget.radiusSide
                      ? widget.borderRadius ?? BorderRadius.circular(8.0)
                      : const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(2)),

                disabledBorder: OutlineInputBorder(
                  borderRadius: widget.radiusSide
                      ? widget.borderRadius ?? BorderRadius.circular(8.0)
                      : const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color:ColorHelper.primaryColor ),
                  borderRadius: BorderRadius.circular(2),),
                errorBorder: OutlineInputBorder(
                  borderRadius: widget.radiusSide
                      ? widget.borderRadius ?? BorderRadius.circular(8.0)
                      : const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),

                filled: true,
                fillColor: widget.fillColor ??Theme.of(context).scaffoldBackgroundColor,
                prefixIcon: widget.prefixIcon,
                suffix:widget.suffix ,
                suffixIcon: widget.suffixIcon == null ? null : Padding(padding: const EdgeInsets.all(0.0), child: widget.suffixIcon,),
                contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

