
namespace go aweme.pack.enumtype
namespace py aweme.pack.enumtype
enum AnchorState {
	VISIBLE = 0
	INVISIBLE = 1
	SELF_VISIBLE = 2
}

enum AnchorType {
	// wikipeida
	WIKIPEDIA = 0
	// MT 电商链接
	SHOP_LINK = 6
	// MT yelp锚点
	YELP = 8
	// MT TripAdvisor锚点
	TRIPADVISOR = 9
	//游戏
	GAME = 10
	//影视综艺
	MEDIUM = 11
	MT_MOVIE = 18
	DONATION = 19
	RESSO = 23
	TT_EFFECT = 28
	TT_TEMPLATE = 29
}

enum AnchorGeneralType {
	GENERAL_ANCHOR = 1
}

enum AnchorActionType {
	SHOOT = 1
}

enum BonusType {
	//元旦红包
	NewYear21 = 1
	//春晚红包
	SpringFestival = 2
}

enum BonusSource {
	//官方
	Office = 1
	//用户
	User = 2
}

// 同城引流场景枚举
enum NearbyGuideSceneType {
	// 主feed跳转标签
	NEARBY_RELATION_LABEL = 1
	// 搜索气泡
	NEARBY_SEARCH_BUBBLE = 2
	// 生服视频气泡
	NEARBY_LIFE_BUBBLE = 3
	// 4 待定
	NEARBY_PLACEHOLDER_4 = 4
	// 收藏气泡
	NEARBY_COLLECT_BUBBLE = 5
	// 订单相关
	NEARBY_ORDER_GUIDE = 6
	// 主feed button
	NEARBY_FEED_BUTTON = 7
	// 冷启landing到同城
	NEARBY_COLD_START_LANDING = 8
	// 极速版红包任务：跳同城浏览视频
	NEARBY_DLITE_UG_TASK = 9
	// 团购收藏未回访过用户首次路径教育
	GROUPON_COLLECT_PATH_EDU = 10
	// 消息tab拆分，生服订单消息
	TAB_NOTICE_LIFE_ORDER_MSG_REDDOT = 11
	// 主feed异地引导
	NEARBY_FEED_CITY_CARD = 12
	// 购买完成页异地引导
	NEARBY_ORDER_CITY_CARD = 13
	// 618活动引流
	NEARBY_618_ACTIVITY = 14
	// 新人券引流
	Nearby_NEW_COUPON = 15
	// 线下扫码承接 
	NEARBY_OFFLINE_POI = 16
	// 新人专区-气泡引流
	NEWBORN_ZONE_BUBBLE = 17
	// 新人专区-商详
	NEWBORN_ZONE_PRODUCT_DETAIL = 18
	// 营销暑期大促
	SUMMER_SALES = 19
	// 通用营销活动
	COMMON_MARKETING_CAMPAIGN = 20
	// 购买完成页引流卡片
    ORDER_FINISH_GUIDE_CARD = 21
    // 支付完成直接跳转
    AFTER_PAY = 22
	// 裂变红包页引流
	NEARBY_FISSION_COUPON = 23
	// 站外分享回流引流
	SHARE_REFLOW = 24
	// 线下商场气泡
	OFFLINE_MALL_BUBBLE = 25
	// 线下门店气泡
	OFFLINE_SHOP_BUBBLE = 26
	// 节假日气泡
	FESTIVAL_SEARCH_BUBBLE = 27
	FESTIVAL_LIFE_BUBBLE = 28
	// 周末气泡
	WEEKEND_SEARCH_BUBBLE = 29
	WEEKEND_LIFE_BUBBLE = 30
	// 华为全局搜索多端
	HUAWEI_GLOBAL_SEARCH = 31
	// 任务页
	TASK_PAGE = 32
	// 双列预请求
	NearbyFeedDualPreload = 33
	// 单列预请求
	NearbyFeedPreload = 34
	// poi频道卡跳同城
	Poi_Detail = 35
	// tab强化提醒
	TabNoticeStrength = 36
	// 抖极端任务页跳同城/团购tab
	LiteTaskPage = 37
	// 电商购后生服拉新
	EcomPaySuccessPage = 38
	// 三单任务
	ThreeTask = 39
}

enum AwemeDetailRequestSourceTypeEnum {
	// 未标记请求来源
	NONE = 0
	// 评论
	COMMENT = 1
	// 从长视频推荐tab(2tab页)相关场景进入详情页
	LONGVIDEO = 2
	// 私信场景
	IM = 3
	// push强插
	PUSH_INSERT = 4
	// 聚合页
	AGGREGATION_PAGE = 5
	// 消息页
	Notice = 90
	// slides回流页
	SLIDES_REFLOW = 200
}

enum CountStatusEnum {
	SUCCESS = 0
	FAIL = 1
}

enum PackLevelEnum {
	NONE = 0
	LITE = 1
	NORMAL = 2
	FULL = 3
	FILTER = 4
}

// 评论顶bar类型
enum CommentBarType {
	NONE = 0
	// 活动
	ACTIVITY = 1
	// 功能官宣
	ANNOUNCE = 2
}


// 评论顶bar优先级类型
enum CommentBarPriorityType {
	NONE = 0
	// 低
	LOW = 1000
	// 高
	HIGH = 2000
}


