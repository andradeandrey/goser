using Go = import "go.capnp";
using Lua = import "lua.capnp";

$Go.package("capnp");
$Go.import("capnp");

@0xe6860092ff3f0a59;

using import "country.capnp".Country;

struct HTTP {
	protocol @0 :Protocol;
	enum Protocol {
		unknown @0;
		http10 @1;
		http11 @2;
		max @3;
	}

	status @1 :UInt16;

	hostStatus @2 :UInt16;

	upStatus @3 :UInt16;

	method @4 :Method;
	enum Method {
		unknown @0;
		get @1;
		post @2;
		delete @3;
		put @4;
		head @5;
		purge @6;
		options @7;
		propfind @8;
		mkcol @9;
		patch @10;
		max @11;
	}

	contentType @5 :Text;
	userAgent @6 :Text;
	referer @7 :Text;
	requestURI @8 :Text;
}

enum CacheStatus {
	unknown @0;
	miss @1;
	expired @2;
	hit @3;
	max @4;
}

struct Origin {
	ip @0 :Data $Go.jsonfmt(pkg="net", fmt="net.IP(s).String()");
	port @1 :UInt16;
	hostname @2 :Text;
	protocol @3 :Protocol;
	enum Protocol $Lua.naming("lower_underscore") {
		unknown @0;
		http @1;
		https @2;
		max @3;
	}
}

enum ZonePlan {
	unknown @0 $Go.tag("");
	free @1 $Go.tag("Free");
	pro @2 $Go.tag("Pro");
	biz @3 $Go.tag("Business");
	ent @4 $Go.tag("Enterprise");
	max @5;
}

struct Log {
	timestamp @0 :Int64;
	zoneId @1 :UInt32;
	zonePlan @2 :ZonePlan;
	http @3 :HTTP;
	origin @4 :Origin;
	country @5 :Country;
	cacheStatus @6 :CacheStatus;
	serverIp @7 :Data $Go.jsonfmt(pkg="net", fmt="net.IP(s).String()");
	serverName @8 :Text;
	remoteIp @9 :Data $Go.jsonfmt(pkg="net", fmt="net.IP(s).String()");
	bytesDlv @10 :UInt64;
	rayId @11 :Text;
}
