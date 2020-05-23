class Torrent {
    String url;
    String hash;
    String quality;
    String type;
    int seeds;
    int peers;
    String size;
    int sizeBytes;
    DateTime dateUploaded;
    int dateUploadedUnix;

    Torrent({
        this.url,
        this.hash,
        this.quality,
        this.type,
        this.seeds,
        this.peers,
        this.size,
        this.sizeBytes,
        this.dateUploaded,
        this.dateUploadedUnix,
    });

    // factory Torrent.fromRawJson(String str) => Torrent.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Torrent.fromJson(Map<String, dynamic> json) => Torrent(
        url: json["url"] == null ? null : json["url"],
        hash: json["hash"] == null ? null : json["hash"],
        quality: json["quality"] == null ? null : json["quality"],
        type: json["type"] == null ? null : json["type"],
        seeds: json["seeds"] == null ? null : json["seeds"],
        peers: json["peers"] == null ? null : json["peers"],
        size: json["size"] == null ? null : json["size"],
        sizeBytes: json["size_bytes"] == null ? null : json["size_bytes"],
        dateUploaded: json["date_uploaded"] == null ? null : DateTime.parse(json["date_uploaded"]),
        dateUploadedUnix: json["date_uploaded_unix"] == null ? null : json["date_uploaded_unix"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "hash": hash == null ? null : hash,
        "quality": quality == null ? null : quality,
        "type": type == null ? null : type,
        "seeds": seeds == null ? null : seeds,
        "peers": peers == null ? null : peers,
        "size": size == null ? null : size,
        "size_bytes": sizeBytes == null ? null : sizeBytes,
        "date_uploaded": dateUploaded == null ? null : dateUploaded.toIso8601String(),
        "date_uploaded_unix": dateUploadedUnix == null ? null : dateUploadedUnix,
    };
}