enum PackSourceEnum {
	NONE = 0
	CHALLENGE_DETAIL = 1
	CHALLENGE_AWEME = 2
	COMMENT_LIST = 3
	FAVORITE = 4
	FEED = 5
	HOTSEARCH_BILLBOARD = 6
	MUSIC_DETAIL = 7
	MUSIC_AWEME = 8
	PROFILE = 9
	PUBLISH = 10
	SEARCH = 11
	FANS_CLUB = 12
	FOLLOW_FEED = 13
	STORY = 14
	LIFE = 15
	CATEGORY_LIST = 16
	STICKER_DETAIL = 17
	STICKER_AWEME = 18
	MP_PLATFORM = 19
	MUSIC_LIST = 20
	SQUARE_FEED = 21
	WIDGET_FEED = 22
	CARD_LIST = 23
	IM_UNREAD_LIST = 24
	MICRO_APP_LIST = 25
	AWEME_DETAIL = 26
	MUSIC_RECOMMEND_LIST = 27
	POST = 28
	POI_AWEME = 29
	POI_AWEME_VERTICAL = 30
	BRAND_BILLBOARD = 31
	ECOMMERCE_FEED = 32
	ECOMMERCE_BOLT = 33
	MAGIC_ACTIVITY_AWEME = 34
	MAGIC_ACTIVITY_MUSIC = 35
	SEARCH_MUSIC_RECOMMEND_LIST = 36
	SEARCH_USER_RECOMMEND_LIST = 37
	SEARCH_CHALLENGE = 38
	SEARCH_MUSIC = 39
	SEARCH_USER = 40
	NOTICE_LIST = 41
	COLLECTION = 42
	COMMERCE_FIND_SECOND_FLOOR_AWEME = 43
	COMMERCE_FIND_SECOND_FLOOR_USER = 44
	FOLLOW_FEED_USER = 45
	COMMERCE_CHALLENGE_RELATED_ACCOUNT = 46
	NOTICE_DIGG_LIST = 47
	USER_RECOMMEND = 48
	DISCOVERY_MUSIC_LIST = 49
	HOTSEARCH_VIDEO_LIST = 50
	MISC_AWEME = 51
	MIX_DETAIL = 52
	MIX_COLLECTION = 53
	MIX_AWEME = 54
	MIX_PUBLISH = 55
	MIX_WEB = 56
	NEARBY_FEED = 57
	MIX_AWEME_WEB = 58
	REACT_INFO = 59
	NATIONAL_TASK = 60
	DIGG_LIST = 61
	FORWARD_LIST = 62
	MUSIC_STICKER = 63
	FAVORITE_LIST = 64
	CHANNEL_FEED = 65
	PUBLISH_SEARCH = 66
	FAMILIAR_FEED = 67
	COMMERICAL_MUSIC_LIST = 68
	COMMERICAL_USER_MUSIC_COLLECT = 69
	COMMERICAL_MUSIC_DETAIL = 70
	PRIVATE_PUBLISH = 71
	FAMILIAR_VIDEO_VISITOR_LIST = 72
	CREATOR_CENTER = 73
	//对外信息流
	OPEN_NEWS = 74
	FRIEND_FEED = 75
	FAMILIAR_UNREAD_USER_LIST = 76
	FAMILIAR_UNREAD_VIDEO_LIST = 77
	HOT_MUSIC_LIST = 78
	WEBCAST_ROOM_PACK = 79
	IM_GROUP_USER_LIST = 80
	USER_PROFILE = 81
	ARK_ANCHOR_DETAIL = 82
	// 长视频推荐feed
	LONG_VIDEO_FEED = 83
	// 相关长视频feed
	LONG_VIDEO_RELATIVE_FEED = 84
	UNFOLLOW_CONTACT = 85
	DOU_DISCOUNT_LIST = 86
	// For You
	USER_SUGGEST = 87
	// TikTok Analytics
	TIKTOK_ANALYTICS = 88
	// 抖音debug平台落地页
	DOUYIN_DEBUG_LANDING_PAGE = 89
	//抖音剪同款模板
	DOUYIN_ULIKE = 90
	FORWARD_LIST_V2 = 91
	// 长视频详情页
	LONG_VIDEO_DETAIL = 92
	// 客服平台用户信息中心
	KEFU_USER = 93
	// discover more sounds on music detail page
	MUSIC_DISCOVERY = 94
	//moments 需求，智能相册-时光故事
	MOMENT_AWEME = 95
	// 抖音回流页
	DOUYIN_REFLOW = 96
	// 任务台我的投稿视频页
	MISSION_PLATFORM_AWEME = 97
	// 抖音投稿不给谁看列表
	DOUYIN_DONT_SHARE_LIST = 98
	// 个人页道具列表关联视频请求
	PROFILE_EFFECT_TAB = 99
	// 直播任务
	LIVE_TASK = 100
	// 粉丝 列表 && 通用关系(拉黑、关注请求等) 列表
	COMMON_RELATION_LIST = 101
	// 2020年新快拍
	NEW_STORY_20 = 102
	DOUYIN_STORY_GUIDE = 103
	// BCF Video List
	BCF = 104
	// TIKTOK LITE STATUS FEED
	STATUS_FEED = 105
	FAMILIAR_ACTIVITY = 106
	// 公益
	WELFARE = 107
	// F项目B端个人主页
	FPROJECT_B_PROFILE = 108
	// 相关短视频feed
	SHORT_VIDEO_RELATIVE_FEED = 109
	// H项目query查询
	HPROJECT_D_QUERY = 110
	// 抖音运营任务视频排行列表
	OPERATION_TASK_AWEME = 111
	// 抖音运营任务详情页
	OPERATION_TASK_DETAIL = 112
	//抖音榜单音乐列表
	CHART_MUSIC_LIST = 114
	// feed长视频内流页
	HORIZONTAL_FEED = 115
	// 游戏落地页feed流
	TTGAME_FEED = 116
	//个人主页音乐列表
	ORIGINAL_MUSIC_LIST = 117
	// 抖音结束页——高热短视频列表
	END_PAGE_HOT_VIDEO_LIST = 118
	// 内流页个人页浮层
	LANDSCAPE_POST = 119
	// 住小帮抖音小程序 - 达人收益排行榜
	ZHUXIAOBANG_EXPERTS_INCOME_LIST = 120
	//同城圈子
	NEARBY_CIRCLE_FEED = 121
	//ug同城高线活动
	UG_MAJOR_ACTIVITY = 122
	// 热点内流&后台&运营
	HOTSPOT_LIST = 123
	// 问答验证
	QA_VERIFY = 124
	// 抖音专题系统
	DOUYIN_TOPIC = 125
	// 抖音青少年合集
	AWEME_MINOR_ALBUM = 126
	//未关注熟人换一换视频列表
	UNFOLLOW_FAMILIAR_VIDEO = 127
	// 投稿Feed
	INSPIRATION_FEED = 128
	// 直播动态
	LIVE_MOMENT = 129
	// 抖音关注列表
	DOUYIN_FOLLOWING_LIST = 130
	// dsp专区的榜单音乐
	DSP_CHART_MUSIC = 131
	// dsp专区的榜单关联视频
	DSP_CHART_AWEME = 132
	// dsp专区的推荐视频
	DSP_FEED_AWEME = 133
	// dsp专区的收藏音乐
	DSP_COLLECTION_MUSIC = 134
	// dsp专区的收藏关联视频
	DSP_COLLECTION_AWEME = 135
	// 电商中心化猜你喜欢
	SOPHON_GYLIKE = 136
	// 电商中心化猜你喜欢视频内流
	SOPHON_GYLIKE_INNER = 137
	// 旅游小程序视频流视频详情
	INDUSTRY_TRAVEL_VIDEO_INFO = 138
	DUET_AWEME = 139
	DUET_DETAIL = 140
	// K歌的歌曲列表
	KARAOKE_MUSIC_LIST = 141
	// dsp使用的场景
	DSP_FEED_MUSIC = 142
	//西瓜端内抖音小程序
	XIGUA_APPLET = 143
	//推人卡片
	USER_RECOMMEND_API = 144
	//新版poi收藏页面
	POI_COLLECTION_UPDATE = 145
	SERIES_DETAIL = 146
	SERIES_COLLECTION = 147
	SERIES_AWEME = 148
	SERIES_PUBLISH = 149
	SERIES_WEB = 150
	// 懂车帝搜索
	MOTOR_SEARCH = 151
	// 抖音电商后台-投放系统
	ECOP_RELEASE_PLAN = 152
	// 特效商城
	EFFECT_MALL = 153
	// 圈子2.0
	CIRCLE_FEED = 154
	GROOT_DEFAULT = 155
	// 统一送审平台Ark
	ARK = 156
	// 常看的人内流
	OFTEN_WATCH_FEED = 157
	// 关注feed用户头像未读色环内流
	FOLLOW_HEAD_UNREAD_FEED = 158
	// 本地生活营销活动
	NAMEK_MARKETING = 159
	// 学习feed
	LEARN_FEED = 160
	//朋友一起玩音乐模块
	FRIEND_PLAY_TOGETHER_MUSIC = 161
	// poi详情页高光视频
	POI_HIGHLIGHT = 162
	// 音乐宣推
	MUSIC_PROMOTION = 163
	// webpc相关视频模块
	WEBPC_RELATED_AWEME = 164
	// 抖音青少年订阅作者列表页
	DOUYIN_MINOR_SUBSCRIBING_LIST = 165
	// 青少年订阅推荐
	KY_MINOR_SUBSCRIBE_FEED = 166
	// 运营管理平台
	WEBCAST_ARSENAL_CONSOLE = 167
	// 跟拍数据列表
	FOLLOW_SHOT = 168
	//风控反诈中心
	ANTI_FRAUD_CENTER = 169
	//音乐播放器单曲页
	DSP_MUSIC_DETAIL = 170
	//直播获得个人页小视频
	WEBCAST_LIVE_VIDEOITEM = 171
	// 鲜时光TVfeed
	XIANSHIGUANG_FEED = 172
	// 朋友页黄点
	FAMILIAR_FEED_YELLOW_POINT = 173
	// 推荐feed相关推荐低Bar视频流
	RELATED_VIDEO_BAR = 174
	// 抖音青少年热点视频
	AWEME_MINOR_HOTSPOT = 175
	// 抖音青少年收藏视频
	AWEME_MINOR_COLLECT = 176
	// jumanji的feed场景
	JUMANJI_FEED = 177
	// jumanji的个人主页场景
	JUMANJI_PROFILE = 178
	//短剧最新最热榜单
	SERIES_BILLBOARD = 179
	// groot物种视频内流
	GROOT_SPECIES_LIST = 180
	// 校园日常feed
	SCHOOL_LIFE_FEED = 181
	// 本地生活券码归因
	NAMEK_CERT_ATTRIBUTE = 182
	//短剧推荐页
	SERIES_SUGGEST = 183
	// 抖音青少年通用打包
	AWEME_MINOR_COMMON = 184
	// 个人页短剧tab
	SERIES_PROFILE_TAB = 185
	//商业化技术-广告增长
	AD_GROWTH = 186
	// 电商音乐
	ECOMMERCE_MUSIC = 187
	// 抖音部分可见列表
	AWEME_PART_SEE_LIST = 188
	// 锚点机器人
	ANCHOR_ROBOT = 189
	// k歌页合唱tab
	DUET_SING_TAB = 190
	// 西瓜搜索接入抖音视频相关业务-脚本相关(如封面智能裁切)
	XIGUA_SEARCH_SCRIPT = 191
	// PC抖音 未登录关注tab 默认feed流
	DOUYIN_PC_DEFAULT_FOLLOW = 192
	// app开放合集管理入口
	MIX_APP = 193
	// at列表
	AT_LIST = 194
	// 熟人列表
	FAMILIAR_LIST = 195
	// 贴纸封面对应视频信息
    STICKER_COVER = 196
    // 电商罗盘
    SOPHON_COMPASS = 197
    // 抖音主页访客
    PROFILE_VISITOR = 198
    // 电商年货节百大品牌用户投稿视频列表
    ECOM_BRAND_ACTIVITY_POST_LIST = 199
    // 保险自营阵地获取视频列表
    INSURANCE_CAMP_LIST = 200
	// TikTok City Page
	CITY_PAGE = 201
    // 音乐评论搜索
    SEARCH_MUSIC_COMMENT = 202
    // 电商-商品详情页
    ECOM_PRODUCT_DETAIL = 203
    // 抖音促投稿
    PROMOTE_POST = 204
    // 种草feed
    WANNA_FEED = 205
    // 小说达人发文
    NOVEL_INFLUENCER = 206
    // 抖音视频找相似商品，特征提取
    DATA_ECOM_GRAPH = 207
	//个人主页音乐计数
	ORIGINAL_MUSIC_COUNT = 208
	// 魔方平台
	MAGIC_PLATFORM = 209
	// 番茄小说视频详情
	TOMATO_NOVEL_VIDEO_DETAIL = 210
	// 抖音商城
	AWEME_MALL = 211
    // 多闪附近feed
    DUOSHAN_NEARBY_FEED = 212
    // 抖开Open SDK
    OPEN_EXPORT_SDK = 213
    // 今日头条ugc链接卡片
    TOUTIAO_UGC_LINK = 214
	// Luna 用户收藏
	LUNA_COLLECTION_MUSIC = 215
	// 西瓜鲜时光审核
	XIGUA_TV_AUDIT = 216
	// dsp专区歌单音乐列表
	DSP_PLAYLIST_MUSIC = 217
	// 密友时刻 Feed
	CF_FEED = 218
	// 抖音知识播放器
    KNOWLEDGE_VIDEO = 219
    // 图片模版详情页_模版详情
    IMAGE_TEMPLATE_DETAIL = 220
    // 图片模版详情页_视频列表
    IMAGE_TEMPLATE_AWEME = 221
    // 百应短视频诊断
    BAIYING_VIDEO_DIAGNOSTIC = 222
	// 多闪推荐页
	DUOSHAN_RECOMMEND_FEED = 223
	// 抖音PC新首页
	DOUYIN_WEB_NEW_PAGE = 224
	// 经营助手【星耀】
	XINGYAO_BUSINESS_ASSISTANT = 225
	// 颜色心情
    COLOR_EMOTION = 226
	//合集推荐
    MIX_RECOMMEND = 227
    // luna 视音频混合推荐
    LUNA_VIDEO_MIX_FEED = 228
	// 机构团长
    INSTITUTION_CAPTAIN = 229
    // 游戏联运
    GAMECP = 230
    // 百科Feed
    BAIKE =231
    // 虚拟形象聚合页
    VIRTUAL_CHARACTER_COMBO = 232
    // 虚拟形象IM打包信息
    VIRTUAL_CHARACTER_IM_PACK = 233
    // 灵感Feed
    INSPIRATION_FEED_V2 = 234
    // mention feed
    MENTION_FEED = 235
    // 短剧pad场景
    SERIES_PAD = 236
    // 极光药械营销
    MED_TOOL = 237
    // 直播评论分享
    WEBCAST_COMMENT_SHARE = 238
    // ALLIGATOR 探索页
    ALLIGATOR_RECOMMEND_FEED = 239
    // ALLIGATOR 朋友页
    ALLIGATOR_FAMILIAR_FEED = 240
    // ALLIGATOR 个人页时刻
    ALLIGATOR_PROFILE_CF_FEED = 241
    // ALLIGATOR 个人页回忆
    ALLIGATOR_MEMORY_FEED = 242
    // 往年今日
    PAST_MEMORY = 243
    // 番茄畅听视频详情
    TOMATO_NOVELFM_VIDEO_DETAIL = 244
     // 番茄畅听作者主页
    TOMATO_NOVELFM_AUTHOR_PAGE = 245
	//西瓜端内小视频样式展示
	XIGUA_UGC_VIDEO = 246
	// 抖音来客-撮合-达人广场视频详情
    LIFE_ALLIANCE_TALENT_SQUARE = 247
    // 直播公告面板
    LIVE_ANNOUNCEMENT = 248
    // 直播预告
    LIVE_PREVIEW = 249
    // 道具好友列表
    STICKER_FRIEND_LIST = 250
    // 抖音青少年模式隐私作品列表
    MINOR_PRIVATE_PUBLISH = 251
    // 双肩包
    SHUANGJIANBAO = 252
    // 朋友在看
    FRIEND_WATCH  = 253
    // 中视频 相关视频
    MEDIUM_RELATED_VIDEO = 254
    // 图文详情页相关推荐feed流
    IMAGE_RELATED_FEED = 255
    // 长视频
    LONG_VIDEO = 256
    // 达人抖客红包
    DOUKE_REDPACK = 257
    //抖极逛街页feed流
    AWEME_LITE_GUANG = 258
    // 直播游戏社区
    WEBCAST_GAME_COMMUNITY = 259
    // 星图平台相关
    AD_STAR_PLATFORM = 260
    // 游戏大厅feed
    GAME_HALL_FEED = 261
    // tinker数据组件平台
    DP_TINKER_COMPONENT = 262
    // mv模板请求用户信息
    MV_TEMPLATE_DETAIL = 263
    // 抖音来客数据中心
    DATA_LIFE_MERCHANT = 264
    // 抖音送礼
    DOUYIN_GIFT = 265
    // 快闪
    FLASH_MOB = 266
    // 商城内流视频详情
    AWEME_MALL_DETAIL = 267
    // CQC图片集获取图片信息
    CQC_SOURCE = 268
    // Yumme Feed、搜索场景
    YUMME_FEED = 269
    // Yumme 详情页、个人页、分享回流页
    YUMME_DETAIL = 270
    // slides作品分clip接口
    AWEME_CLIPS = 271
    // 企业号企服中心创意灵感榜单
    AWEME_ENTERPRISE_CREATIVE_TOPN = 272
    // 生活服务团购达人中心
    LIFE_KEYUSER_CENTER = 273
    // 电商罗盘策略
    ECOM_COMPASS_STRATEGY = 274
	// 住小帮相关阅读挂载
	ZXB_AWEME_MOUNT = 275
    //菠萝视频红包
    SOCIAL_RED_PACKETS = 276
    // 推荐服务查询导流场景
    LUNA_DIVERSION_FOR_RECO = 277
    // 提醒回关朋友列表
    REMIND_FOLLOW_FRIEND = 278
    // 图书详情页视频打包
    BOOK_DETAIL_AWEME = 279
    // 本地生活服务商
    LIFE_PARTNER = 280
    // 抖店后台店铺装修
    DOUDIAN_DECORATION = 281
	// 视频问答贴纸详情页
	VIDEO_REPLY = 282
	// 数据平台生活服务热点运营品台
	DP_LIFE_SENTENCE = 283
	// 特效/挑战视频聚合
	AGGREGATION_FEED = 284
	// Kuafu热点运营平台
	KUAFU_HOT_SPOT = 285
	// 天窗
	SKY_LIGHT = 286
	// 聚合时刻 翻页场景
	CF_GROUP_FEED = 287
	// 兴趣社区
	INTEREST_GROUP = 288
	// 抖音开放平台数据看板
	OPENPLATFORM_SCREEN = 289
	// 抖极逛街赚钱
	INCENTIVE_SHOPPING_GOLD = 290
	// 文章私信
	ARTICLE_IM = 291
	// 动态背景图
	DYNAMIC_COVER = 292
	//橱窗视频商卡内短视频
	WINDOW_TAB = 293
	// Yumme 发现页合集
	YUMME_DISCOVERY = 294
	// 抖音生态问卷
	ECO_SYSTEM_QUESTION = 295
	// 半次元相关阅读挂载
	BCY_AWEME_MOUNT = 296
	// 抖极社交互动（金币赞）
	AWEME_LITE_SOCIAL_INTERACTION = 297
	// 极光医典词条
	AURORA_YIDIAN = 298
	// 抖极投稿道具挑战
	AWEME_LITE_CREATION_CHALLENGE = 299
	// 推荐页、朋友页分他他人主页卡片
    USER_PROFILE_CARD = 300
	// 节目中心化排播页
	VS_SUPERIOR_CENTER = 301
	// 关注提交
	COMMIT_FOLLOW = 302
	// 催更
	COMMIT_URGE = 303
	// 亚运会
	YAYUNHUI = 304
	// 零评内流
	COMMENT_ZERO_FEED = 305
	// 图文长标题自动生成图片
	AUTO_GEN_IMAGES = 306
	// 个人练歌房锚点聚合页
	WEBCAST_PERSONAL_KARAOKE = 307
	// 图文多码率分页
	IMAGES_MBITRATE_LOAD_MORE = 308
	// 中长视频-频道
	MEDIUM_CHANNEL_FEED = 309
	// K歌MV
	WEBCAST_KTV_MV = 310
	// 百应投稿管理
	BUYIN_ITEM_MANAGEMENT = 311
	// 社交传播-个人推荐视频列表
	RECOMMEND_VIDEO_FEED = 312
	// SEO场景
	SEO = 313
	//天窗内流
	SKY_LIGHT_FEED = 314
	// 稍后再看list
	WATCH_LATER_LIST = 315
	// 文娱内容付费商详页
    CONTENT_PAY_DETAIL = 316
	// 团购频道feed流
	GROUPON_FEED = 317
	// 抖音会员短视频
	SUBSCRIBE_SHORT_VIDEO = 318
	// 内容攻略运营后台
	STRATEGY_CONTENT_MANAGEMENT = 319
	// 西瓜详情页
	XIGUA_INFORMATION = 320
	// 西瓜作品列表
	XIGUA_VIDEO_LIST = 321
	// 西瓜创作者
	XIGUA_CREATOR = 322
	// 火龙果页
	PITAYA_24_SPRING = 323
	// 游客模式喜欢列表
	GUEST_LIKE_LIST = 324
	// 游客模式关注列表
	GUEST_FOLLOW_LIST = 325
	// 游客模式关注feed
	GUEST_FOLLOW_FEED = 326
	// 青模推荐feed
	MINOR_FEED = 327
	// 青模喜欢列表
	MINOR_LIKE_LIST = 328
	// 青模搜索
	MINOR_SEARCH = 329
	// 青模个人主页
	MINOR_USER_PROFILE = 330
	// 抖音搜索UGC问答
	SEARCH_UGC_WENDA = 331
	// 西瓜锚点七分屏
	XIGUA_ANCHOR = 332
	// 西瓜中长视频猜你喜欢
	XIGUA_GUESS_LIKE = 333
	// 抖音火山版激励
	HOTSOON_UG = 334
	// 新朋友关注通知列表
	NOTICE_FOLLOW_LIST = 335
	// 会员视频合集
    SUBSCRIBE_VIDEO_MIX = 336
	// 新朋友日常推人场景解锁后
    STORY24_RECOMMEND_DETAIL = 337
	// 短剧feed
	SERIES_FEED = 338
	// 短剧观看记录
	SERIES_WATCHED_LIST = 339
	// 短剧中心页单列feed
	SERIES_AWEME_FEED = 340
	// 抖音百科视频
	DOUYIN_BAIKE = 341
	// 抖音UGKK活动使用
	UG_KK = 342
	// 打卡锚点打卡视频feed
	CONTENT_POI_FEED = 343
	// 生活服务抖音来客极速版
	LIFE_LAIKE_LITE = 344
	// 抖音商城逛街feed
	AWEME_MALL_SHOPPING_FEED = 345
	// 个人页底部工具栏，安全审核详情页进入内流
	PERSONAL_BOTTOM_BAR = 346
	// 抖音放映厅
	AWEME_THEATER = 347
	// 生服双高内容案例库
	LIFE_BOOST_ITEM_EXAMPLE = 348
	// (内容输出)轻颜图文外流点赞状态
	OPEN_PIC_DIGG = 349
	// 短剧 AWEME 详情
	SERIES_AWEME_DETAIL = 350
	// 多闪兴趣发现feed
	DUOSHAN_DISCOVERY_FEED = 351
}

