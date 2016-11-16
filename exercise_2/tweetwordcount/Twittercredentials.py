import tweepy

consumer_key = "XG8smiZVV3bLCM9FJHHbwTkD1";

consumer_secret = "oVzKthybDFdNA57Re0qzOALOIVtgsoDuXxMIOg6HWAwIxuISdq";

access_token = "4809297912-UtAraoE0R1Q0atdoYBeFRMKpvDmUI6mboYT10js";

access_token_secret = "JZc28NljCUI8gdSkVKMD5XplVjk0Xz03UvMoPoIIKMzda";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



