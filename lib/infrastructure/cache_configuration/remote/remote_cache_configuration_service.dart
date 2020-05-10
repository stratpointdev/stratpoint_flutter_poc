import 'package:globe_one_poc_project/domain/cache_configuration/entities/cache_configuration_details_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteCacheConfigurationService {
  final Firestore _firestore = Firestore.instance;

  Future<CacheConfigurationDetailsModel> getCacheInterval() async {
    final QuerySnapshot response =
        await _firestore.collection('cache-configuration').getDocuments();

    final List<DocumentSnapshot> documents = response.documents;

    if (documents.isEmpty) {
      print('Snapshot Empty...');
      return null;
    }

    return CacheConfigurationDetailsModel.fromJson(documents[0].data);
  }
}
