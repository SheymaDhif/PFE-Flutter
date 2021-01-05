import 'package:flutter_auth/models/learning_entity.dart';

learningEntityFromJson(LearningEntity data, Map<String, dynamic> json) {
	if (json['channel'] != null) {
		data.channel = new LearningChannel().fromJson(json['channel']);
	}
	if (json['feeds'] != null) {
		data.feeds = new List<LearningFeed>();
		(json['feeds'] as List).forEach((v) {
			data.feeds.add(new LearningFeed().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> learningEntityToJson(LearningEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.channel != null) {
		data['channel'] = entity.channel.toJson();
	}
	if (entity.feeds != null) {
		data['feeds'] =  entity.feeds.map((v) => v.toJson()).toList();
	}
	return data;
}

learningChannelFromJson(LearningChannel data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['description'] != null) {
		data.description = json['description']?.toString();
	}
	if (json['latitude'] != null) {
		data.latitude = json['latitude']?.toString();
	}
	if (json['longitude'] != null) {
		data.longitude = json['longitude']?.toString();
	}
	if (json['field1'] != null) {
		data.field1 = json['field1']?.toString();
	}
	if (json['field2'] != null) {
		data.field2 = json['field2']?.toString();
	}
	if (json['field3'] != null) {
		data.field3 = json['field3']?.toString();
	}
	if (json['field4'] != null) {
		data.field4 = json['field4']?.toString();
	}
	if (json['field5'] != null) {
		data.field5 = json['field5']?.toString();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['updated_at'] != null) {
		data.updatedAt = json['updated_at']?.toString();
	}
	if (json['last_entry_id'] != null) {
		data.lastEntryId = json['last_entry_id']?.toInt();
	}
	return data;
}

Map<String, dynamic> learningChannelToJson(LearningChannel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['description'] = entity.description;
	data['latitude'] = entity.latitude;
	data['longitude'] = entity.longitude;
	data['field1'] = entity.field1;
	data['field2'] = entity.field2;
	data['field3'] = entity.field3;
	data['field4'] = entity.field4;
	data['field5'] = entity.field5;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['last_entry_id'] = entity.lastEntryId;
	return data;
}

learningFeedFromJson(LearningFeed data, Map<String, dynamic> json) {
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['entry_id'] != null) {
		data.entryId = json['entry_id']?.toInt();
	}
	if (json['field1'] != null) {
		data.field1 = json['field1']?.toString();
	}
	return data;
}

Map<String, dynamic> learningFeedToJson(LearningFeed entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['created_at'] = entity.createdAt;
	data['entry_id'] = entity.entryId;
	data['field1'] = entity.field1;
	return data;
}