import 'package:flutter_auth/generated/json/base/json_convert_content.dart';
import 'package:flutter_auth/generated/json/base/json_field.dart';

class BetaEntity with JsonConvert<BetaEntity> {
	BetaChannel channel;
	List<BetaFeed> feeds;

	BetaEntity({this.channel, this.feeds});
	factory BetaEntity.fromJson(Map<String, dynamic> json) {
		return BetaEntity(
			channel: json['channel'],
			feeds: json['feeds'],
		);
	}
}

class BetaChannel with JsonConvert<BetaChannel> {
	int id;
	String name;
	String description;
	String latitude;
	String longitude;
	String field1;
	String field2;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "updated_at")
	String updatedAt;
	@JSONField(name: "last_entry_id")
	int lastEntryId;

	BetaChannel({this.id, this.name,this.description,this.latitude,this.longitude,this.field1,this.field2,this.createdAt,this.lastEntryId,this.updatedAt});
	factory BetaChannel.fromJson(Map<String, dynamic> json) {
		return BetaChannel(
			id: json['id'],
			name: json['name'],
			description: json['description'],
			latitude: json['latitude'],
			longitude: json['longitude'],
			field1: json['field1'],
			field2: json['field2'],
			createdAt: json['createdAt'],
			updatedAt: json['updatedAt'],
			lastEntryId: json['lastEntryId'],
		);
	}
}

class BetaFeed with JsonConvert<BetaFeed> {
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "entry_id")
	int entryId;
	String field1;

	BetaFeed({this.createdAt, this.entryId,this.field1});
	factory BetaFeed.fromJson(Map<String, dynamic> json) {
		return BetaFeed(
			createdAt: json['createdAt'],
			entryId: json['entryId'],
			field1: json['field1'],
		);
	}
}