enum CommerceActivityTypeEnum {
	GESTURE_RED_PACKET = 1
	PENDANT = 2
}

enum ConstellationTypeEnum {
	/*
    白羊座(03.21------04.19)
    金牛座(04.20------05.20)
    双子座(05.21------06.21)
    巨蟹座(06.22------07.22)
    狮子座(07.23------08.22)
    处女座(08.23------09.22)
    天秤座(09.23------10.23)
    天蝎座(10.24------11.21)
    射手座(11.22------12.21)
    摩羯座(12.22------01.19)
    水瓶座(01.20------02.18)
    双鱼座(02.19------03.20)
  */
	UNKNOWN = 0
	BAIYANG = 1
	JINNIU = 2
	SHUANGZI = 3
	JUXIE = 4
	SHIZI = 5
	CHUNV = 6
	TIANCHENG = 7
	TIANXIE = 8
	SHESHOU = 9
	MOJIE = 10
	SHUIPING = 11
	SHUANGYU = 12
}

enum FavoriteListPermissionEnum {
	ALL_SEE = 0
	SELF_SEE = 1
	FRIEND_SEE = 2
}

enum ProfileVisitorPermissionEnum {
	NOT_SET = -1
	OFF = 0
	ON = 1
}

enum FollowStatusEnum {
	UNKNOWN = -1
	NONE = 0
	FOLLOW = 1
	MUTUAL = 2
	FOLLOWING_REQUEST = 4
}

