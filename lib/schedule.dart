import 'package:flutter/material.dart';

class Schedule {
  
  static const List timeTable = [
    ["FLAT", "DA", "CN", "SE LAB"],
    ["CN", "CG", "WT", "AI", "IPR"],
    ["WT", "CG", "DA", "CN & WT LAB"],
    ["SE", "FLAT", "CG", "WT", "AI"],
    ["DA", "CN", "SE", "ACS LAB"],
    ["CG", "SE", "FLAT", "DA", "IPR"],
  ];

  static int getToday(){
    return DateTime.now().weekday ;
  }

  static String  getURL(String sub){
    switch (sub) {
      case "FLAT":
      {
        return "https://us04web.zoom.us/j/3417181233?pwd=MzBjeFVLb0hVbmNpNTU4dnJ5TXZhdz09";
      }
      case "DA":
      {
        return "https://us04web.zoom.us/j/6747432909?pwd=hKYZStqYNWZsvgZCBOPGegNgh_g4";
      }
      case "CN":
      {
        return "https://us04web.zoom.us/j/8862298646?pwd=azhObVpxb1VOMndWWHRhLzAxcjlPUT09";
      }
      case "SE LAB":
      {
        return "https://us04web.zoom.us/j/4626783045?pwd=UENOdFBoeXVqWVk4RmEvN29nSUxodz09";
      }
      case "CG":
      {
        return "https://us04web.zoom.us/j/4250220213?pwd=dEUyWkNXeWlXYStTZ3B6cytMRkpQdz09";
      }
      case "IRS":
      {
        return "0";
      }
      case "WT LAB":
      {
        return "https://us04web.zoom.us/j/7780734810?pwd=ZHhSeHl6YlFLTm9KV1EwUDltUDBpdz09";
      }
      case "WT":
      {
        return "https://us04web.zoom.us/j/7780734810?pwd=ZHhSeHl6YlFLTm9KV1EwUDltUDBpdz09";
      }
      case "AI":
      {
        return "https://us04web.zoom.us/j/8084558411?pwd=QzlsK1dWc3lYOHRSL1BSUkVwb3Q2dz09";
      }
      case "IPR":
      {
        return "https://us04web.zoom.us/j/2821504320?pwd=T2I1RkVKeVNqandvaFFIdDJEOTU5QT09";
      }
      case "ACS LAB":
      {
        return "https://us04web.zoom.us/j/79487874455?pwd=RnpBL0hSby9DT2xtaWkrckVXLzZEdz09";
      }
      case "SE":
      {
        return "https://us04web.zoom.us/j/4626783045?pwd=UENOdFBoeXVqWVk4RmEvN29nSUxodz09";
      }
      default: return "0";
    }
  }

  static  Widget getDate(int i) {
    switch (i) {
      case 0:
        {
          return const Text("Monday",);
        }
      case 1:
        {
          return const Text("Tuesday",);
        }
      case 2:
        {
          return const Text("Wednesday",);
        }
      case 3:
        {
          return const Text("Thursday",);
        }
      case 4:
        {
          return const Text("Friday",);
        }
      case 5:
        {
          return const Text("Saturday",);
        }
      default:
        {
          return const Text("SomeDay",);
        }
    }
  }}
