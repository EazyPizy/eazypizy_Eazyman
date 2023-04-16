import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Language extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'msg': 'Choose Your language',
          'language1': 'हिन्दी',
          'language2': 'English',
          'Continue':'Continue',
          'Next': 'Next',
          'Enter Your Mobile Number':'Enter Your Mobile Number',
          'Get Started':'Get Started',
          'Home':'Home',
          'Category':'Category',
          'Help':'Help',
          'Add Customer': 'Add Customer',
          'Search customer':'Search customer',
          'Get OTP':'Get OTP',
          'Mobile Number':'Mobile Number',
          'Enter OTP':'Enter OTP',
        },

        'hi_': {
          'msg': 'अपनी भाषा चुनें',
          'language1': 'Hindi',
          'language2': 'अंग्रेज़ी',
          'Continue':'जारी रखें',
          'Next':'अगला',
          'Enter Your Mobile Number': 'अपना मोबाइल नंबर दर्ज करें',
          'Get Started':'शुरू करो',
          'Home':'होम',
          'Category':'कैटेगरी',
          'Help':'सहायता',
          'Add Customer': 'ग्राहक जोड़ें',
          'Search customer':'ग्राहक खोजें',
          'Get OTP':'ओटीपी प्राप्त करें',
          'Mobile Number':'मोबाइल नंबर',
          'Enter OTP':'ओटीपी दर्ज करें',
        }

      };
}