enum GameTypeEnum {
	CATCH_FRUIT = 1
}

enum GenderEnum {
	UNKNOWN = 0
	MALE = 1
	FEMALE = 2
}

enum CloseFriendStatusEnum {
    UNKNOWN = 0
    CLOSE_FRIEND = 1
    REVERSE_CLOSE_FRIEND = 2
    MUTUAL_CLOSE_FRIEND = 3
}

enum InteractionTypeEnum {
	NONE = 0
	POI = 1
	VOTE = 3
	COMMENT = 4
	WIKI = 5
	DONATION = 6
	TEEN_PROTECTOR_VOTE = 7
	MENTION = 8
	HASH_TAG = 9
	STORY = 10
	LIVE_SCHEDULE = 11
	LOCAL_HASHTAG = 12
	TEXT = 13
	Groot = 14
	VIDEO_SHARE = 15
	REPLY_TO_AWEME = 16
	REPLY_TO_COMMENT = 17
	TAG_INTERACTION = 19
	COMMODITY_EVALUATION = 20
	SCAN_INTERACTION = 21
	ECOM_ACTIVITY_PREVIEW = 22
	SHARE_POST = 23
	FLASH_MOB = 24
    LIVE_SHARE = 25
	VIDEO_QUESTION_ANSWER = 26
	MUSIC = 27
	IM_GROUP = 28
	APPOINTMENT_STICKER = 29
}

enum VoteTypeEnum {
	VOTE = 0 // (默认)普通投票
	DANMAKU_VOTE = 1 // 弹幕投票
}

enum TextInteractionTypeEnum {
	MENTION = 1
	HASH_TAG = 2
	HOTSPOT_TAG = 3
}

enum TagInteractionTypeEnum {
	// 自定义
	TAG_INTERACTION_CUSTOM = 1
	TAG_INTERACTION_USER = 2
	TAG_INTERACTION_POI = 3
	TAG_INTERACTION_PRODUCT = 4
	TAG_INTERACTION_BRAND = 5
	// 6被占用，跳过
	TAG_INTERACTION_LIFE_CARD_IMAGE = 7
}

enum LyricTypeEnum {
	NONE = 0
	TRC = 1
	LRC = 2
	KRC = 3
	TXT = 4
	JSON = 10
	PREVIEW_TXT = 11
}

enum MediaTypeEnum {
	NONE = 0
	TEXT = 1
	PIC = 2
	GIF = 3
	VIDEO = 4
	PIC_LIST = 5
	STORY = 11
	VR = 12
	FORWARD = 21
	STORY_LIVE = 22
	STORY_PIC = 23
	CAROUSEL = 42
}

