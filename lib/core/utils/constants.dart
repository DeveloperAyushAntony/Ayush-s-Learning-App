import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//height Sized box
const kHeight5 = SizedBox(height: 5);
const kHeight10 = SizedBox(height: 10);
const kHeight15 = SizedBox(height: 15);
const kHeight20 = SizedBox(height: 20);
const kHeight25 = SizedBox(height: 25);
const kHeight30 = SizedBox(height: 30);
const kHeight35 = SizedBox(height: 35);
const kHeight45 = SizedBox(height: 45);
const kHeight65 = SizedBox(height: 45);
const kHeight80 = SizedBox(height: 80);
const kHeight120 = SizedBox(height: 120);

//Width Sizedbox
const kWidth10 = SizedBox(width: 10);
const kWidth15 = SizedBox(width: 15);
const kWidth20 = SizedBox(width: 20);
const kWidth30 = SizedBox(width: 30);
const kWidth35 = SizedBox(width: 35);
const kWidth40 = SizedBox(width: 40);
const kWidth45 = SizedBox(width: 45);
const kWidth50 = SizedBox(width: 50);
const kWidth55 = SizedBox(width: 55);

const kWidth80 = SizedBox(width: 80);
const kWidth105 = SizedBox(width: 65);
const kWidth120 = SizedBox(width: 120);
//base url
const baseUrl="https://youtube.googleapis.com/youtube/v3/search?part=snippet&channelId=";
const appendUrl="https://https://www.youtube.com/watch?v=";
   final  apiKey = dotenv.env['YOUTUBE_API_KEY']!;
final channelId = dotenv.env['CHANNEL_ID']!;