import 'package:flutter_auth/generated/json/base/json_convert_content.dart';
import 'package:flutter_auth/generated/json/base/json_field.dart';

class LearningEntity with JsonConvert<LearningEntity> {
	LearningChannel channel;
	List<LearningFeed> feeds;
}

class LearningChannel with JsonConvert<LearningChannel> {
	int id;
	String name;
	String description;
	String latitude;
	String longitude;
	String field1;
	String field2;
	String field3;
	String field4;
	String field5;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "last_entry_id")
	int lastEntryId;
}

class LearningFeed with JsonConvert<LearningFeed> {
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "entry_id")
	int entryId;
	String field1;

	/*LearningFeed.fromJson(Map<String, dynamic> json) {
		//id = (json['id'] == null) ? json['_id'] : json['id'];
		createdAt = json['created_at'];
		entryId = json['entry_id'];
		field1 = json['field1'];

	}*/
}