enum MixTypeEnum {
	NORMAL = 0
}

// 蒙层类型
enum MaskTypeEnum {
	// 举报
	REPORT = 1
	// 不喜欢
	DISLIKE = 2
}

enum LabelStyleEmum {
	// 自定义背景色
	CUSTOM_COLOR = 1
}

enum RelationLabelTypeEnum {
	// 你的关注
	FOLLOWING = 0
	// XXX 转发
	FROWARD = 1
	// 点赞用户列表(friends)
	DIGG_LIST = 2
	// 带头像的转发标签
	FORWARD_WITH_AVATAR = 3
	// 带头像的评论标签
	COMMENT_WITH_AVATAR = 4
	// 推荐关注标签
	RECOMMEND_FOLLOW = 5
	// MT label: Suggested account
	SUGGESTED_ACCOUNT = 6
	// MT label: Followed by %username
	FOLLOWED_BY_SINGLE = 7
	// MT label: Followed by %username + n others
	FOLLOWED_BY_MULTI = 8
	// MT label: Your contact
	YOUR_CONTACT = 9
	// MT label: From your contacts
	FROM_YOUR_CONTACTS = 10
	// MT label: People you may know
	PEOPLE_MAY_KNOW = 11
	// MT label: Your connections
	YOUR_CONNECTIONS = 12
	// MT label: Connected to you
	CONNECTED_TO_YOU = 13
	// MT label: Suggested for you
	SUGGESTED_FOU_YOU = 14
	// xxx也在关注了他
	FOLLOWED_BY_WITH_AVATAR = 15
	COMMON_FROM_DISTRICT = 16
	ANCHOR_FROM_HOTSPOT = 17
	// MT label: Following
	TT_FOLLOWING = 18
	// MT label: Recently followed
	TT_RECENTLY_FOLLOWED = 19
	// MT label: Your friend
	TT_YOUR_FRIEND = 20
	POI_NEARBY = 21
	// digg list
	DIGG_LIST_WITH_AVATAR = 22
	// MT label: Follows you
	TT_FOLLOWS_YOU = 23
	// MT Label: Connected on Twitter
	TT_TWITTER_CONNECTION = 24
	// ta的第一次投稿
	LABEL_FIRST_SUBMISSION = 25
	// 同城圈
	LABEL_NEARBY_CIRCLE = 26
	// 同城精选
	LABEL_NEARBY_CHOSEN = 27
	// 红包
	LABEL_RED_PACKET = 28
	//家乡，字段废弃，29已经使用
	LABEL_HOMETOWN = 29
	//家乡
	HOMETOWN_LABLE = 30
	// 校园圈
	LABEL_SCHOOL = 31
	// 红人榜
	LABEL_CELEBRITIES = 32
	// 标记朋友
	LABEL_MARK_FRIEND = 33
	// 朋友 feed 点赞互动标签，弹幕类型
	LABEL_FAMILIAR_FEED_DIGG_DETAIL = 34
	// 朋友 feed 点赞互动标签，聚合类型
	LABEL_FAMILIAR_FEED_DIGG_AGGREGATION = 35
	// 朋友 feed 评论互动标签，弹幕类型
	LABEL_FAMILIAR_FEED_COMMENT_DETAIL = 36
	// 朋友 feed 评论互动标签，聚合类型
	LABEL_FAMILIAR_FEED_COMMENT_AGGREGATION = 37
	// 朋友 feed 评论互动标签，弹幕类型，不露出详情
	LABEL_FAMILIAR_FEED_COMMENT_DETAIL_NOT_EXPOSE = 38
	// label on item in nearby tab
	LABEL_NEARBY_FEED_EXPOSURE = 39
	//催更激励标签
	LABEL_URGED_ITEM = 41
	// 视频上商品购买标签 买过Ta的商
	LABEL_PRODUCT_TAG = 43
	//视频上商品购买标签 常买Ta的商品
	LABEL_PRODUCT_TAG_OFTEN = 44
	// 同城好友
	LABEL_NEARBY_FRIEND = 45
	// 看过
	LABEL_YOU_SEE = 46
	// 你评论过
	LABEL_YOU_COMMENT = 47
	// 你点赞过
	LABEL_YOU_DIGG = 48
	// 本地直播
	LABEL_NEARBY_ROOM = 49
    // 知识收藏-集合
	LABEL_COLLECT_MIX_ITEMS = 50
    // 知识收藏-单作品
	LABEL_COLLECT_ITEM = 51
	// 共同兴趣推荐
	LABEL_COMMON_INTEREST  = 52
	// 来自同城标签V2
	LABEL_LIFE_FROM_NEARBY = 53
	// 关注引导
	LABEL_FOLLOW_GUIDE= 54
	//  密友时刻
    LABEL_CLOSE_FRIEND_MOMENT = 62
    // 时刻
    LABEL_MOMENT = 63
	//朋友在看-点赞
	LABEL_FRIEND_WATCH_DIGG = 70
	//朋友在看-mention
	LABEL_FRIEND_WATCH_MENTION = 71
	//朋友在看-message
	LABEL_FRIEND_WATCH_MSG = 72
	//来自探索-message
    LABEL_FROM_WANNA = 73
    //来自知识频道标签
    LABEL_FROM_KNOWLEDGE = 74
    //推荐视频给朋友-推荐
    LABEL_RECOMMEND_ITEM = 75
    //来自热点频道标签
    LABEL_FROM_HOTSPOT = 76
	// now题材密友作品标签
	LABEL_CLOSE_FRIEND_NOW = 77
	// 政务认证标签
	LABEL_GOV_CERTIFICATION = 78
	// 媒体认证标签
    LABEL_MEDIA_CERTIFICATION = 79
	// 热点频道视频标签
	LABEL_HOTSPOT = 80
	// 来自抗疫频道标签
	LABEL_FROM_COVID = 81
	// 已收藏未看完
	LABEL_COLLECTED_NOT_WATCH_FINISH = 82
	// 新密友时刻标签
	LABEL_CF_MOMENT_NEW = 83
	// 生活服务标签，与RelationLabelSubTypeEnum是一对多的关系
	LABEL_LIFE_BIZ = 91
	// 新校园，"你的同学"
	LABEL_NS_CLASSMATE  = 92
    // IM 分享标签
    LABEL_IM_SHARE = 93
	// 新校园，"校园圈"
	LABEL_NS_CIRCLE  = 94
	// 朋友页标签聚合点赞
	LABEL_FAMILIAR_AGGREGATE_DIGG = 95
	// 朋友也标签聚合评论   
    LABEL_FAMILIAR_AGGREGATE_COMMENT = 96
	// 朋友页标签评论详情
    LABEL_FAMILIAR_COMMENT_DETAIL = 97
	// 新朋友可见或密友可见标签
	LABLE_FRIEND_VISIBILITY = 98
	// 加入收藏稍后看标签
	LABEL_COLLECT_WAIT2SEE = 99
	// XX热门分享标签
	LABEL_HOT_SHARE = 100
	// 分享回流强插到推荐标签
	LABEL_SHARE_REFLOW_INSERT_FEED = 101
	// 朋友评论mention表情
	LABEL_FRIEND_COMMENT_MENTION = 102
	// 基于LLM的兴趣推荐标签
	LABEL_LLM_INTERACTIVE_REC = 550
	//通用标签逻辑
	LABEL_FOR_COMMON = 100000
	// 公益标签
	LABEL_WELFARE_FEEDBACK_ITEM = 100002
	// 付费众筹标签
	LABEL_CROWD_PAY_SHOW_ITEM = 100004
	// 精选历史
	LABEL_SELECTED_HISTORY = 103
	// 标签聚合浏览
	LABEL_FAMILIAR_AGGREGATE_VIEW = 104
}

enum RelationLabelSubTypeEnum {
	NONE = 0
	FriendInteraction = 1  // 朋友互动
  AllInteraction    = 2  // 陌生人+朋友互动
	LifeSpuCollect = 20000 // 生活服务商品收藏
}

enum TextTypeEnum {
	USER_TEXT = 0
	CHALLENGE_TEXT = 1
	COMMENT_TEXT = 2
	SEARCH_TEXT = 5
	HOTSPOT_TEXT = 12
    LVideoWorkDetail = 19 //作品详情页
    LVideoSplitLine = 20
}

enum VerficationTypeEnum {
	NONE = 0
	DEFAULT = 1
	ORIGINAL_MUSICIAN = 2
}

