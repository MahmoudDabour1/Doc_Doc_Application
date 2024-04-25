import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot.dart';
import 'package:time_slot/time_slot_from_interval.dart';

import '../../../../core/utils/app_colors.dart';

class AppointmentScreen extends StatefulWidget {
   AppointmentScreen({super.key});
  int selectTime = 0;

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    int activeStep = 3;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EasyStepper(
            activeStep: activeStep,
            steps: [
              EasyStep(
                customStep: Container(
                  child: Text(
                    "1",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                title: 'Waiting',
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor:
                        activeStep >= 1 ? Colors.orange : Colors.white,
                  ),
                ),
                title: 'Order Received',
                topTitle: true,
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor:
                        activeStep >= 2 ? Colors.orange : Colors.white,
                  ),
                ),
                title: 'Preparing',
              ),
            ],
            onStepReached: (index) => setState(() => activeStep = index),
          ),
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              print(selectedDate.day);
              print(selectedDate.month);
            },
            headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              // dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff247CFF),
                      Color(0xff247CFF),
                    ],
                  ),
                ),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 1.sp,
            mainAxisSpacing: 1.sp,
            childAspectRatio: 1 / 0.5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
                6,
                (index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 14.h),
                      child: InkWell(
                        onTap: (){
                          print(index);
                          widget.selectTime = index;
                          setState(() {

                          });
                        },
                        child: Container(
                          width: 158.w,
                          height: 49.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              color: widget.selectTime==index?AppColors.normalBlue100:AppColors.normalGray30),
                          child: Center(
                              child: Text(
                            "08:00 AM",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color:  widget.selectTime==index?AppColors.normalWhite:AppColors.normalGray80,
                            ),
                          )),
                        ),
                      ),
                    )),
          ),
          // TimesSlotGridViewFromInterval(
          //   locale: "en",
          //   initTime: selectTime,
          //   crossAxisCount: 4,
          //   timeSlotInterval: const TimeSlotInterval(
          //     start: TimeOfDay(hour: 10, minute: 00),
          //     end: TimeOfDay(hour: 22, minute: 0),
          //     interval: Duration(hours: 1, minutes: 0),
          //   ),
          //   onChange: (value) {
          //     setState(() {
          //       selectTime = value;
          //       print(value);
          //     });
          //   },
          // ),
          Text(
            "AppointmentScreen",
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
