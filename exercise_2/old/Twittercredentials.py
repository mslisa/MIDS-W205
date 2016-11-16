import tweepy

consumer_key = "XG8smiZVV3bLCM9FJHHbwTkD1";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "oVzKthybDFdNA57Re0qzOALOIVtgsoDuXxMIOg6HWAwIxuISdq";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "4809297912-UtAraoE0R1Q0atdoYBeFRMKpvDmUI6mboYT10js";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "JZc28NljCUI8gdSkVKMD5XplVjk0Xz03UvMoPoIIKMzda";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