enum VideoDistributeTypeEnum {
	// 短视频下发
	SHORT_VIDEO = 1
	// 长视频直接播放下发
	LONG_VIDEO_DIRECT_PLAY = 2
	// 长视频短带长下发
	LONG_VIDEO = 3
}

enum MusicUnusableReasonTypeEnum {
	// 可用
	USABLE = 0
	//版权原因
	COPYRIGHT = 1
	//其他原因
	OTHER = 2
}

enum MusicVideoStatusEnum {
	VIDEO_LOOSE_NOT_RECOMMEDN = 150
	VIDEO_STRICT_NOT_RECOMMEDN = 170
	VIDEO_NOT_RECOMMEND = 200
	VIDEO_MUTE = 250
	VIDEO_MUTE_AND_NOT_RECOMMEND = 255
	VIDEO_MUTE_AND_PROFILE_SEE = 258
	VIDEO_SELF_SEE_EXPT_OWNER = 260
	VIDEO_SELF_SEE = 300
	VIDEO_MUTE_AND_SELF_SEE = 350
	VIDEO_DEL_EXPT_OWNER = 400
	VIDEO_DELETE = 1000
}

enum MusicArtistTypeEnum {
	// 原创音乐人
	ORIGINAL = 1
	// 大V、音乐类明星
	CELEBRITY = 2
}

enum MusicSceneEnum {
	SHORT_VIDEO = 1
	SHORT_VIDEO_WITH_AD = 2
	LIVE = 3
	KARAOKE = 4
	RINGTONE = 5
	UG_VIDEO_PROMOTION = 6
	UG_ADVERTISING_BACKGROUND_MUSIC = 7
	GAME = 8
	INTERACTIVE_MUSIC_STREAMING = 9
	NON_INTERACTIVE_MUSIC_STREAMING = 10
}

// 认证类型(国外)
enum MTCertTypeEnum {
	// 表示未认证用户
	EMPTY = -1
	// Tiktok: Personal
	PERSONAL = 0
	// TikTok: Politics/Non-Profit Organization
	ORGANIZATION = 1
	// TikTok: Business/Brand
	BUSINESS = 2
}

// 认证黄蓝V（抖音）
enum CertLabelEnum {
    NoLabel = 0 //无V
    LabelYellow = 1 //黄V
    LabelBlue = 2 //蓝V
	PinkBadge = 3 // 粉星
	EmployeeBadge = 4 // 员工标签
	AIAvatarBadge = 5 // 虚拟形象标签
	AuthorizedQualification = 6 // 授权资质
	BillboardBadge = 7 // 榜单标签
	AIAccountBadge = 8 // AI 账号标签
	DisplayNameBadge = 9 // 外显实名标签
	Job = 10 // 用户职业信息
	Qualification = 11 // 资质
}

// 认证新外显标识
enum CertLabelStyleEnum {
  NoLabel = 0; //无V
  LabelYellow = 1; //黄V
  LabelBlue = 2; //蓝V
  LabelLinearYellowV = 3; // 线性黄V
  LabelBlackGoldV = 4; // 黑金黄V
  LabelLinearBlueV = 5; // 线性蓝V
  LabelBlackBlueV = 6; // 黑蓝V
}

enum ImprTagEnum {
	None = 0
	// 满足长青计划的item
	ChangQing = 1
	// 满足2tab需求标准的item(40s+&&可横屏播放)
	HorizonVideo = 2
}

// 高级账号状态 0.personal account 1.pro account  2.creator account 3.business account
enum ProAccountStatus {
	PROACCOUNT_CLOSE = 0
	PROACCOUNT_OPEN = 1
	CREATORACCOUNT_OPEN = 2
	BUSINESSACCOUNT_OPEN = 3
}

enum PatchPoiPromptTypeEnum {
	//不需要推送
	NO_NEED = 0
	//普通推送
	GENERAL = 1
	//运营强制推送
	FORCE_OP = 2
}

enum MusicUnshelveReasonEnum {
	UNKNOWN = 0
	COPYRIGHT = 1
	COMMUNITY_SAFETY = 2
	TRUST_AND_PRIVACY = 3
}

enum NoticeActionStatus {
	//没进行action的状态,显示按钮
	NO_ACTION = 0
	//action完后的成功的状态,显示文案
	ACTION_SUCCESS = 1
	//action完后的失败的状态
	ACTION_FAIL = 2
	//消息已经action过了,即不显示按钮也不显示文案
	ACTION = 3
}

// 商业化非标组件素材类型
enum ActivityMaterialType {
	// 图片
	GIF = 0
	// lottie
	LOTTIE = 1
}

// system settings for telephone
enum ContactStatus {
	UNKNOWN = 0
	GRANTED = 1
	DENIED = 2
}

// page source for publish list
enum PublishPageSource {
	PAGE_FROM_PROFILE = 0
	PAGE_FROM_FEED_BACK = 1
}

enum RelationDynamicLabelShowType {
	Relation = 0
	Normal = 1
	CustomColor = 2
}

enum FeedBannerType {
	Unknown = 0
	Dislike = 1
}

enum OfflineInfoType {
	UNKNOWN = 0
	WEBSITE = 1
	DOWNLOADLINK = 2
	PHONE = 3
	ADDRESS = 4
	MICROAPP = 5
	MICROGAME = 6
	OPENURL = 7
	POIBOOKING = 8
	LOCATION = 9
	OPENTIME = 10
}

enum AudioTypeEnum {
	FULL = 1
	CLIP = 2
	UNKNOWN = 3
	ACCOMPANIMENT_FULL = 4
	ACCOMPANIMENT_CLIP = 5
	OTHER_FULL = 7
}

enum ShortVideoDetailStatusEnum {
	// Available and discoverable
	ALL_USEABLE = 100
	// Available but not discoverable
	USEABLE_BUT_UNDISCOVERABLE = 200
	//Used by yourself
	OWNER_USEABLE = 1000
	//Unavailable
	UNUSEABLE = 10000
}

// 描述传递的数据是请求 Libra 的 v1 接口还是 v2 接口
// 参考：https://bytedance.feishu.cn/docs/GQDqUkF8OQ52A8llXzBiLf
enum AbVersion {
	V1 = 0
	V2 = 1
	// 该版本不存在，预留
	V3 = 3
}

enum InteractiveMusicStreamingDetailStatusEnum {
	// available
	ALL_USEABLE = 100
	// 不可推可播
	UNFEEDALBE = 1000
	// 不可播可见
	UNPLAYABLE = 2000
	// 不可见: 其实和UNUSEABLE是一样的
	INVISIBLE = 3000
	// Unavailable
	UNUSEABLE = 10000
}

enum RewardTypeEnum {
	// dou+
	DOUPLUS = 1
	// 现金
	CASH = 2
	// 保量
	BOOST = 3
	// 挂件
	WIDGET = 4
}

enum RewardStatusEnum {
	// 初始
	INIT = 0
	// 进行中
	RUNNING = 1
	// 100 以下的status保留，可能会根据代码逻辑，转化为其他status输出到前台；
// 100以上的字段，统一放置在任务中心的 已结束 里面；
// 已结束，status in [0, 1]时，如果任务过期，会返回这个字段；
	FINISHED = 101
	// 阶段已终止
	STOPPED = 102
	// 结算中，status in [0, 1]，任务条件已达到且以结束，会输出103；
	PENDING = 103
	// 奖励已经发放
	COMPLETE = 104
}

enum BoostStatusEnum {
	// 无保量
	NoBoost = 0
	// 保量中
	InProgress = 1
	// 保量完成
	Finished = 2
}

enum NearbyTradingDecisionStyleOnItemCoverEnum {
	// 样式
// 0（或不存在）: 展示 交易决策信息，如"团购|xx套餐...34￥" 或 "咖啡厅|xx人想去" 同城双列露出 poi和交易决策信息
// NearbyTradingDecisionInfo 结构的 1-5 字段有值
	NEARBY_TRADING_DECISION_MULTIPART_STYLE = 0
	// 2: 展示作品收录提示，只在新发视频封面可能会展示的纯字符串样式，如 "恭喜！你的视频被收录啦"
// NearbyTradingDecisionInfo 接口的 7 字段有值
	NEARBY_TRADING_DECISION_PURE_TEXT_STYLE = 1
}

enum RecommendTemplateEnum {
	// 通讯录
	CONTACT = 1
}

