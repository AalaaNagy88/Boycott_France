import 'package:flutter/material.dart';

class CountryNameScreen extends StatefulWidget {
  final String barcode;

  CountryNameScreen({this.barcode});

  @override
  _CountryNameScreenState createState() => _CountryNameScreenState();
}

class _CountryNameScreenState extends State<CountryNameScreen> {
  String name;
  bool france;

  @override
  void initState() {
    super.initState();
    france = false;
    name = _productDetials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(france ? Icons.cancel : Icons.check_circle,
              color: france ? Colors.red : Colors.green,size: 100,),
          SizedBox(height: 50),
          Text(
            "هذا المنتج صنع فى $name",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }

  String _productDetials() {
    String temp = _countryDetector();
    if (temp == "مصر") {
      temp = temp + " " + _HaveAnyFranceRelation();
    }
    return temp;
  }

  String _countryDetector() {
    int countryKey = int.parse(widget.barcode.substring(0, 3));
    switch (countryKey) {
      case 622:
        return "مصر";
        break;
      case 380:
        return "بلغاريا";
        break;
      case 621:
        return "سوريا";
        break;
      case 623:
        return "بروناي";
        break;
      case 624:
        return "ليبيا";
        break;
      case 625:
        return "الأردن";
        break;
      case 626:
        return "إيران";
        break;
      case 630:
        return "قطر";
        break;
      case 629:
        return "الإمارات العربية المتحدة";
        break;
      case 628:
        return "المملكة العربية السعودية";
        break;
      default:
        return _checkInRange(countryKey);
        break;
    }
  }

  _HaveAnyFranceRelation() {
    int companyCode = int.parse(widget.barcode.substring(3, 9));
    switch (companyCode) {
      case 300238:
        setState(() {
          france = true;
        });
        return "بالشراكة مع فرنسا";
        break;
      default:
        return "";
        break;
    }
  }

  String _checkInRange(int countryKey) {
    if (countryKey >= 300 && countryKey <= 379) {
      setState(() {
        france = true;
      });
      return "فرنسا";
    }
    if (countryKey >= 100 && countryKey <= 139)
      return "الولايات المتحدة الأمريكية";
    if (countryKey >= 400 && countryKey <= 440) return "ألمانيا";
    if (countryKey >= 450 && countryKey <= 459 ||
        countryKey >= 490 && countryKey <= 499) return "اليابان";
    if (countryKey >= 460 && countryKey <= 469) return "روسيا";
    if (countryKey >= 500 && countryKey <= 509) return "المملكة المتحدة";
    if (countryKey >= 520 && countryKey <= 521) return "اليونان";
    if (countryKey >= 868 && countryKey <= 869) return "تركيا";
    if (countryKey >= 690 && countryKey <= 699)
      return "الصين";
    else
      return "";
  }
}
