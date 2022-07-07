// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Settings {
  final int?  policydays;
  final int? updatedays;

  final int? clearqr_wait;

  final int? localscan_wait;
  final int? rating_reminder;
  final int? splash_time;

  

  Settings({this.policydays, this.updatedays, this.clearqr_wait, this.localscan_wait, this.rating_reminder, this.splash_time,}
  );

  factory Settings.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Settings(
      policydays: data?['check_policies_days'],
      updatedays: data?['check_update_days'],
      clearqr_wait: data?['clearqr_wait_sec'],
      localscan_wait: data?['localscan_time_sec'],
      rating_reminder: data?['rating_reminder_actions'],
      splash_time: data?['splash_time_sec'],

    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (policydays != null) "check_policies_days": policydays,
      if (updatedays != null) "check_update_days": updatedays,
      if (clearqr_wait != null) "clearqr_wait_sec": clearqr_wait,
      if (localscan_wait != null) "localscan_time_sec": localscan_wait,
       if(rating_reminder !=null) "rating_reminder_actions":rating_reminder,
      if (splash_time != null) "splash_time_sec": splash_time,
   
    };
  }
}