// 和 service_rpc_idl/aweme/aweme_poi_common.thrift 中的 ServiceTypeEnum 一致
enum PoiServiceType {
	//认领状态
	PoiServiceType_ClaimerType = 10
	//餐厅预订
	PoiServiceType_BookType = 20
	//餐厅排队
	PoiServiceType_QueueType = 30
	//民宿
	PoiServiceType_HomeStayType = 40
	//抖音卡券
	PoiServiceType_CouponType = 50
	//App认领
	PoiServiceType_AppClaimerType = 100
	//预约点餐
	PoiServiceType_PreOrderType = 110
	//团购
	PoiServiceType_GroupOn = 120
	//景区门票
	PoiServiceType_ScenicTicket = 130
	//电商
	PoiServiceType_CommerceStore = 140
	//广告卡片，单一线索卡片
	PoiServiceType_ADCard = 150
	//广告卡片，带有商品列表的
	PoiServiceType_ADSpuCard = 160
	// 在线预约
	PoiServiceType_Reserve = 170
	// 外部优惠券
	PoiServiceType_ExtCoupon = 180
	// 外卖
	PoiServiceType_DeliveryService = 190
	//预售券
	PoiServiceType_PresaleGroupon = 200
}

enum BillboardType {
	// 势力榜
	StarShiLi = 1
	// 国民榜
	StarGuoMin = 2
	// 新星榜
	StarXinXiang = 3
}

enum ReplyTypeEnum {
	// 回复评论
	REPLY_COMMENT = 1
	// 回复视频
	REPLY_AWEME = 2
}

enum UserDomainType { //用于Packuser，描述不同领域，各个领域需求的user字段集合是不一样的
    All = 0 //默认情况下是这样的
    // Comment
    Comment_Get_List = 100 //获取评论
    //Social
    Social_BulletScreen_View = 200  //基础社交 弹幕 浏览
    Social_BulletScreen_Digg = 201  //基础社交 弹幕 点赞
    Social_BulletScreen_Comment = 202  //基础社交 弹幕 评论
}

enum UserOnlineStatus {
    OFFLINE = 0
    ONLINE = 1
}

enum UserWishType {
    NONE = 0
    BIRTHDAY = 1 // 生日祝福
}

//和开放平台中 https://open.douyin.com/platform/doc/OpenAPI-poi-product 的spu_type保持一致
enum PoiProductType {
    Hotel = 1
    ScenicTicket = 90
    GroupOn = 91
    CommerceEntity = 20
    CommerceVirtual = 21
    PresaleGroupon = 30
    TravelFollowUp = 92
    OneDayTrip = 93
    Waimi = 100
}

enum EmotionTemplateType {
    Preset = 1 // 预设心情
    Custom = 2 // 自定义心情
}

enum RedPackShowType {
	Pendant = 0 // 红包挂件
	Button = 1 // 按钮展示
}

enum RedPackUserStatusType {
    CanDone         = 0 // 未打开
    RedpackNoTimes  = 1 // 红包发完
    ConsumerNoTimes = 2 // 领取次数用完
    RedpackSelf     = 3 // 自己的红包
    RedpackHasDone  = 4 // 已经领取过
    RedpackNotFount = 5 // 红包过期、不可领取
    ConsumeSuccess  = 6 // 红包领取成功
}

enum AwemeLiteInteractionEntranceType {
    NoEntrance = 0 // 无入口
    NewEntrance = 1 // feed新增入口、无分享面板入口
    ReplaceCollection = 2 // 替换收藏，分享面板常驻收藏
    BottomButton = 3 // 底部button+分享面板常驻
    SharingPanel = 4 // 分享面板常驻
}

enum AwemeLiteInteractionTabType {
    NoTab = 0 // 无新tab
    NewTab = 1 // 有新tab
}

enum AwemeLiteInteractionGiftType {
	GoldDigg = 0 // 金币赞
	Flower = 1 // 送花
	Like = 2 // 喜欢
}

enum MediumVideoBarType {
    RelatedVideo = 0 // 相关视频
    RelatedLongVideo = 1 // 相关视频-长视频
}

enum ActorType {
  Undefined       = 0;
  Actor           = 1;    // 演员
  Scriptwriter    = 2;    // 编剧
  Director        = 3;    // 导演
  MainActor       = 4;    // 主演
  Presenter       = 5;    // 主持人
  Judge           = 6;    // 评委
  Player          = 7;    // 选手
  Guest           = 8;    // 嘉宾

  Recognition     = 60;   // lab从视频抽帧中识别的明星
}

enum FollowGuideTriggerType {
    PlayDuration = 1 // 播放时长触发
    interaction = 2 // 互动行为触发
}

// 关系解释点击展现类型
enum RecommendReasonClickDisplayType {
  DisplayDefault    = 0; // 默认行为
  DisplaySecondPage = 1; // 可以进入二级页面
  DisplayToast      = 2; // 弹出toast
  DisplayOther      = 3; // 其他
}

// Now题材投稿的状态，他人页区分模糊图
enum NowPostStatus {
    Default = 0; // 默认
	Public = 1;  // 公开
	Friend = 2;  // 好友可见
	CloseFriend = 3; // 密友可见
	PartSee = 4; // 部分可见
}


// 分享渠道的分享策略
enum ShareStrategyType {
	//微信分享sdk wechat
	WechatSDK = 1
	//使用文字口令
	TextToken = 2
	//使用链接口令
	LinkToken = 3
}

enum RelatedRecRelationType {
    //关系型
    SINGLE_FOLLOW = 1
    //双向关注
    MUTUAL_FOLLOW = 2
    //收藏
    COLLECT_ITEM = 3
    //评论
    COMMENT = 4
}

enum ClipType {
	// 图片叠加动态贴纸转换的视频，slides二期出现原生上传的视频，但字段无法区分，注意两者的区别
    ClipVideo = 1
	// 图片
    ClipImage = 2
	// 动图
	ClipLivePhoto = 3
	// 视频，由于videoClip已被占用，因此使用抖音端内默认体裁都是视频的语义
	ClipDefault = 4
}

enum ImageType {
	// 长标题转出来的图片
	TitleImage = 1
	// Lynx动态卡片
	LynxImage = 2
}

enum CommerceLabelType {
    // 昵称上方进店组件
    LABEL_SHOP_ENTRY_TOP = 1
    // 昵称下方进店组件
    LABEL_SHOP_ENTRY_BELOW = 2
    // 昵称上方朋友电商标签
    LABEL_COMMERCE_FRIEND_ATTR = 3
}

enum PreAggregationType {
    STICKER = 1
    FLASH_MOB = 2
}

enum MaterialExtraInfoType {
	FriendRecommendReason = 1 // 社交传播-视频推荐
	FamiliarGroupInfo = 2
	LVideoHihglightInfo = 3 // 长视频高光信息
	ItemCountData = 4 // 视频相关counter计数的扩展，由于item_sdk的Statistics不同意扩展idl，和lirunheng沟通后通过extra扩展直接透传CountData
}

enum DistributeCircleType {
    DEFAULT = 0
    CAMPUS = 1
}

enum SpecialImageEnum{
	ProductImage =1 // 商品图文
	LifeEvaluation=2 // 生服评价图文
	ProductCommentImage=3 // 商品评价图文
	GoodEvaluation=4 // 优质评价图文
	LifeCardTransImage = 5; // 生服独立卡转图文
}

enum IconPosition {
	Left = 0
	Right = 1
}

enum IconScale {
	Default = 0
}

enum YummeMixType {
    Author    = 1 // 作者创建的合集
    Operation = 2 // 运营官方创建的合集
}

enum UserState {
    DEFAULT = 0                    // 默认场景  
    NO_LOGIN = 1                   // 未登录场景
    NO_SUBSCRIBE = 2               // 未预约
    SUBSCRIBE_WITH_NO_JOIN = 3     // 已预约未参加
    SUBSCRIBE_WITH_JOIN = 4        // 已预约已参加
    
    UNKNOWN = 999                  // 未知场景
}

enum LVideoContainerType {
    UNKNOWN = 0; //未知，线上短视频容器
    LVIDEO = 1;  //预览流（详情页）容器
    SHORT = 2;  //新短视频容器
}

enum PublishWayType {
	UNKNOWN = 0; // 未知
	NOTE = 1; // 写笔记
}

