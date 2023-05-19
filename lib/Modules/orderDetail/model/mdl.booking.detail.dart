import 'package:eazypizy_eazyman/core/typedefs.dart';

class BookingDetailModel {
  final String? eazymen_id;
  final String? eazymen_name;
  final String? eazymen_location;
  final String? eazymen_fcm_token;
  final double? payment_tax;
  final double? payment_items_total;
  final double? payment_discount;
  final double? payment_total;
  final String? customer_id;
  final String? customer_name;
  final String? customer_address;
  final String? customer_phone;
  final String? customer_pincode;
  final String? customer_fcm_token;
  final String? customer_landmark;
  final String? booking_date;
  final String? booking_time;
  final String? booking_id;
  final int? booking_status;

  BookingDetailModel({
    this.eazymen_id,
    this.eazymen_name,
    this.eazymen_location,
    this.eazymen_fcm_token,
    this.payment_tax,
    this.payment_items_total,
    this.payment_discount,
    this.payment_total,
    this.customer_id,
    this.customer_name,
    this.customer_address,
    this.customer_phone,
    this.customer_pincode,
    this.customer_fcm_token,
    this.customer_landmark,
    this.booking_date,
    this.booking_time,
    this.booking_id,
    this.booking_status,
  });

  factory BookingDetailModel.fromMap(DynamicMap doc, String booking_id) =>
      BookingDetailModel(
        eazymen_id: doc['eazymen_id'],
        eazymen_name: doc['eazymen_name'],
        eazymen_location: doc['eazymen_location'],
        eazymen_fcm_token: doc['eazymen_fcm_token'],
        payment_tax: doc['payment_tax'],
        payment_items_total: doc['payment_items_total'],
        payment_discount: doc['payment_discount'],
        payment_total: doc['payment_total'],
        customer_id: doc['customer_id'],
        customer_name: doc['customer_name'],
        customer_address: doc['customer_address'],
        customer_phone: doc['customer_phone'],
        customer_pincode: doc['customer_pincode'],
        customer_fcm_token: doc['customer_fcm_token'],
        customer_landmark: doc['customer_landmark'],
        booking_date: doc['booking_date'],
        booking_time: doc['booking_time'],
        booking_id: booking_id,
        booking_status: doc['booking_status'],
      );

  DynamicMap toMap() => {
        'eazymen_id': eazymen_id,
        'eazymen_name': eazymen_name,
        'eazymen_location': eazymen_location,
        'eazymen_fcm_token': eazymen_fcm_token,
        'payment_tax': payment_tax,
        'payment_items_total': payment_items_total,
        'payment_discount': payment_discount,
        'payment_total': payment_total,
        'customer_id': customer_id,
        'customer_name': customer_name,
        'customer_address': customer_address,
        'customer_phone': customer_phone,
        'customer_pincode': customer_pincode,
        'customer_fcm_token': customer_fcm_token,
        'customer_landmark': customer_landmark,
        'booking_date': booking_date,
        'booking_time': booking_time,
        'booking_status': booking_status,
      };
}

// {
//       'products': [
//         cartData().products[0].toJson(),
//       ],
//       'eazymen_id': cartData().eazyMen.eazyManUid,
//       'eazymen_name': cartData().eazyMen.personalDetail!.firstName,
//       'eazymen_location': cartData().eazyMen.personalDetail!.city,
//       'eazymen_fcm_token': cartData().eazyMen.fcmToken,
//       'payment_tax': 0,
//       'payment_items_total': 299,
//       'payment_discount': 0,
//       'payment_total': 299,
//       'customer_id': customer.id,
//       'customer_name': customer.name,
//       'customer_address': customer.address,
//       'customer_phone': customer.phoneNumber,
//       'customer_pincode': customer.pincode,
//       'customer_fcm_token': customer.fcmToken,
//       'customer_landmark': 'landmark',
//       'booking_date': bookingDate.toString(),
//       'booking_time': bookingTime.toString(),
//       'booking_status': 0,
//     }