enum SelectEpisodeButtonType {
    UNKNOWN = 0; //未知，不展示
    LVIDEO_EPISODE = 1  //长视频
}

enum FastReplyBussinessType {
	UNKNOWN = 0; // 未知
	UNREAD_MENTION = 1; // 未读mention进feed
}

// new common label enum begin
enum LabelStrategy {
  NPick1 = 0; // N出1
  MPickN = 1; // M出N
}

enum LabelCandidateType {
  StaticLabel = 0;    // 静态标签
  DynamicLabels = 1;  // 动态多标签
}

enum AnimationType {
  VerticalRebroadcast = 0;  // 垂直轮播
}

enum ContainerTemplate {
  ContainerText = 0;                   // 单文本
  ContainerImageText = 1;              // 图+文本
  ContainerImage = 2;                  // 图
  ContainerTextImage = 3;              // 文本+icon
  ContainerImageTextImage = 4;         // 图+文本+图
}

enum LabelElementType {
  ElementText = 0;         // 单文本
  ElementMultiTexts = 1;   // 多文本
  ElementImage = 2;        // 单图
  ElementMultiImages = 3;  // 多图
}

enum LabelTextOmitStrategy {
  TailOmit = 0;    // 尾部省略
  NotOmit = 1;     // 不省略
}

enum LabelTextsLayout {
  TextsLayoutHorizontal = 0;  // 水平
  TextsLayoutVertical = 1;    // 垂直
}

enum LabelImageShape {
  ShapeOrigin = 0;   // 原图
  ShapeCircle = 1;   // 圆的图
}

enum LabelMultiImageLayout {
  Stack = 0;  // 堆叠
}

enum LabelActionEnum {
  Schema = 0;
  ClientHandle = 1;             // deprecated: 客户端自行处理
  OpenCommentList = 2;          // common: 打开评论面板
  UnreadMentionCommentList = 3; // special: 未读mention评论面板（需要吊起后成功额外上报接口）
  SchoolCircleDetail = 4;       // special: 校园圈
  TabGuideHandle = 5; 			// special：引导引导
}

enum LabelExternalEventType {
  LEETBlock = 1;           // 拉黑
}
// new common label end end

enum PitayaRedPacketStatus {
  Locked = 1     // 待结算（不满24小时）
  CanReceive = 2 // 可领取（超过24小时）
  Received = 3   // 已领取
  Invalid = 4    // 私密或删除导致的无效
}


enum BtnClickAction {
    Schema = 0; //schema跳转
	ClientDefine = 1; //客户端自定义
}

enum BtnTriggerAction {
    Collect = 1; //收藏
    Digg = 2; //点赞
    Play = 3;//播放，需要配合播放进度
    Comment = 4;//评论
	Share   = 5;//分享
	Follow   = 6;//关注
	StayTime = 7; // 停留时长
}

enum BtnPosition {
	PositionEnumLeft = 1;    //左侧
	PositionEnumRight = 2;     // 右侧
}
enum BtnExitType {
	DefaultAnimation  = 0;  //无退场
	NoAnimation  = 1; //有退场
}
enum BtnAnimationType {
	DefaultAnimation  = 0;  //默认动画
	NoAnimation  = 1; //无动画
}
enum BtnExemption {
	FrequencyControl = 1;    //频控豁免
	BowOutWith = 2; //退场豁免
	ReverseExperiment = 3; //反转实验
}
enum BtnUiStyleType {
	BizCustom = 0; // 业务自定义
	SingleBtn = 1; //单btn
	DoubleBtn = 2; //双btn
}

enum BtnBehaviorType {
	DefaultBehavior = 0; //默认正常点击行为
	NegativeBehavior = 1; //负反馈点击行为,负反馈行为会点击后会单独上报埋点
}

enum DiversionFilterReasonEnum {
	UNKNOWN = 0
	PRECHECK = 1
	USERPROFILE = 2
	FOLD_AND_SIM = 3
	COPYRIGHT = 4
	CONTENT_LEVEL = 5
	MUSIC_WITH_OTHER_REASON = 6
	SUCC = 65536
}

// 文娱视频标签类型
enum EntertainmentItemLabelType {
    AdChargeNotUnlocked         = 1    // 激励广告未解锁
    AdChargeUnlocked            = 2    // 激励广告已解锁
    SeriesVIPNotPaid            = 3    // 短剧会员未开通
    SeriesVIPPaid               = 4    // 短剧会员已开通
	SeriesVIPCoverLabel         = 5    // 短剧会员视频封面标签
    PreAccessVideoLabelNotUnlocked   = 6    // 抢先看未解锁      
    PreAccessVideoLabelUnlocked      = 7    // 抢先看已解锁     
    PreAccessCoverLabelNotUnlocked   = 8    // 抢先看未解锁视频封面标签     
    PreAccessCoverLabelUnlocked      = 9    // 抢先看已解锁视频封面标签
    WatchForFreeVideoLabel           = 10   // 免费看标签
    WatchForFreeCoverLabel           = 11   // 免费看封面标签
}

// 文娱按钮类型
enum EntertainmentButtonType {
    AdCharge             = 1    // 激励广告
    SeriesVIP            = 2    //短剧会员
    Charge               = 3    // IAP
	PreAccess            = 4    // 抢先看
	AdChargeFreeWatch    = 5    // 激励广告feed/feed续播免费看本集按钮
}

// 文娱会员类型
enum EntVIPType {
    EntSeriesVIP            = 1;    //短剧会员
}

// 文娱权益类型
enum ItemEntRightType {
    Unknown             = 0;    // 未知
    AdCharge            = 1;    // 激励广告
    SeriesVIP           = 2;    // 短剧会员
	Charge              = 3;    // IAP
    Owner               = 4;    // 作者自身
    PreAccess           = 5;    // 抢先看
    WatchForFree        = 6;    // 特定场景免费看
	IaaPersonalizedForFree = 7; //iaa个性化转免
	IapPersonalizedForFree = 8; //iap个性化转免
	NewIAAFree = 9; // 新IAA内容转免
	NewIAAClickFreeWatchBtn = 10; // 新IAA的feed续播到的阻断集点击"免费看本集"
	SubscribeMemberFree = 11; // 短视频/合集会员免费看
	NewIAAFreeInSeriesAweme = 12; // 新IAA短剧内流策略原因免费
}

 // 文娱权益状态
enum ItemEntRightStatus {
    HasNoRight               = 0;     // 无权益
    HasRight                 = 1;     // 有权益
}

enum PrivateRelationType {
	NotShow24Story = 1; // 不让他看日常
	NotSee24Story  = 2; // 不看他日常
	ReverseNotShow24Story = 3 ;//反向关系 不让他看日常
}

enum MusicObjType {
	SingleSongType = 1; // 单曲
	PlaylistType = 2; // 歌单
	AlbumType = 3; // 专辑
}

enum MusicObjFrom {
	FromStarAnchor = 1; // star锚点
	FromCommentBar = 2; //评论区
	FromBind = 3; // 人工绑定
}

enum AnchorSchemaType {
	OpenUrl = 0;//跳转端内 native 页面或端外
	WebUrl = 1;//跳转端内落地页
	MpUrl = 2;//跳转小程序
}
enum AnchorTextBoldType {
	Default = 0 ;//正常
	Blod = 1;// 粗体
}
enum AnchorEllipsisType{
	End = 0;//尾部截断
	Middle = 1;//中间截断
	Start = 2;//头部截断
}
enum AnchorPreSeparatorType{
	Default = 0; //无分隔符
	Vertical= 1; //｜分隔符
	Dots = 2;//. 分割符
	Custom = 3;//自定义，配合其他字段使用
}

enum AnchorAnimationType {
	Default = 0;//无动画
	Double = 1;//单变双动画
}

enum AlienationEnum {
	Effect = 1; // 特效
	Template = 2; // 模板
}

enum AnchorSceneTypeEnum {
     FeedvideoAnchor = 1,  // 视频区锚点
     CommentTopAnchor = 2, // 评论置顶
     PersonalComment  = 3, // 主态评论区
     SearchAnchor = 4,
 }


enum SeriesPaidTypeEnum {
     IAP = 1,  // 单点付费
     IAA = 2, // 激励广告解锁
     VIP  = 3, // 短剧会员
	 PreAccessSee = 4, // 抢先看
     AdInsert = 5, // 内流广告中插
	 TransFree = 6, // 付费转免
	 NewIAA = 7, // 新IAA模式
 }
