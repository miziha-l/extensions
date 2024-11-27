
include "enum_type.thrift"
namespace go aweme.pack.common
namespace py aweme.pack.common
 
enum KaraokeSongMappingTypeEnum {
	UGC_EXTRACT_ITEM = 1
	UGC_SAME_GROUP_TO_PGC = 2
	UGC_SIMILAR_GROUP_TO_PGC = 3
	PGC_TO_PGC = 4
	UGC_TO_UGC = 5
	UGC_OPERATION = 6
	PGC_SAME_GROUP_TO_PGC = 7
}

enum UserTypeEnum {
	// 免费用户 
	FREE_USER = 1
	// 付费用户
	VIP = 2
}

struct PaymentSetting {
	// 播放时长限制,0无限制，>0表示限制的秒数
	1: optional map<UserTypeEnum, i64> ListenDuration,
	// 是否可以下载
	2: optional map<UserTypeEnum, bool> Download,
}

struct CompressedUrlList {
	1: optional bool Enable,
	2: optional string UriCommon,
	3: optional string ParamCommon,
	4: optional list<string> UrlList,
} 

//Common Structs
struct UrlStruct {
	1: required string Uri,
	2: required list<string> UrlList,
	3: optional i64 DataSize,
	4: optional i32 Width,
	5: optional i32 Height,
	6: optional string UrlKey,
	7: optional string FileHash,
	8: optional string FileCs,
	9: optional string PlayerAccessKey,
	10: optional string UrlStruct,
	11: optional CompressedUrlList CompressedUrlList,
}

// pack的group并没有实际使用此common.ImageUrlStruct，而是使用的是group.ImageUrlStruct
// 在ImageUrlStruct下添加字段需要同步在group.ImageUrlStruct下添加对应字段
struct ImageUrlStruct {
	1: required string Uri,
	2: required i32 Height,
	3: required i32 Width,
	4: optional list<string> UrlList,
	5: optional list<string> DownloadUrlList,
	6: optional list<string> MaskUrlList,
	7: optional VideoStruct Video,
	8: optional i32 Index,
	9: optional enum_type.ClipType ClipType,
	10: optional list<InteractionStruct> InteractionInfos,
	11: optional enum_type.ImageType ImageType,
	12: optional ImageExtraStruct ImageExtra,
	13: optional bool ReadText,
	14: optional string AccessKey,
	15: optional string SecretKey,
	16: optional string ImageStickerId,
	17: optional string ImageTemplateId, // 本图片对应的像素模板id
    18: optional i32 TemplateType, // 模板类型
	19: optional CompressedUrlList CompressedUrlList,
}

struct ImageExtraStruct{
	1: optional string CardSchema,// lynx的schema
	2: optional string CardData,// lynx的json 数据
	3: optional list<string> BackupUrlList // lynx卡片兜底图
	4: optional NavigatorInfoStruct NavigatorInfo // 导航信息
}

struct NavigatorInfoStruct {
	1: optional i32 NavigatorType,
	2: optional string NavigatorName
}

// Shared Structs
struct BillBoardStruct {
	1: required i32 Rank,
	2: optional i64 RankValue,
}


// 几天引导几次
struct  GuideDiamondFrequency {
   1: optional i32 guide_times_cold_start ; // 一次冷启引导几次
   2: optional i32 max_guide_times ; // 最多引导几次
}


// XiGua Item Base info
struct XiGuaBaseInfo {
	1: optional i32 Status,
	2: optional i64 StarAtlasOrderId,
	3: optional i32 StarAtlasType,
	4: optional i64 ItemID,
}

struct BillBoardStructV2 {
	// 榜单类型
	1: required enum_type.BillboardType Type,
	// 排名
	2: required i32 Rank,
	// 文案
	3: optional string Text,
	// 跳转schema
	4: optional string Schema,
}

// 相似品类提权参数
struct SimilarTypeWeightInfo {
    1: optional i64 PoiId, // 相似品类提权传参poi_id
    2: optional string TypeCode, // 相似品类提权传参poi品类码
    3: optional i64 ProductId, // 相似品类提权传参商品ID
    4: optional i64 AwemeId, // 相似品类提权传参视频/直播ID
	5: optional i64 PromotionScene, // 提权场景, 1-购买完成页, 2-气泡, 3-button
}

struct FeedOriginGidInfo {
    1: optional i32 IsLocalLifeVideo, // 引流视频是否生活服务
    2: optional string PoiBackendType,  // 引流视频poi品类
    3: optional i32 FuseTag1,  // 引流视频tag fuse 1级标签
    4: optional i32 FuseTag2, // 引流视频tag fuse 2级标签
    5: optional i32 FuseTag3, // 引流视频tag fuse 3级标签
    6: optional i64 PromotionType,  // 引流类型，来自同城取值1，气泡引流取值2 button:3
	7: optional i32 ScreenType, // 同城feed分发内容类型
    8: optional i64 InsertAwemeId,// 强插视频、直播id
	9: optional i32 InsertAwemeType,// InsertAwemeId的类型，0:视频，1:直播
	10: optional i32 InsertNum, // 强插视频数量
	11: optional i64 NearbyLandingType, // feed承接类型，包括视频和直播。0和1=常规 2=仅生服 3=仅生服&带交易
	12: optional bool LandingTypeForAllPull, // 承接态期间，feed流一直走承接，不区分首刷和load more
	13: optional list<string> InsertAwemeTags, // 强插视频、直播携带的标签
    14: optional SimilarTypeWeightInfo SimilarType, // 相似品类提权
	15: optional i64 ActivityId, // 营销活动id
	16: optional bool ForceRadicalLanding, // 强制使用激进承接
	17: optional i32 GrouponRedDotLandingStyle, // 团购红点承接策略
}

struct DiamondExposeInfo {
    1: optional string BackendTypeCodeL1,
    2: optional string SceneType,  // 引流场景类型
    3: optional string Name,  // 节日名称
    4: optional i64 StartTime,  // 开始时间戳，秒
    5: optional i64 EndTime,     // 结束时间戳，秒
    6: optional i32 BubbleAttribute // 气泡属性，0普通气泡，1节假日气泡，2周末气泡
	7: optional CategoryStruct PoiBackendType,  // POI backendType
	8: optional string QueryCategory,  // 气泡文案，金刚位外显标题使用
	9: optional string ButtonTextCityName, // 气泡文案中用到的城市名称 
	10: optional i32 UndertakeStyle, // 承接样式，0:外显卡，1:半浮层。废弃，用下面的 UndertakeStyleList
	11: optional string PromotionInfo, // 引流上下文，透传到频道算法
	12: optional list<i32> UndertakeStyleList, // 承接样式，0:外显卡，1:半浮层 2:新人POI外显卡 3:订单poi外显卡
	13: optional i64 OfflinePoiID, // 线下场景餐饮扫码poi id
	14: optional list<i64> SpuIds, // 商品id
	15: optional InsertMallCardInfo InserMallCard, // 频道强插
	16: optional string OrderId, // 订单id
	17: optional i64 ActivityId, // 营销活动id
	18: optional map<string,string> GuidMetric, // 引导埋点参数 
	19: optional bool ForceRadicalLanding, // 强制使用激进承接
	20: optional i32 GrouponRedDotLandingStyle, // 团购红点承接策略
}

// 频道强插参数
struct InsertMallCardInfo {
    1: optional list<i64> InsertMallPoiList, // 频道外显卡、半弹层强插poi列表
    2: optional i64 FromOrderPoiId, // 来源订单页对应的poi_id
    3: optional i64 FromOrderPoiTypeCode, // 废弃，使用FromOrderPoiTypeCodeStr
	4: optional string FromOrderPoiTypeCodeStr, // 来源订单页对应的poi品类码
}

struct GuideSceneInfo {
    // 引流场景类型
	1: optional i32 GuideSceneType,
	// feed视频承接透传信息
	2: optional FeedOriginGidInfo FeedOriginGidInfo,
    // 金刚位外显承接透传信息
    3: optional DiamondExposeInfo DiamondExposeInfo,
    // feed视频承接透传信息，字符串
    4: optional string FeedOriginGidInfoStr,
    // 金刚位外显承接透传信息，字符串
    5: optional string DiamondExposeInfoStr,
	// 把 commerce load的数据透传到 risk
	6: optional string DataContainer
}

struct BubbleUrlStruct {
	1: optional string uri,
	2: optional list<string> url_list
}

struct FreqKeyStruct {
	1: optional string freq_key,
	2: optional i32 freq_count_x,
	3: optional i32 freq_time_y,
	4: optional i32 freq_option,
}


struct RebootRecoverDotConfig{
	1: optional i32 reboot_recover_dot_downgrade,
}

// https://bytedance.feishu.cn/docx/EfS1du4Dbot2CfxnEC8crouXnCe
struct NearbyBubbleModel {
	1: optional string bubble_id,
	2: optional i32 bubble_action,
	3: optional i32 type,
	4: optional i32 scene,
	5: optional string expose_msg,
	6: optional i32 priority,
	7: optional i64 valid_time,
	8: optional string limit_uid,
	9: optional string limit_did,
	10: optional string bubble_text,
	11: optional i32 style,
	12: optional BubbleUrlStruct bubble_img_url,
	13: optional string bubble_img_uri,
	14: optional i32 bubble_img_type,
	15: optional BubbleUrlStruct bubble_icon_url,
	16: optional string bubble_icon_uri,
	17: optional i32 bubble_show_duration,
	18: optional i32 bubble_show_out_click,
	19: optional i32 dot_style,
	20: optional string dot_text,
	21: optional i32 red_dot_remove_time,
	22: optional i64 red_dot_remove_timestamp,
	23: optional i32 reboot_recover_dot,
	24: optional i32 remove_dot_user_change,
	25: optional list<FreqKeyStruct> freq_key_array,
	26: optional i32 throttle_time,
	27: optional list<i32> common_avoid_disable,
	28: optional map<string, i32> avoid_other_bubble_type,
	29: optional string feed_gid_info,
	30: optional string diamond_trans_info,
	31: optional i32 first_pull_scene,
	32: optional string bubble_type_category,
	33: optional string notice_category,
	34: optional string extra_diamond_track_param,
	35: optional string extra_feed_track_param,
	36: optional i32 dot_priority, 
	37: optional i32 attribute, // 区分节假日，周末气泡
	38: optional i32 not_dot_undertake,
	39: optional i32 dot_downgrade_time,
	40: optional RebootRecoverDotConfig reboot_recover_dot_config,
	41: optional string search_trans_info, 
	42: optional i32 expose_upload_type,
}

// 天窗频道引导
struct ChannelGuide {
	// 天窗
	1: optional SkylightCapsule SkylightCapsule,
	// 底bar
	2: optional BottomBar BottomBar,
}

struct SkylightCapsule {
	1: optional string CustomText,
	2: optional UrlStruct Icon,
	3: optional string OuterShowReq,
	4: optional string ButtonNameL3,
}

struct BottomBar {
	1: optional string CustomText,
	2: optional UrlStruct Icon,
	3: optional string DetailUrl,
	4: optional string PoiDeviceDistanceMMin,
	5: optional string L3Name,
	6: optional string L1Name,
	7: optional string L2Name,
}

struct BitrateStruct {
	// 档位名称
	1: required string GearName,
	// 码率(bps)
	2: required i32 Bitrate,
	// 视频清晰度
	3: required i32 QualityType,
	// 播放地址
	4: optional UrlStruct PlayAddr,
	// H265播放地址
	5: optional UrlStruct PlayAddrH265,
	// 编码格式
	6: required string CodecType,
	// used for replace playAddrH265
	7: optional UrlStruct PlayAddrByteVC1,
	// 新增字段 1: HLG;  2: PQ
	8: optional string HdrType,
	// 新增字段 1: 10Bit; 2: 12Bit
	9: optional string HdrBit,
	// frame rate
	10: optional i64 FPS,
	// 视频额外信息，json string， 包括视频首帧 偏移量
	11: optional string VideoExtra,
	//视频格式，mp4/dash
	12: optional string Format,
}

struct VideoExtra {
	// 视频首帧偏移量
	1: optional string PktOffset,
}

struct BitrateAudioStruct {
	// 音频元信息
	1: optional BitrateMetaStruct AudioMeta,
	// 音频质量
	2: optional i64 AudioQuality,
	// 音频额外信息，json string
	3: optional string AudioExtra, 
}

struct BitrateMetaStruct {
	// 播放地址
	1: optional BitrateUrlStruct UrlList,
	// 是否加密，加密方式
	2: optional string EncodedType,
	// 媒体类型
	3: optional string MediaType,
	// 流水印名称
	4: optional string LogoType,
	// 分辨率
	5: optional string Definition,
	// 质量级别
	6: optional string Quality,
	// 质量描述信息
	7: optional string QualityDesc,
	// 格式
	8: optional string Format,
	// 宽
	9: optional i64 Width,
	// 高
	10: optional i64 Height,
	// 码率
	11: optional i64 Bitrate,
	// 编码器类型
	12: optional string CodecType,
	// 大小
	13: optional i64 Size,
	// frame rate
	14: optional i64 FPS,
	// 唯一标识
	15: optional string FileId,
	// 哈希唯一标识
	16: optional string FileHash,
	// 透传到点播sdk的字段
	17: optional string SubInfo,
}

struct BitrateUrlStruct {
	// 主播放url
	1: optional string MainUrl,
	// 备播放url
	2: optional string BackupUrl,
	// 兜底url
	3: optional string FallbackUrl,
}

struct LifePoiCommentTopBarStruct {
	// 标题
	1: optional string Title,
	// 提示文案
	2: optional string TipsWord,
	// 跳转链接
	3: optional string Schema,
	// 埋点信息
	4: optional string TrackInfo,
	// 额外信息
	5: optional string Extra,
	// 优先级是否高于搜索
	6: optional bool PriorityHighSuggestWord,
}

struct HotListStruct {
	1: required string ImageUrl,
	2: required string Schema,
	3: required string Title,
	4: required i32 Type,
	5: required string I18nTitle,
	6: optional string Header,
	7: optional string Footer,
	8: optional i32 PatternType,
	9: optional i32 Rank,
	10: optional i32 HotScore,
	11: optional i32 ViewCount,
	12: optional string GroupId,
	13: optional string Sentence,
	14: optional i64 SentenceId,
	15: optional i32 Label,
	16: optional string Extra,
	17: optional UrlStruct Icon,
}

struct HotspotAnchorStruct {
	// 热点词ID
	1: optional i64 SentenceID,
	// 热点词文案
	2: optional string Sentence,
	// 图标
	3: optional UrlStruct Icon,
	// 提示
	4: optional string Hint,
	// 正文
	5: optional string Text,
	// 跳转链接
	6: optional string Schema,
	// 透传参数
	7: optional string Extra,
	// 埋点参数
	8: optional string LogExtra,
	// 数据源参数
	9: optional string DataSource,
}

struct Bonus {
	//权益类型
	1: optional enum_type.BonusType BonusType,
	//权益来源
	2: optional BonusAuthor Author,
	//标题
	3: optional string Title,
	//副标题
	4: optional string SubTitle,
	//内容
	5: optional string Text,
	//样式
	6: optional string Style,
	//商业化banner信息
	7: optional BonusCommerce CommerceInfo,
	//权益打开url
	8: optional string OpenUrl,
	//token
	9: optional string Token,
	//来源
	10: optional enum_type.BonusSource Source,
	//场景id
	11: optional i64 SceneId,
	//点赞文案
	12: optional string DiggText,
	//点赞toast
	13: optional string DiggToast,
	//是否可能为锦鲤
	14: optional bool MaybeCarp,
}

struct BonusAuthor {
	1: optional i64 Id,
	//名称
	2: optional string Name,
	// 用户头像 大图
	3: optional UrlStruct AvatarLarger,
	// 用户头像 小图
	4: optional UrlStruct AvatarThumb,
	// 用户头像 中图
	5: optional UrlStruct AvatarMedium,
}

struct BonusCommerce {
	1: optional i64 Id,
}

struct DontShareStruct {
	1: required i32 VideoHideSearch,
	2: required i32 DontShare,
}

struct LabelStruct {
	1: required byte Type,
	2: required string Text,
	3: optional UrlStruct Url,
	4: optional string Color,
	5: optional string ColorText,
	6: optional string RefUrl,
	// starling key for text
	7: optional string TextKey,
	// relation label recommend type, from recommend service
	8: optional i64 RecommendType,
}

struct MarkerStruct {
	1: optional bool CanComment,
	2: optional bool CanCommentForAd,
	3: optional i32 CanCommentStatus,
	4: optional i32 CanDownloadStatus,
	5: optional i32 CanDuetStatus,
	6: optional i32 CanReactStatus,
	7: optional bool HasLifeStory,
	8: optional bool HasOrders,
	9: optional bool IsAdFake,
	10: optional bool IsAds,
	11: optional bool IsCanceled,
	12: optional bool IsCommerceChallenge,
	13: optional bool IsCollected,
	14: optional bool IsCopyCat,
	15: optional bool IsDelete,
	16: optional bool IsDouPlus,
	17: optional bool IsFantasy,
	18: optional bool IsFriend,
	19: optional bool IsGovMediaVip,
	20: optional bool IsHashTag,
	21: optional bool IsMyself,
	22: optional bool IsNotRecommend,
	23: optional bool IsOnlyOwnerUse,
	//是否是原创音乐人的音乐
	24: optional bool IsOriginal,
	25: optional bool IsPgcshow,
	26: optional bool IsPrExempted,
	27: optional bool IsPreventDownload,
	28: optional bool IsRealChallenge,
	29: optional bool IsRelieve,
	30: optional bool IsRedirect,
	31: optional bool IsRestricted,
	32: optional bool IsSelfSee,
	33: optional bool IsSecretAccount,
	34: optional bool IsSpecialVr,
	35: optional bool IsTop,
	36: optional bool WithCommerceEntry,
	37: optional bool WithFusionShopEntry,
	38: optional bool WithQuickShop,
	39: optional bool WithShopEntry,
	40: optional bool WithStoryPrivilege,
	// 0: 下载高清无水印视频;1: 广告主指定
	41: optional i32 WithoutWatermarkStatus,
	42: optional bool IsFromAd,
	// 特效师标识, 默认为空，1表示需要打标, 0表示不需要(审核通过后在ops被标记为不推荐)
	43: optional i32 EffectDesignerStatus,
	// gr需求，网信办会对特定视频下达指令，要求特定视频不能被分享/被转发/被评论
	44: optional bool CanShowCommentForGr,
	45: optional bool CanCommentForGr,
	46: optional bool CanShareForGr,
	47: optional bool CanForwardForGr,
	//是否有商用版权
	48: optional bool IsCommerceMusic,
	//是否是原声
	49: optional bool IsOriginalSound,
	//是否来自多闪
	50: optional bool IsFromDuoshan,
	//音乐版权对视频影响
	51: optional enum_type.MusicVideoStatusEnum CopyrightVideoStatus,
	//视频自见用户无感知
	52: optional bool IsSelfSeeExcptOwner,
	// 是否授权给广告主, 0 不可授权; 1 未授权; 2 已授权
	53: optional i32 AdAuthStatus,
	// 是否因音乐问题对视频静音
	54: optional bool IsMute,
	//是否静音分享
	55: optional bool MuteShare,
	// 账户被广告主关联
	56: optional bool AdverHookup,
	// 宽松不推荐
	57: optional bool IsLooseNotRecommend,
	// 严格不推荐
	58: optional bool IsStrictNotRecommend,
	// 视频静音且视频只能在个人页可见
	59: optional bool IsMuteAndProfileSee,
	60: optional bool IsDmvAutoShow,
	// 视频是否被邀请过用来MT竞价广告投放
	61: optional bool AuctionAdInvited,
	// 是否是火山媒体政务号
	62: optional bool IsHotsoonGovMediaVip,
	// 是否是pgc音乐
	63: optional bool IsPgc,
	// 是否是直播完整回放
	64: optional bool IsLiveReply,
	// 是否包含评论过滤关键词
	65: optional bool WithCommentFilterWords,
	// 是否是显示数据分析入口
	66: optional bool WithDashboard,
	// 是否允许广告主推广
	67: optional bool AdvPromotable,
	68: optional bool isCollectedMix,
	// 视频维度的stitch设置
	69: optional i32 CanStitchStatus,
	// 审核过严对作者体验影响实验-实验组用户标注
	70: optional string ReviewTooStrictTestLabel,
	// 是否能后台播放
	71: optional bool CanBackground,
	// 是否因商业化原因禁止端上某些交互操作
	72: optional i32 AdBanMask,
	// 是否是合集用户
	73: optional bool IsMixUser,
	// 是否是首投公开视频
	74: optional bool IsFirstVideo,
	// 视频纬度是否分发同城
	75: optional i32 SyncToNearbyFeed,
	// 视频发布位置与消费者的地理位置是否为 L2 or L3 同城；1-L2 同城,2-L3 同城
	76: optional i32 NearbyLevel,
	// 视频发布位置与消费者的地理位置是否在给定距离范围内
	77: optional bool IsInScope,
	// 是否星图
	78: optional bool IsStarAtlas,
	// 音频类型，如全曲
	79: optional i32 AudioType,
	// Music, from pb builder
	100: optional bool IsAuthorArtist,
	// from pb bulder
	101: optional bool AvoidGlobalPendant,
	// 广告授权类型
	102: optional i32 AdAuthType,
	//是否是短剧用户
	103: optional bool IsSeriesUser,
	// 是否允许分享到日常
	104: optional i32 CanShareStatus,
	// 视频浏览者位置
	105: optional string GeoHash,
	// 是否同城开关打开并且活跃
	106: optional bool isNearbyActive,
	// 音乐人是否被封禁 0表示封禁 1表示正常 from pb_builder
    107: optional i64 AuthorStatus,
    // 视频本身是否广告(比如: 广告被分享后打开)
    108: optional bool IsAdItem
    // 是否引导收藏，0-不引导 1-引导
    109: optional i32 ShowCollectHint
    //是否满足转发豁免条件
    110: optional bool isExemptForReply
	// 标识是否是生活服务相关投稿内容
    111: optional bool IsLifeItem;
	// 标识广告类型
	112: optional i32  AdType,
	//禁止绑定底部bar标识
    113: optional i32 DisableRelationBar
    //音频连带视频状态
    114: optional i64 MusicRelatedVideoStatus
	//Feed分发商品卡标识视频是否有商品卡
    115: optional i32 HasEcomGoodsCard
	//Feed电商视频上商品相关信息
    116: optional string VideoEcomProductInfo
	//Feed电商视频业务参数
	117: optional string EcomVideoBusinessParams
	// 是否是种草短视频 1:是种草短视频
	118: optional i32 IsEcomAweme
	//推荐控制标签字段
	119: optional i32 FeedLabelShow,
	//推荐控制button字段
	120: optional i32 FeedButtonShow,
	// 图文是否轮播
    121: optional bool IsImageBeatLoop,
    //是否禁止收藏
    122: optional bool DisableCollect
    //是否禁止点赞
    123: optional bool DisableDigg
	//Feed电商搜索卡种草相关信息
    124: optional string VideoEcomSearchCardInfo
	//url优化最终结果
    125: optional bool UrlOptimizeStatus
    // 图文是否自动播
    126: optional bool IsAutoPlay,
    // 图文自动播字段
    127: optional i64 MultiImagesAutoPlayState
	// 是否为领导人
	128: optional bool IsAvoidGoldPendant
}

// 蒙层信息
struct MaskStruct {
	// 蒙层类型
	1: required enum_type.MaskTypeEnum MaskType,
	// 蒙层状态
	2: optional i32 Status,
	// 蒙层标题
	3: optional string Title,
	// 蒙层内容
	4: optional string Content,
	// 取消蒙层标签
	5: optional string CancelMaskLabel,
	// 其他
	99: optional string Extra,
}

// 活动信息
struct ActivityStruct {
	// 活动ID
	1: optional string ActivityId,
	// 延迟触发时间
	2: optional i64 ShowDelayTime,
	// 跳转链接
	3: optional string SchemaUrl,
	// 文案内容
	4: optional string ContentText,
	// 文字颜色
	5: optional string ContentColor,
	// 文字大小
	6: optional string ContentSize,
	// 按钮文案内容
	7: optional string ButtonLabel,
	// 按钮文字颜色
	8: optional string ButtonColor,
	// 活动类型
	9: optional string ActivityType,
	// 视频活动标签
	10: optional string ActivityTag,
	// 其他
	99: optional string Extra,
}

struct ShareStruct {
	// 分享描述
	1: required string Desc,
	// 分享标题
	2: required string Title,
	// 分享链接
	3: required string Url,
	// 分享微博文案
	4: required string WeiboDesc,
	// 分享图片链接
	5: optional UrlStruct ImageUrl,
	// 分享链接文案
	6: optional string LinkDesc,
	// 分享个人链接二维码
	7: optional UrlStruct QrcodeUrl,
	// 短链 0 有效期6个月, 1 长期有效
	8: optional i32 PersistStatus,
	// fb ins 分享文案
	9: optional string Quote,
	// jp 分享文案
	10: optional string SignatureDesc,
	// jp 分享链接
	11: optional string SignatureUrl,
	// whatsapp分享文案
	12: optional string WhatsappDesc,
	// 商业化,from pb builder
	13: optional string ManageGoodsUrl,
	// 商业化,from pb builder
	14: optional string GoodsRecUrl,
	// 调用短链服务的belong值
	15: optional string ShortenBelong
	// 不同分享渠道的分享策略(废弃字段)
	16: optional map<string, enum_type.ShareStrategyType> ChannelConfig
	// 不同分享渠道的分享策略string类型
    17: optional string ChannelConfigStr
}

struct TextExtraStruct {
	1: required enum_type.TextTypeEnum Type,
	2: required i64 Start,
	3: required i64 End,
	4: optional i64 HashtagId,
	5: optional string HashtagName,
	6: optional string UserId,
	7: optional bool IsCommerceHashtag,
	8: optional string SecretUserId,
	9: optional string AwemeId,
	// 图片表情id
	10: optional i64 StickerId,
	// 图片表情url
	11: optional UrlStruct StickerUrl,
	// 图片表情来源
	12: optional i32 StickerSource,
	13: optional i32 SubType,
	14: optional string LiveData,
	//搜索标注
	15: optional string SearchText,
	16: optional string SearchQueryId,
	17: optional i32 SearchHideWords,
	// 是否需要折叠
	18: optional i32 NeedFold,
	// 由于NeedFold改过type，新起一个字段，不再用NeedFold，防止crash
	19: optional i32 NeedFoldV2,
    // 搜索标注 - 扩展字段
	20: optional string SearchExtra,
	// 热点标签 - 热点id和文案
	21: optional i64 HotspotId, // 已废弃
	22: optional string HotspotText,
	23: optional string SentenceId,
	24: optional string RelatedSentence,
    //长视频标题跳转
	25: optional string OpenUrl,
	26: optional i64 CaptionStart,
	27: optional i64 CaptionEnd,
	// 品专词状态，1-话题是品专词，其他-不是
	28: optional i32 BrandStatus,
}

struct TimeRange {
	1: required double Start,
	2: required double End,
}

// Base Structs
struct ACLCommonStruct {
	1: optional i32 Code,
	2: optional i32 ShowType,
	3: optional string ToastMsg,
	4: optional string Extra,
	5: optional i32 Transcode,
	6: optional bool Mute,
}

struct ActivityTrilateralCooperationStruct {
	1: optional string Desc,
	2: optional string Title,
	3: optional string JumpUrl,
	4: optional string IconUrl,
	5: optional bool IsTask,
	6: optional i32 SwitchType,
	7: optional string EntranceUrl,
}

struct ActivityCommerceStruct {
	// 红包类型 1: 手势红包，2: KOL挂件
	1: required enum_type.CommerceActivityTypeEnum ActType,
	// 跳转openurl
	2: required string JumpOpenUrl,
	// 跳转H5url
	3: required string JumpWebUrl,
	4: optional string Title,
	5: optional UrlStruct Image,
	6: optional i64 StartTime,
	7: optional i64 EndTime,
	8: optional list<TimeRange> TimeRanges,
	// 第三方监测url
	9: optional string TrackUrl,
	// 第三方点击监测url
	10: optional string ClickTrackUrl,
	// lottie格式的素材url
	11: optional string Lottie,
	// 素材类型
	12: optional enum_type.ActivityMaterialType MaterialType,
	// TrackUrl的list形式，和pb builder保持统一
	13: optional list<string> TrackUrlList,
	// ClickTrackUrl的list形式，和pb builder保持统一
	14: optional list<string> ClickTrackUrlList,
	// 视频挂件出现时间，单位毫秒,
	15: optional i64 AppearTime,
	// 下载链接合规信息
	16: optional string ComplianceData
	// 非标挂件唯一标识
	17: optional string ConfigId
}

struct AddressStruct {
	1: required string Address,
	2: required string City,
	3: required string CityCode,
	4: required string Country,
	5: required string CountryCode,
	6: required string District,
	7: required string Province,
	8: required string SimpleAddr,
	9: optional string CityTrans,
	10: optional string CountryTrans,
	11: optional string ProvinceTrans,
	// 区位码
	12: optional string AdCodeV2,
	// 城市级别code
	13: optional string CityCodeV2,
}

struct CategoryStruct {
	1: required string Code,
	2: required string Name,
	// from pb builder
	3: optional bool IsAdminArea,
}

struct CommerceConfigStruct {
	1: required string Id,
	2: required i32 Type,
	3: required string Data,
	4: optional i32 TargetType,
	5: optional string TargetId,
}

struct CommentStruct {
	1: required i64 Id,
	2: required i64 ItemId,
	3: required i64 CreateTime,
	4: required i64 DiggCount,
	5: required string Extra,
	6: required i64 ReplyId,
	7: required i16 Status,
	8: required bool UserDigged,
	9: required string Text,
	10: required list<TextExtraStruct> TextExtraInfos,
	11: required i64 UserID,
	12: required i64 GroupID,
	13: required i64 ReplyToCommentId,
	14: optional i32 Level,
	15: optional bool IsReply,
	16: optional i64 ReplyToUserId,
	17: optional i32 LabelType,
	18: optional string LabelText,
	19: optional i32 CommentType,
	20: optional i64 ParentId,
	21: optional CommentStruct ReplyToComment,
	22: optional string ForwardId,
	23: optional CommentStruct Level1Comment,
	24: optional i64 AliasGroup,
	25: optional i64 AppId,
	26: optional bool CommentUnvisible,
	27: optional list<i64> MergeUserIDs,
    28: optional i32 ServiceID,
    29: optional i32 Anonymous,
	30: optional i32 ContentType,
}

struct CollectSource {
	1: optional i64 source_item,
	2: optional i32 collect_count,
}

struct PoiStruct {
	1: required string Id,
	2: required string Distance,
	3: required i32 ExpandType,
	4: required i32 IconType,
	5: required i32 ItemCount,
	6: required double Latitude,
	7: required double Longitude,
	8: required string Name,
	9: required string TypeCode,
	10: required i32 UserCount,
	11: required ShareStruct ShareInfo,
	12: optional AddressStruct AddressInfo,
	13: optional UrlStruct CoverHd,
	14: optional UrlStruct CoverLarge,
	15: optional UrlStruct CoverMedium,
	16: optional UrlStruct CoverThumb,
	17: optional UrlStruct IconOnEntry,
	18: optional UrlStruct IconOnInfo,
	19: optional UrlStruct IconOnMap,
	20: optional i32 ShowType,
	21: optional string Subtitle,
	22: optional string SpSource,
	23: optional i32 SubtitleType,
	24: optional string Voucher,
	25: optional list<string> VoucherReleaseAreas,
	26: optional list<CategoryStruct> FrontendCategoryInfos,
	27: optional CategoryStruct BackendCategoryInfo,
	28: optional i64 ClaimerUserID,
	29: optional string ClaimerNickname,
	30: optional string ClaimerAvatarUrl,
	31: optional string ThirdId,
	32: required i64 ViewCount,
	33: optional string ItemTag,
	// 被收藏数
	34: optional i64 CollectCount,
	// 头图
	35: optional list<UrlStruct> HeadImages,
	// 是否用户在对应POI地理围栏内
	36: optional bool WithinGeoFence,
	//POI-“在你附近”信息
	37: optional ItemLabelStruct PoiNearby,
	// poi pack通用ext信息json数据
	38: optional string ExtJson,
	// feed中使用, from pb builder
	39: optional i32 IsShowHalfcard,
	// feed中使用，PoiCard.Url, from pb builder
	40: optional string CardUrl,
	// https://bytedance.feishu.cn/docs/doccnOESa3ORGoNHfTqTQTysLeg
	41: optional NearbyTradingDecisionInfo NearbyTradingInfo,
	// 是否是：餐饮&&团购
	42: optional bool IsFoodGroupBuy,
	// 是否已收藏该POI
	43: optional i32 CollectStat,
	// 收藏poi源信息
	44: optional list<CollectSource> collect_sources,
	// 是否可以评论at召回想去
	45: optional bool IsAtCallBackCollect,
	// 质量分
	46: optional i32 QualityScore,
	// poi 类型（团购、预购、...）
	47: optional list<enum_type.PoiServiceType> ServiceTypeList,
	// poi 榜单
	48: optional list<PoiRankEntryStruct> PoiRanks,
	// poi三级品类
	49: optional string Poi3ClassType,
	// from awemeStructV1 pb_builder
	50: optional string Popularity,
}

enum AnchorReviewStatusEnum {
    // 审核中
    REVIEWING = 0;
    // 审核通过
    PASSED = 1;
    // 审核拒绝
    DENIED = 2;
}

struct AnchorReviewStatusStruct {
    1: optional AnchorReviewStatusEnum status
    2: optional i64 show_type
}

struct PoiBizStruct {
	1: optional PoiSpuStruct SpuInfo,
	2: optional PoiDouDiscountStruct DouDiscountInfo,
	// 评价卡片
	3: optional PoiAwemeTagRateCardStruct TagRateCard,
	// https://bytedance.feishu.cn/docs/doccnOESa3ORGoNHfTqTQTysLeg
	4: optional NearbyTradingDecisionInfo NearbyTradingInfo,
	// 视频详情页的 poi 气泡
	5: optional PoiBubbleInItemDetail bubble_in_detail,
	// 视频上的评价信息
	6: optional PoiAwemeTagRateInfoStruct TagRateInfo,
	// 是否展示"想去"卡片 https://bytedance.feishu.cn/docs/doccnzLNr7tcYTg6r9QbyzWnmrL
	7: optional bool ShowWantToGoButton,
	// POI结合地图 see https://bytedance.feishu.cn/docs/doccn29pW0xbpF85swdHkX5snAb#
	8: optional PoiMapStruct PoiMap,
	// 商品锚点审核状态
	9: optional AnchorReviewStatusEnum anchor_review_status,
	// 商品锚点审核状态（新增锚点类型）
	10: optional AnchorReviewStatusStruct anchor_review,
	// 视频是否展示poi收藏按钮
    11: optional bool show_poi_collect_button,
    // 展示poi收藏按钮的频控和退场配置
    12: optional string show_poi_collect_button_rule_json,
    // 视频评论区融合生活服务评价的评价Tab
    13: optional LifeRateTabInfoStruct LifeRateTabInfo,
	// 作品列表引导入驻生服达人
	14: optional PoiKeyuserFeedGuideStruct KeyuserFeedGuide,
}

struct LifeRateTabInfoStruct {
    1: optional i32 ShowTagRateTab,
    2: optional i64 TotalCount,
    3: optional string TagRateTypeText,
    4: optional i32 ShowRateGrade,
    5: optional string TabText,
}

struct PoiMapStruct {
	1: optional string NearbyRecommend,
	2: optional PoiStruct PoiInfo,
}

struct PoiRankEntryStruct {
	1: optional string RankDesc,
	2: optional string ParentRankName,
	3: optional i32 RankIndex,
	4: optional string RankCode,
	5: optional string RankTheme,
	6: optional string RankId,
}

struct PoiDouDiscountStruct {
	// dou优惠标签
	1: optional string Lable,
	// dou优惠合集信息
	2: optional SearchStruct MixInfo,
	// dou优惠榜单信息
	3: optional DouDiscountRankInfo RankInfo,
}

struct DouDiscountRankInfo {
	1: optional string RankCode,
	2: optional string RankName,
	3: optional string RankDesc,
	4: optional string CategoryUri,
	5: optional string CategoryName,
	6: optional i32 ItemCount,
	7: optional i64 ItemVVTotal,
	8: optional i64 ItemUVTotal,
	9: optional UrlStruct CategoryUrl,
}

struct PoiSpuStruct {
	1: required string SpuId,
	2: required i64 SpuType,
	3: required PoiSpuCustomerStruct CustomerInfo,
	4: required string SpuName,
	5: optional list<string> SpuImages,
	6: optional list<PoiSpuTagStruct> SaleTagInfos,
	7: optional i64 Price,
	8: optional i64 OriginPrice,
	9: optional PoiSpuEntryStruct SpuEntry,
	10: optional list<PoiSpuDecisionStruct> DecisionInfos,
	11: optional i64 Stock,
	12: optional list<PoiSpuTagStruct> ImageTagInfos,
	13: optional PoiSpuStatStruct StatInfo,
	14: optional string IconUri,
	15: optional string ExtJson,

	// 16-17 为透传使用字段
	// from AwemeStructV1 pb_builder
    16: optional list<UrlStruct> ImageUrls,
    // from AwemeStructV1 pb_builder
    17: optional UrlStruct IconUrl,
}

struct PoiSpuCustomerStruct {
	1: required i64 CustomerSource,
	2: required string CustomerName,
	3: required string CustomerId,
}

struct PoiSpuTagStruct {
	1: optional i32 TagType,
	2: optional string Content,
}

struct PoiSpuEntryStruct {
	1: required i64 CustomerSource,
	2: required string Url,
	3: optional string Title,
}

struct PoiSpuDecisionStruct {
	1: required string AvatarUri,
	2: required string Desc,
	// from awemeStructV1 pb_builder
	3: optional UrlStruct AvatarUrl,
}

struct PoiSpuStatStruct {
	1: optional i64 ClickUserCount,
	2: optional i64 LowPrice,
	3: optional i64 SaleCount,
}

struct PoiTagRateTagStruct {
	1: optional i64 Id,
	2: optional string Text,
}

struct PoiTagRateGradeStruct {
	// 类型
	1: required i32 Type,
	// 文案
	2: optional string Text,
	// 选中时图片的uri
	3: optional UrlStruct SelectedUri,
	// 未选中时图片的uri
	4: optional UrlStruct UnselectedUri,
	// 评级标签
	5: optional list<PoiTagRateTagStruct> RateTags,
	// 评价态度改版新增ui参数，端上解析json
	6: optional string UiParams,
}

struct PoiTagRateCardExpGroupStruct {
    1: optional string ExpName; // 实验名
    2: optional i32 ExpGroup; // 命中实验分组号
}

struct PoiAwemeTagRateClientConfigStruct {
	// Lynx写评卡的的资源地址，由FE提供
    1: optional string TemplateUrl,
    // Lynx容器宽度，常量
    2: optional i32    ContainerWidth,
    // lynx容器高度，常量
    3: optional i32    ContainerHeight,
    // 小屏手机lynx容器宽度，常量
    4: optional i32    SmallContainerWidth,
    // 小屏手机lynx容器高度，常量
    5: optional i32    SmallContainerHeight,
}

struct PoiAwemeTagRateCardStruct {
    // 卡片显示时间，单位秒，0立刻展开
    1: optional i64 ExtendSecTime;
    // 文案，你觉得这个地方怎么样
    2: optional string Desc;
    // 小屏手机的文案，这个地方怎么样
    3: optional string SmallDesc;
    // 评价等级
    4: optional list<PoiTagRateGradeStruct> RateGrades;
    // 评价得优惠券文案
    5: optional string coupon_desc;
    6: optional string poiName;    // 带POI名字的文案，文本过长时需要对POI名字做截断，所以下发POI名字，便于端上做截断操作
    7: optional bool shouldShowBottomBar; // 是否展示主态视频播放器的评价底bar
    8: optional TagRateBottomBarType tagRateBottomBarType; // 评价底bar的样式
    9: optional string friendPageDesc; // 朋友评价卡片文本
    10: optional string SchemaUrl; // 评价全屏页跳转schema
    11: optional list<PoiTagRateCardExpGroupStruct> ExpGroups; // 评价卡片实验分组
	12: optional PoiAwemeTagRateClientConfigStruct ClientConfig; // 前端配置参数
	13: optional string ExtraJson; // 拓展参数，主要用于pack服务透传，避免改动idl需要重新发版
}

enum TagRateBottomBarType {
    UnknownTagRateBottomBarType = 0;
    TextPlusAttitudeOptions = 1; // 文本加态度标签
    TextPlusRateLink = 2;        // 文本加“去评价”链接
    TextWithPoiNamePlusRateLink = 3; // 带POI Name文本加“去评价”链接
}

struct PoiAwemeTagRateInfoStruct {
	// 评价id
	1: optional i64 RateId,
	// 评价内容
	2: optional string RateContent,
	// 评价等级和标签
	3: optional PoiTagRateGradeStruct RateGrade,
	// 评价用户
	4: optional i64 UserId,
	// 用户昵称
	5: optional string Nickname,
	// 评价时间
	6: optional i64 CreateTimeMs,
	// 展示lynx链接
	7: optional string LynxUrl,
}

// 展示在视频详情页的气泡
struct PoiBubbleInItemDetail {
	// 气泡文案
	1: optional string text,
}

// 商品信息基本结构体
struct NearbyTradingDecisionInfo {
	// 团购 or 预订 or poi品类
	1: optional string first_text,
	// 文本颜色（深）
	2: optional string first_text_dark_color,
	// 背景色（深）
	3: optional string first_text_dark_background_color,
	// 文本颜色（浅）
	4: optional string first_text_light_color,
	// 背景色（浅）
	5: optional string first_text_light_background_color,
	// 详细信息 or 其他信息
	6: optional string second_text,
	// 价格
	7: optional string third_text,
	// poi 样式
	8: optional enum_type.NearbyTradingDecisionStyleOnItemCoverEnum style,
	// 视频被收录的提示，如"你的视频被收录啦"
	9: optional string item_recruited_text,
}

struct PromotionVisitorStruct {
	// 访客头像
	1: required list<UrlStruct> Avatars,
	// 总浏览数
	2: required i32 Count,
}

struct SearchStruct {
	1: required string Sentence,
	2: optional string ChallengeId,
	3: optional i64 HotValue,
	4: optional string SearchWord,
	5: optional i32 Rank,
	// 此区域内限制搜索
	6: optional list<string> RestrictedRegion,
	// visual_search视觉搜索入口(视频是否开启)
	7: optional bool HasVisualSearchEntry,
	// 热搜词group_id
	8: optional string GroupId,
	// visual_search视觉搜索入口(用户是否开启)
	9: optional bool NeedVisualSearchEntry,
	10: optional i32 Label,
	// 热点黄条样式
	11: optional i32 PatternType,
	// feed中的相关视频的入口样式
	12: optional VisualSearchEntryStruct VisualSearchEntry,
	// 热点黄条icon
	13: optional UrlStruct Icon,
	// 是否可以展示权威性标签
	14: optional bool NeedAuthorityLabel,
	// 是否可以展现粉丝数标签
	15: optional bool NeedFollowerCountLabel,
	// 搜索医疗标签
	16: optional string MedicalLabel,
	// OCR智能封面
	17: optional string OcrIccvExtractedCover,
	// 标题折行需求 下发是否需要扩展视频标题折行
	18: optional i32 SearchHashtagLineBreaking
}

// @docs: https://bytedance.feishu.cn/docs/doccncSf33uLrilfPYvgpWnaImb#
struct VisualSearchEntryStruct {
	// 主标题
	1: optional string Title,
	// 副标题
	2: optional string SubTitle,
	// 文本颜色
	3: optional string TextColor,
	// 入口icon
	4: optional UrlStruct IconUrl,
}

struct ItemPoiPatchStruct {
	//discard
	1: optional enum_type.PatchPoiPromptTypeEnum ItemPatchPoiPromptMark,
	2: optional enum_type.PatchPoiPromptTypeEnum ItemPatchPoiPromptMarkV2,
	3: optional string Extra
}

struct StickerStruct {
	1: required string Id,
	2: required UrlStruct IconUrl,
	3: required string Link,
	4: required string Title,
	5: required i32 Type,
	6: optional string Name,
	7: optional string DesignerId,
	8: optional string DesignerEncryptedId,
	9: optional i64 UserCount,
	10: optional string OpenUrl,
	11: optional string ComplianceData,
	12: optional i64 ItemJointPunishment
}

struct XSpaceStruct {
	// xs房间ID
	1: required i64 RoomId,
	// xs连线时长，单位秒
	2: required i64 Duration,
	// xs连线日期，时间戳
	3: required i64 XSTime,
	// 每个Notice的标题
	4: required string XSTitle,
	// 每个Notice的详情
	5: required string XSContent,
}

struct VideoControlStruct {
	// 能否下载
	1: optional bool AllowDownload,
	// 能否合拍
	2: optional bool AllowDuet,
	// 能否抢镜
	3: optional bool AllowReact,
	// 0不可拖动 1进度条可拖动
	4: optional i32 DraftProgressBar,
	// 0不允许分享 1分享走下载 2分享走二维码
	5: optional i32 ShareType,
	// 0不显示进度条 1显示进度条
	6: optional i32 ShowProgressBar,
	// 无法下载原因类型 0水印转码未完成 1审核未通过
	7: optional i32 PreventDownloadType,
	//true 允许动态壁纸, false 不允许动态壁纸
	8: optional bool AllowDynamicWallpaper,
	//1：定时中，0：定时结束
	9: optional i32 TimerStatus,
	// 是否能使用音乐，进入音乐详情页
	10: optional bool AllowUseMusic,
	// 隐藏下载按钮
	11: optional bool HideDownload,
	// 隐藏dou+按钮
	12: optional bool HideDouplus,
	// 当前视频能否被他人stitch
	13: optional bool AllowStitch,
	//针对作者 视频维度下载权限设置 0允许 3禁止下载
	14: optional i32 DownloadSetting,
	// 能否分享到日常
	15: optional bool AllowShare,
	// 能否设置分享日常权限
	16: optional bool ShareGrayed,
	17: optional bool DownloadIgnoreVisibility,   // 标记是否为可见性解耦后的下载权限
    18: optional bool ShareIgnoreVisibility,     // 标记是否为可见性解耦后的分享到日常权限
    19: optional bool DuetIgnoreVisibility,     // 标记是否为可见性解耦后合拍的权限
    // 下载权限
    20: optional PrivacyInfo DownloadInfo,
    // 合拍权限
    21: optional PrivacyInfo DuetInfo,
	// 转文字权限
	22: optional bool AllowTranscribe, // 已废弃
	23: optional i32 AllowTranscribeV2,
    24: optional bool AllowProjectScreen, //是否可投屏
    25: optional string DisableProjectScreenReason, //禁止投屏的原因
    26: optional i32 ScreencastOnly, //0未知 1无仅可投 2仅可投鲜时光
	27: optional bool AllowRecord, //能否录屏
    28: optional string DisableRecordReason,//禁止录屏原因
	29: optional TimerVideoInfo TimerInfo, // 定时发布关联信息
	30: optional AllowRecordTimeScope AllowRecordTimeScope, // 允许录屏时间范围
}

struct AllowRecordTimeScope {    // 允许录屏时间范围
    1: optional i64 StartTime,  // 开始时间
    2: optional i64 EndTime,  // 结束时间
}

struct TimerVideoInfo {    // 定时发布关联信息
    1: optional i64 PublicTime,  // item.create_time 更新为用户设置的到期时间
    2: optional UserStatusEnum TimerStatus, //用户设置的状态 //0公开 1私密 2朋友可见
}

struct VideoStruct {
	1: required string Id,
	// 高度
	2: required i32 Height,
	// 宽度
	3: required i32 Width,
	// 视频时长
	4: required i32 Duration,
	// 分辨率(default, 360p, 540p, 720p)
	5: required string Ratio,
	// 下载视频是否包含动态水印
	6: required bool HasWatermark,
	// 封面地址
	7: required UrlStruct Cover,
	// 大图封面地址
	8: required UrlStruct OriginCover,
	// Bitrate 配置
	9: optional list<BitrateStruct> BitrateInfos,
	// 动态封面
	10: optional UrlStruct DynamicCover,
	// H264播放地址
	11: optional UrlStruct PlayAddrH264,
	// 播放地址
	12: optional UrlStruct PlayAddr,
	// 下载地址
	13: optional UrlStruct DownloadAddr,
	// 低码率播放地址
	14: optional UrlStruct PlayAddrLowbr,
	// 明星视频未消音下载地址
	15: optional UrlStruct NewDownloadAddr,
	// 带结尾水印的视频
	16: optional UrlStruct DownloadSuffixLogoAddr,
	// H265播放地址
	17: optional UrlStruct PlayAddrH265,
	// 编码格式
	18: optional string CodecType,
	// 类UI水印下载地址
	19: optional UrlStruct UIAlikeDownloadAddr,
	// Caption水印下载地址
	20: optional UrlStruct CaptionDownloadAddr,
	// 视频内容类型
	21: optional i32 ContentType,
	// 分发的视频的控制字段
	22: optional VideoControlStruct ControlInfo,
	// cdl_url过期时间，utc时间，和时区无关, 单位具体到秒
	23: optional i64 CdnUrlExpired,
	// 是否是较长视频(1-15min)
	24: optional i32 IsLongVideo,
	// dash 播放地址
	25: optional string VideoModel,
	// 新的6帧动态封面，相比老的9帧DynamicCover封面减少客户端内存消耗。
	26: optional UrlStruct AnimatedCover,
	// 在访问视频地址时，是否需要提供身份凭证信息
	27: optional bool NeedSetToken,
	//ai-lab根据视频内容提取的视频封面
	28: optional UrlStruct AiCover,
	//用户是否手选封面, >=0 时，表示首选封面，值表示时间
	29: optional double CoverTsp,
	//场景化及其他定制化下载地址,key包括 snapchat，lite，suffix_scene...
	30: optional map<string,UrlStruct> MiscDownloadAddrs,
	// 是否完成转码回调
	31: optional bool IsCallBack,
	// used for replace playAddrH265
	32: optional UrlStruct PlayAddrByteVC1,
	// 雪碧图
	33: optional list<BigThumb> BigThumbs,
	// 视频的一些meta信息map<string, string>: embedding向量，音量均衡参数等
	34: optional string meta,
	// 视频是否使用静态封面
	35: optional bool UseStaticCover,
	// 用户投稿时选择的裁剪后的优化封面
	36: optional UrlStruct OptimizedCover,
	// 是否是横屏视频 0-竖屏视频 1-横屏视频 2-伪横屏视频
	37: optional i32 HorizontalType,
	// 伪横屏视频切割坐标
	38: optional FakeHorizontalStruct FakeHorizontalInfo,
	// Pad满屏策略
	39: optional string FullscreenStrategy,
	// 视频标签信息
	40: optional FuseVideoLabelStruct FuseVideoLabelInfo,
	// 视频格式，mp4/dash
	41: optional string Format,
	// from pb builder
	100: optional double TrailerStartTime,
	// from pb builder
	101: optional string MiscDownloadAddrsStr,
	// 一闪而过投稿高斯模糊封面
	102: optional UrlStruct BlurCover,
	// 经过审核需要重置的封面
	103: optional UrlStruct ResetCover,
	// 源视频是否为HDR
	104: optional i32 IsSourceHDR,
	// cover字段对应的原始比例封面
	105: optional UrlStruct CoverOriginalScale,
	106: optional UrlStruct GaussianCover,
	// 不发不能看 马赛克封面
    107: optional UrlStruct MaskCover,
    // 客户端兜底播放
    108: optional string PlayAuthToken,
    // 加载优化 缩略封面图
    109: optional UrlStruct ThumbCover,
    // 付费长视频 试看dash播放地址
    110: optional string LongVideoModelDemo,
    // 个人页作品列表——1拆N视频替换封面
    111: optional UrlStruct ReplaceSeriesCover,
    // 实际视频时长，用于付费长视频
    112: optional i32 LongVideoRealDuration
    // 中等尺寸 封面图
    113: optional UrlStruct MediumCover
    // 视频画像
    114: optional list<PortraitStruct> PortraitInfos,
    // 视频上下黑边信息（三明治信息）
    115: optional i32 BlackLevel,
	116: optional UrlStruct EffectDynamicCover,
	117: optional string EffectDynamicCoverAverageColor,
	// yumme ai智能裁剪封面，与视频尺寸匹配
	118: optional UrlStruct VsizeCover,
	119: optional UrlStruct ExtractedFrame,
	// 音频的Bitrate配置
	120: optional list<BitrateAudioStruct> BitrateAudioInfos,
	// yumme ai智能裁剪封面(竖版或方形)
	121: optional UrlStruct YCover
	// yumme ai智能裁剪封面(横版)
	122: optional UrlStruct YCoverHor
	// yumme 服务端替换视频标题
	123: optional string YTitle
	// yumme 服务端替换标题后重新下发的textExtra
	124: optional list<TextExtraStruct> YTextExtra
	// 视频的横版封面
	125: optional UrlStruct HorizontalCover
	// 视频的横版封面在视频中的时间点
	126: optional double HorizontalCoverTsp
	// 经验频道 裁剪封面
	127: optional UrlStruct WannaCover
	// 封面工具的编辑信息
	128: optional string CoverToolsExtendInfo
	// 推人场景 新朋友日常作品高斯模糊封面
	129: optional UrlStruct Story24BlurCover,
	// 封面检测结果透传
	130: optional string CoverOptimizationInfo,
	// 抖音pc场景的用户原封面
	131: optional UrlStruct RawCover,
}

struct PortraitStruct {
    1: optional string Key,
    2: optional string Val,
}

struct FuseVideoLabelStruct {
	1:  string TagName,
	2:  string TagId,
	3:  double Prob,
	4:  i32 Level,
}

struct FakeHorizontalStruct {
	1:  double Top,
	2:  double Bottom,
	3:  double Left,
	4:  double Right,
	5:  bool NeedDefaultScale, // 是否需要默认缩放伪横屏，目前只有抖音PC使用
}

struct BigThumb {
	1:  i64 ImgNum,
	2:  string ImgURI,
	3:  string ImgURL,
	4:  i64 ImgXSize,
	5:  i64 ImgYSize,
	6:  i64 ImgXLen,
	7:  i64 ImgYLen,
	8:  double Duration,
	9:  string Fext,
	10:  double Interval,
	11: list<string> ImgURIs,
	12: list<string> ImgURLs,
}


struct VoteOptionStruct {
	1: required i64 Id,
	2: required i64 Count,
	3: required string Text,
}

struct VoteStruct {
	1: required i64 Id,
	2: required i64 CreateTime,
	3: required i64 CreatorId,
	4: required i64 EndTime,
	5: required list<VoteOptionStruct> OptionInfos,
	6: required string Question,
	7: required i64 RefId,
	8: required i64 RefType,
	9: optional i64 SelectedOptionId,
	10: required i64 StartTime,
	11: required i32 Status,
	12: required i64 UpdateTime,
	13: optional enum_type.VoteTypeEnum VoteType
}

struct MentionStickerStruct {
	1: required string UserName,
	2: optional string SecUid,
	3: optional string UserId,
	4: optional UrlStruct AvatarThumb,
	5: optional string Signature,
}

struct HashTagStickerStruct {
	1: required string HashTagName,
	2: optional i64 HashTagId,
	3: optional i32 CityCode,
	4: optional string CityName,
	5: optional string StickerId,
}

struct HotspotInfoStruct {
    1: required string HotspotId,
    2: optional string HotspotText,
}

struct LivePreviewStruct {
	1: required i64 LiveStartTime,
	2: optional i64 LivePreviewId,
	3: optional i32 Status,
	4: optional bool IsShowBtn,
	5: optional bool HasClickedBtn,
	6: optional i32 Type,
	7: optional i64 AppointmentId,
	8: optional list<i64> PromotionIds,
	9: optional string PromotionDetail,
	10: optional string StickerExtraInfo,
}

struct TextInteractionStickerStruct {
	1: required enum_type.TextInteractionTypeEnum Type,
	2: required i32 Index,
	3: optional MentionStickerStruct MentionInfo,
	4: optional HashTagStickerStruct HashTagInfo,
    5: optional HotspotInfoStruct HotspotInfo,
}

struct GrootInfoStruct {
	1: optional i64 id,
	2: optional string name,
}

struct GrootInteractionStickerStruct {
	1: optional i32 Type,
	2: optional i32 Index,
	3: optional GrootInfoStruct UserGrootInfo,
	4: optional string GrootH5,
}

struct VideoShareInfoStruct {
	1: optional string Id,
	2: optional string AuthorUid,
	3: optional string SecAuthorUid,
	4: optional string AuthorName,
	5: optional string CommentId,
	6: optional string CommentUserId,
	7: optional string CommentSecUserId,
	8: optional string CommentContent,
	9: optional string CommentUserNickname,
	10: optional string ImageIndex,
	11: optional string ShareFromKey,
	12: optional string ShareFromType,
	13: optional string AllowRepeatShare,
	14: optional string Extra,
	15: optional string Source,
}

struct ReplyToAwemeStruct {
	1: optional string AwemeId,
	2: optional string Desc,
	3: optional string AuthorNickname,
	4: optional UrlStruct Cover,
	5: optional i32 AwemeType,
	6: optional bool IsAvailable,
	7: optional UrlStruct AuthorAvatar,
	8: optional i32 Type,
}

struct ReplyToCommentStruct {
	1: optional i32 Type,
	2: optional string CommentText,
	3: optional UrlStruct CommentSticker,
	4: optional string CommentAuthorNickname,
	5: optional UrlStruct CommentAuthorAvatar,
	6: optional UrlStruct AwemeCover,
	7: optional string AwemeDesc,
    8: optional bool CommentDeleted,
    9: optional i32 NativeType,
	10: optional list<ReplyAuthorInfo> ReplyAuthorInfoList,
	11: optional i64 TotalReply,
}

struct ReplyAuthorInfo {
	1: optional i64 Id,
	2: optional i64 ItemId,
	3: optional UrlStruct Avatar,
}

struct QuestionCommentInfo {
    1: optional string CommentText,
    2: optional bool CommentDelete,
    3: optional UrlStruct CommentSticker,
}

struct VideoQuestionAnswerStruct {
    1: optional i64 AuthorUid,
    2: optional i64 QuestionId,
    3: optional string QuestionText,
    4: optional string QuestionAuthorNickname,
    5: optional list<ReplyAuthorInfo> ReplyAuthorInfoList,
    6: optional i64 TotalReply,
    7: optional i32 QuestionReviewStatus,
	8: optional bool IsQuestionItem,
	9: optional i32 QuestionType,
	10: optional i32 QuestionSource,
	11: optional QuestionCommentInfo QuestionComment,
}

struct MusicStickerStruct {
	1: optional i32 Type,
	2: optional string MusicId,
}

// Special Structs
struct InteractionStruct {
	1: required enum_type.InteractionTypeEnum Type,
	2: required i32 Index,
	3: optional string Attr,
	4: optional PoiStruct PoiInfo,
	5: optional string TrackInfo,
	6: optional VoteStruct VoteInfo,
	7: optional string TextInfo,
	8: optional MentionStickerStruct MentionInfo,
	9: optional HashTagStickerStruct HashTagInfo,
	10: optional LivePreviewStruct LivePreviewInfo,
	11: optional list<TextInteractionStickerStruct> TextInteraction,
	12: optional list<GrootInteractionStickerStruct> GrootInteraction,
	13: optional VideoShareInfoStruct VideoShareInfo,
	14: optional ReplyToAwemeStruct ReplyToAweme,
	15: optional TagInteractionStickerStruct TagInteraction,
	16: optional i32 ImageIndex,
	17: optional ReplyToCommentStruct ReplyToComment,
	18: optional string StickerConfig,
	19: optional ScanInteractionStruct ScanInfo,
	// ScanInfo 废弃掉，因为存在不兼容版本
	20: optional VideoShareInfoStruct PostShareInfo,
	21: optional ScanInteractionV2Struct ScanInteraction,
	22: optional FlashMobStruct FlashMobInfo,
    23: optional LiveShareInfoStruct LiveShareInfo,
	24: optional VideoQuestionAnswerStruct VideoQuestionAnswerInfo,
	25: optional i32 ClipScope, // 1: 应用到全部 2: 应用到单段
	26: optional MusicStickerStruct MusicInfo,
	27: optional ImGroupStickerStruct ImGroupInfo,
	28: optional AppointmentStickerStruct AppointmentInfo, // 预约贴纸信息
}


struct AppointmentStickerStruct {
	1: optional string AppointmentID, // 预约ID
	2: optional string Title, // 预约名称
	3: optional i32 Type, // 预约贴纸类型 0 非法 1 剧集预约贴纸
	4: optional i64 OnlineTime, // 预约上线时间 秒级时间戳
	5: optional i32 AppointmentStatus,// 预约状态 1 未预约 2 已预约
	6: optional UrlStruct IconImg, // icon链接
	7: optional string ButtonText, // 预约按钮文本
	8: optional i64 AppointmentType, // 预约类型 对齐预约中台
	9: optional string Extra, 
}

struct LiveShareInfoStruct {
    1: optional i32 Status,
    2: optional i64 RoomId,
}

struct ScanInteractionV2Struct {
    1: optional UrlStruct SrcImage,
    2: optional string Species,
    // 物种类型，比如动物
    3: optional string Label,
    // 具体的物种，比如河狸
    4: optional string Schema,
    // 跳转schema的固定部分
    5: optional string Crop,
    // 框的四个点归一化坐标 left,top,right,bottom
    6: optional i32 CropIndex,
    // 客户端第一个框，搜索客户端-》相机客户端
    7: optional string LabelId,
    // tag_id
    8: optional double Prob,
    // 置信度，非必须
    9: optional string WikiId,
    // wiki id，非必须
}

struct ScanInteractionStruct {
    1: optional UrlStruct SrcImage,
    2: optional string Species,
    // 物种类型，比如动物
    3: optional string Label,
    // 具体的物种，比如河狸
    4: optional string Schema,
    // 跳转schema的固定部分
    5: optional string Crop,
    // 框的四个点归一化坐标 left,top,right,bottom
    6: optional i32 CropIndex,
    // 客户端第一个框，搜索客户端-》相机客户端
    7: optional string LabelId,
    // tag_id
    8: optional double Prob,
    // 置信度，非必须
    9: optional string WikiId,
    // wiki id，非必须
}

struct TagInteractionStickerStruct {
	1: optional enum_type.TagInteractionTypeEnum Type,
	// 标签方向
	2: optional i32 Orientation,
	// 标签名字
	3: optional string Title,
	4: optional CustomTagInteractionStickerStruct CustomTag,
	5: optional UserTagInteractionStickerStruct UserTag,
	6: optional PoiTagInteractionStickerStruct PoiTag,
	7: optional ProductTagInteractionStickerStruct ProductTag,
	8: optional BrandTagInteractionStickerStruct BrandTag,
	9: optional LifeCardTagInteractionStickerStruct LifeCardTag,
	10: optional string SubTitle,
}

struct LifeCardTagInteractionStickerStruct {
	1: optional string Schema,
    2: optional i32 PrefixIcon, // 标签前图标 0:无 1:地理位置
	3: optional string Extra, // 额外信息
}

struct CustomTagInteractionStickerStruct {
	1: optional string Name,
}

struct UserTagInteractionStickerStruct {
	1: optional string UserId,
	2: optional string UserSecId,
}

struct PoiTagInteractionStickerStruct {
	1: optional string PoiId,
}

struct ProductTagInteractionStickerStruct {
	1: optional string ProductId,
	2: optional string Schema,
}

struct BrandTagInteractionStickerStruct {
	1: optional string BrandId,
	2: optional string Schema,
}

// Challenge Structs
struct ChallengeBannerStruct {
	1: optional UrlStruct Icon,
	2: optional string WebUrl,
	3: optional string OpenUrl,
}

struct ChallengeCommerceStruct {
	1: optional UrlStruct BackGroundImageUrl,
	2: optional string DisclaimerTitle,
	3: optional string DisclaimerContent,
	4: optional string LinkAction,
	5: optional string LinkText,
	6: optional string StickerId,
}

struct ChallengeI18nStruct {
	1: required string Desc,
	2: required string Language,
	3: required string Name,
	4: optional string DisclaimerContent,
}

//素材
struct ChallengeMaterial {
	//1:影视 2:明星
	1: required i32 SubType,
	//能够通过这个ID去搜索的
	2: required i64 BindId,
	//挑战类型   1电影 2:电视剧 3:综艺 4:明星 5: 其他
	3: optional i32 Type,
}

struct ChallengeMediaSourceButtonStruct {
	// 按钮内icon
	1: required UrlStruct Icon,
	// 按钮上文案
	2: required string Name,
	// 1-原生播放 2-小程序 3-合集
	3: required i32 ButtonType,
	// 跳转协议
	4: required string Schema,
	// eid
	5: optional i64 Eid,
	// aid
	6: optional i64 Aid,
}

struct ChallengeOtherStruct {
	1: required i32 SubType,
	// mt商业化 迷你挑战赛
	2: required i32 CommerceType,
	// 运营配置的话题头图
	3: optional string HashTagProfile,
	// 自动设置的话题头图
	4: optional string AutoHashTagProfile,
	// 话题是否绑定电影类卡片
	5: optional bool HasMedia,
	// 运营配置的话题背景图
	6: optional string BackgroundImage,
	// 透传的Extra字段
	7: optional string Extra,
	// 注意：该字段已废弃
	8: optional string StickerId,
	// 本地话题关联贴纸id
	9: optional string NearbyHashtagStickerId,
	// 话题安全等级，只对部分Source开放
	10: optional string ChSecLevel,
	// from awemeStructV1 pb_builder
	11: optional bool IsLive,
	// 是否为低质话题
	12: optional i32 IsLow,
}

struct ChallengeRelatedMediaSourceStruct {
	// 标题
	1: required string Title,
	// 查看更多文案
	2: required string ReadMore,
	// 查看更多链接
	3: required string ReadMoreUrl,
	// 1电视剧 2动漫 3电影 4综艺 5新闻 6音乐 7体育 8纪录片 9儿童 10游戏 11直播 12短内容合集
	4: required i32 MediaType,
	// 影视综名称
	5: required string MediaName,
	// 封面
	6: required UrlStruct Cover,
	// 上映日期
	7: optional string ReleaseDate,
	// 时长（单位：分钟）
	8: optional i32 Duration,
	// 电视剧或综艺集数
	9: optional i32 SeqsCount,
	// 剧情分类(家庭、喜剧)
	10: optional list<string> Classification,
	// 评分
	11: optional double Rating,
	// 评分状态
	12: required i32 RatingStatus,
	// tag
	13: required string MediaTag,
	// 按钮区域
	14: optional ChallengeMediaSourceButtonStruct button,
	// 1-有片源 2-无片源，无购票链接 3-无片源，有购票链接
	15: optional i32 MediaSrcType,
	// 影片介绍
	16: optional string MediaDesc,
	// 媒资id
	17: required i64 CompassId,
	// 剧集信息
	18: optional string EpisodeInfoRawData,
	// from awemeStructV1 pb_builder
	19: optional string Desc,
	20: optional i64 HotScore, // 热度值
    21: optional string ReleaseArea, // 上映地区
    22: list<string> Actors, // 主创信息
    23: optional string InterventionPlatformName, // 更新平台
    24: optional string BillboardUrl,
    25: optional i32 BillboardRank,
    26: optional string BillboardName,
    27: optional i32 BillboardType,
	28: optional list<string> Versions,
	29: optional list<string> Directors,
}

struct ChallengeStatisticsStruct {
	1: required i32 UseCount,
	2: required i64 ViewCount,
}

// Item Structs
struct ItemACLStruct {
	1: optional ACLCommonStruct DownloadGeneral,
	2: optional map<string,ACLCommonStruct> DownloadOther,
}

struct ItemActivityStruct {
	1: optional ActivityCommerceStruct ActivityPendantInfo,
	2: optional ActivityCommerceStruct GestureRedPacketInfo,
	3: optional ActivityTrilateralCooperationStruct TrilateralCooperationInfo,
}

struct ItemAdStruct {
	1: optional list<CommerceConfigStruct> CommerceConfigInfos,
	2: optional string LinkRawData,
	3: optional string LinkSendData,
	4: optional i32 LinkType,
	// 投放的广告计划, '\n'分隔
	5: optional string Schedule,
	// Mario 返回的 raw_data
	6: optional string MarioRawData,
	7: optional string LinkDiggData,
}

struct ItemAnchorStruct {
	1: required enum_type.AnchorType Type,
	2: optional string Keyword,
	3: optional string Lang,
	4: optional enum_type.AnchorState State,
	5: optional string Url,
	6: optional i64 Id,
	7: optional string Extra,
}

struct ItemAnchorMTStruct {
	1: optional string Id,
	2: required enum_type.AnchorType Type,
	3: optional string Keyword,
	4: optional string Url,
	5: optional UrlStruct Icon,
	6: optional string Schema,
	7: optional string Language,
	8: optional string Extra,
	9: optional string DeepLink,
	10: optional string UniversalLink,
	11: optional enum_type.AnchorGeneralType GeneralType,
	12: optional string LogExtra,
	13: optional string Description,
	14: optional UrlStruct Thumbnail,
	15: optional list<AnchorActionStruct> Actions,
	16: optional map<string,string> ExtraInfo,
}

struct AnchorActionStruct {
	1: optional UrlStruct Icon,
	2: optional string Schema,
	3: optional enum_type.AnchorActionType action_type,
}

struct ItemAnchorDisplayStruct {
	1: optional i64 AfterPlayTimes,
	2: optional i64 AfterPlayMS,
	// 多阶段延迟出现时间
	3: optional list<i64> TimeSlices,
	// 回滑进度条是否一直展示锚点
	4: optional bool IsSlideBackDisplay,
	// 附加信息
	5: optional string Extra,
}

// 锚点样式信息
struct AnchorStyleInfo {
    1:optional string DefaultIcon,
    2:optional map<string, string> SceneIcon,
    100: optional map<string, string> Extra,
}

struct ItemAnchorStructV2 {
	1: required string Id,
	2: required i32 Type,
	3: optional string Title,
	// 跳转端内 native 页面或端外
	4: optional string OpenUrl,
	// 跳转端内落地页
	5: optional string WebUrl,
	// 跳转小程序
	6: optional string MpUrl,
	7: optional UrlStruct Icon,
	// 锚点类型名称
	8: optional string TitleTag,
	// 锚点延迟显示
	9: optional ItemAnchorDisplayStruct DisplayInfo,
	// 业务方业务数据
	10: optional string Content,
	// 锚点样式信息
	11: optional AnchorStyleInfo StyleInfo,
	// 门店推广
	12: optional bool IsCommerceIntention,
	99: optional string Extra,
	100: optional string LogExtra,
}

// 多锚点数据
struct ItemAnchorListStruct {
	// 多锚点信息
	1: optional ItemAnchorStructV2 Anchors,
	// 样式信息
	2: optional string Style,
	// 锚点列表
	3: optional list<ItemAnchorStructV2> AnchorsInfo,
	// 附加信息
	99: optional string Extra,
	100: optional string LogExtra,
}

struct ItemReadingBarStruct {
	// 头条小程序id
	1: required string Id,
	2: required string Title,
	// 小程序启动schema
	3: required string OpenUrl,
	// 文章web url
	4: optional string WebUrl,
	// 小程序icon
	5: optional UrlStruct Icon,
	// 直接打开app的schema
	6: optional string OpenAppSchema,
	// 传递给客户端的实验参数
	7: optional string ABParam,
	// 阅读bar tag
	8: optional string Tag,
	// lite阅读bar提示文字
	10: optional string Prefix,
	// lite阅读bar标题颜色
	11: optional string FontColor,
	// lite阅读bar背景色
	12: optional string BackgroundColor,
	99: optional string Extra,
	100: optional string LogExtra,
}

struct ItemCaptionAnchorStruct {
	1: optional string Keyword,
	2: optional string Link,
	3: optional UrlStruct Icon,
}

struct ItemCaptionStruct {
	1: required string Keyword,
	2: required string Link,
	3: optional string Extra,
}

struct ItemCloudGameEntranceStruct {
	1: required string ButtonColor,
	2: required string ButtonTitle,
	3: optional string StickerInfoUrl,
	4: optional string StickerTitle,
	5: optional i32 ShowStickerTime,
}

struct ItemCloudGameStruct {
	1: required string CloudGameId,
	2: required ItemCloudGameEntranceStruct EntranceInfo,
	3: optional string DownloadUrl,
	4: optional string Extra,
}

// 通用标签类型
struct ItemCommonLabelStruct {
	// 同城标签
	1: optional ItemLabelStruct Nearby,
}

struct ItemGameStruct {
	1: required enum_type.GameTypeEnum Type,
	2: required i32 Score,
}

struct ItemImageStruct {
	1: required string Id,
	2: required i32 Height,
	3: required i32 Width,
	4: required UrlStruct Large,
	5: required UrlStruct Thumb,
}

struct ItemLabelStruct {
	1: optional i32 Type,
	2: optional string Text,
}

// 搜索caption关键词匹配信息
struct ItemLinkMatchStruct {
	1: required i32 TotalLimit,
	2: required i32 QueryLimit = 2,
	3: optional list<ItemMatchStruct> MatchInfo,
	4: optional ItemCaptionStruct CaptionInfo,
	5: optional ItemCaptionAnchorStruct CaptionAnchor,
}

struct ItemMatchStruct {
	1: required string Query,
	2: required string Link,
	3: required i32 Begin,
	4: required i32 End,
}

struct ItemMicroAppStruct {
	// 小程序 ID
	1: required string AppId,
	// 小程序名称
	2: required string AppName,
	// 小程序描述
	3: required string Description,
	// 小程序图标
	4: required string Icon,
	// 小游戏屏幕方向 1 表示横屏，2 表示竖屏
	5: required i16 Orientation,
	// 小程序 schema
	6: required string Schema,
	// 状态 0 末发布 1 已发布 2 已下线
	7: required i16 State,
	// 简介
	8: required string Summary,
	// 小程序title
	9: required string Title,
	// 类型 1小程序 2小游戏 3文章
	10: required i16 Type,
	// 视频卡片图
	11: optional string CardImageUrl,
	// 视频卡片标注文案
	12: optional string CardText,
	// 视频卡片多少秒后展示
	13: optional i32 CardWaitTime,
	// 兜底页面URL
	14: optional string WebUrl,
}

struct ItemNationalTaskLinkStruct {
	1: required i64 Id,
	2: required string Title,
	3: required string SubTitle,
	4: required UrlStruct AvatarIcon,
	//H5落地页
	5: optional string WebUrl,
	6: optional string OpenUrl,
}

struct LynxButtonStruct {
	1: optional string ButtonBackgroundColor,
	2: optional string Source,
	3: optional string Title,
	4: optional string ImageUrl,
	5: optional string LiveGroupId,
}

struct LynxRawDataStruct {
	// 标记Lynx数据来源
	1: optional string Refer,
	// 落地页标题
	2: optional string WebTitle,
	// 不同业务类
	3: optional i32 TemplateType,
	// 应用直达链接
	4: optional string OpenUrl,
	// Button数据
	5: optional LynxButtonStruct ButtonInfo,
	// 落地页地址
	6: optional string WebUrl,
}

struct ItemLiveAppointmentStruct {
	// 预约组件的跳转落地页
	1: optional string WebUrl,
	// 类型
	2: optional string Type,
	// 客户端透传给前端
	3: optional LynxRawDataStruct LynxRawData,
	// 渲染模板
	4: optional string TemplateUrl,
	// 控制组件展现时机
	5: optional i32 ShowButtonSeconds,
	6: optional i32 Position,
	7: optional i64 ButtonStyle,
}

struct ItemNationalTaskStruct {
	// 全民任务link信息
	1: optional ItemNationalTaskLinkStruct NationalTaskLinkInfo,
	// 全民任务直播预约组件信息
	2: optional ItemLiveAppointmentStruct NationalLiveAppointment,
}

struct ItemOpenPlatformStruct {
	1: required string Id,
	2: required string Name,
	3: optional UrlStruct Icon,
	4: optional string Link,
	5: optional string RawData,
}

struct ImageNetflowIncentiveStrcut {
	// 激励文案内容，不为空的时候展示
  	1: optional string Content,
}

struct ItemOtherStruct {
	1: optional i32 BodydanceScore,
	2: optional string DescLanguage,
	3: optional string ExtraInfo,
	4: optional string FaceInfo,
	5: optional i64 ForwardCommentId,
	6: optional list<string> GeoFencing,
	7: optional string LandingPageUrl,
	8: optional string MiscRawData,
	9: optional i64 OriginCommentId,
	10: optional i64 OriginItemId,
	11: optional i64 PreForwardItemId,
	12: optional i32 Rate,
	13: optional string RelationLabel,
	14: optional i64 RelationLabelUserId,
	15: optional list<string> SiblingDescs,
	16: optional list<string> SiblingNames,
	17: optional string SortLabel,
	18: optional i32 SourceAppId,
	19: optional i32 SourceType,
	20: optional string StickerIds,
	21: optional i32 TakeDownReason,
	22: optional string TakeDownDesc,
	23: optional list<TextExtraStruct> TextExtraInfos,
	24: optional double TrailerStartTime,
	// 下发类型
	25: optional enum_type.VideoDistributeTypeEnum VideoDistributeType,
	26: optional i32 AdSource,
	27: optional string Ancestor,
	28: optional string TimerInfo,
	29: optional string GPSLongitude,
	30: optional string GPSLatitude,
	31: optional i32 IsPreview,
	// 视频审核状态通知
	32: optional ItemReviewResultStruct ReviewResultInfo,
	33: optional bool ShowShareLink,
	34: optional MaskStruct MaskInfo,
	// 火山视频访问评论时的 Group ID
	35: optional i64 CommentGID,
	36: optional ItemVideoReplyStruct VideoReplyInfo,
	37: optional string NearbyLabel,
	// 抖音投稿直播回放、高光、录屏的房间id
	38: optional i64 LiveId,
	// 走特殊消重需求的item标识
	39: optional list<enum_type.ImprTagEnum> ImprTags,
	// item 的 区县信息
	40: optional string District,
	// 创建 item 的 IP
	41: optional string IP,
	// The list of regions where the video is distributed.
	42: optional list<string> PersonGeoFencing,
	// item的特殊模式，1-青少年模式（判断来源于item extra的is_teen_video字段）
	43: optional i32 SpecialMode,
	//活动信息
	44: optional ActivityStruct ActivityInfo,
	// is item from familiar
	45: optional bool IsFamiliar,
	// 直播回放类型，live_replay,live_highlight,live_record etc..
	46: optional string LiveType,
	// 打榜上报类型, eg: star_challenge,
	47: optional string PostBillboardType,
	48: optional i32 IsStory,
	//item动态封面幅度变化检测结果
	49: optional bool CoverOverChange,
	// Lightning快拍开拍引导
	50: optional bool LightningGuide,
	// story ttl
	51: optional i32 StoryTTL,
	// item 的l2位置信息
	52: optional string City,
	//熟人社交 跟拍类型 0不跟拍 1拍同款道具 2拍同款音乐
	53: optional i32 FollowUpType,
	// 隐藏合集入口
	54: optional bool HideMixEntry,
	// 政务同素材消重simid
	55: optional i64 MediaSimId,
	// 限时可见标签
	56: optional string StoryTtlLabel,
	57: optional i32 IsTextMode,
	// 是否显示视觉搜索入口
	58: optional bool ShowVisualSearchEntry,
	//视觉离线搜索商品
	59: optional string VisualSearchLabel,
	// 视觉搜索图片
	60: optional string VisualSearchImgUrl,
	// item的类型，判断是否是青少年视频(sign from item.extra.is_teen_video)
	61: optional i32 IsTeenVideo,
	// 0: 作品动态封面非重复帧 1: 作品动态封面为重复帧
	62: optional i32 CoverExtraInfo,
	// 视频引导button类型，端上通过该字段获取结合settings配置展示对应的引导button
	63: optional i32 GuideBtnType,
	// 作品列表封面的曝光量文案："同城曝光XXX"，作为气泡显示于作品列表封面，投稿发布 2 天内显示
	64: optional string ExposureCoverText,
	// 从作品列表中进入的视频详情页底部的曝光量文案："曝光量XXX，附近yyykm以内有zzz人看过"，投稿发布 2 天内显示
	65: optional string ExposureDetailText,
	// TC21互动/彩蛋视频
	66: optional TC21InteractiveVideoStruct TC21InteractiveVideoInfo,
	// 58-60 字段的封装
	67: optional CommerceVisualSearch VisualSearch,
	68: optional string RawAdData,
	69: optional bool IsCreator,
	//凤岐专题配置
	70: optional string FengqiConfig,
	// k歌标识
	71: optional bool is_karaoke,
	// 搜索相关底部bar信息
	72: optional RelatedSearchBarInfoStruct RelatedSearchBarInfo,
	// 新版group_id_list
	73: optional list<i64> GroupIdListA,
	// 新版group_id_list
	74: optional list<i64> GroupIdListB,
	// 新版similar_id_list
	75: optional list<i64> SimilarIdListA,
	// 新版similar_id_list
	76: optional list<i64> SimilarIdListB,
	// 新版similar_id_list
	77: optional XiguaIncomeBarInfoStruct XiguaIncomeBarInfo,
	// 圈子id
	78: optional i64 AwemeCircleID,
	100: optional list<string> OriginCommentIdStrList,
	101: optional string NotifyMsg,
	// 是否进行播放安全检测
	102: optional bool NeedSafetyCheck,
	// 播放安全风险等级
	103: optional i32 PotentialRiskLevel,
	// 本地曝光信息
	104: optional LocalExposureStruct LocalExposureInfo,
	// 是否需要出现标记朋友按钮
	105: optional bool NeedMarkFriend,
	// 同城双列封面上展示在头像旁的曝光量文案，代替原位置上显示的距离
	106: optional string ExposureTextOnCover,
	// duet原视频id
	107: optional string DuetOrigin,
	//duet 的引导button文案
	108: optional string GuideBtnText,
	//通用button 配置
	109: optional string GuideBtnConfig,
	//通过button schema
	110: optional string GuideBtnSchema,
	111: optional i32 SafetyRate,
	// story 投稿来源类型
	112: optional i32 StorySourceType,
	// 被分享视频id
	113: optional string ShareFrom,
	// 是否为一闪而过投稿
	114: optional i32 IsMeteor,
	// 是否看过次视频，0|null：没有，1：看过
	115: optional i32 HasViewed,
	116: optional bool ShowFollowButton,
	117: optional i32 ShowFollowButtonTag,
	118: optional LivePaidRoomStruct livePaidRoom,
	119: optional string StorySectionId,
	// 点赞按钮类型
	120: optional string DiggBtnType,
	// 快捷评论类型
	121: optional string QuickCommentType,
	//文案分
	122: optional double CopyWritingScore,
	//是否包含文案
	123: optional bool HasCopyWriting,
	// 通用button支持双button
	124: optional GuideBtnStruct GuideBtn,
	125: optional bool ShowDuetAgg,
	//合唱标签
	126: optional bool IsDuetSing,
	// item的乡镇信息
	127: optional string Town,
	//搜索场景下西瓜视频评论外漏
	128: optional string XiguaCommentForSearch,
	// 图集取消配乐
	129: optional i32 NoSelectedMusic,
	// 是否为多段素材
	130: optional i32 IsMultiContent,
	131: optional i32 CategoryDa,
	// 合拍次数
	132: optional i64 DuetCount,
	// 回复类型
	133: optional enum_type.ReplyTypeEnum ReplyType,
	// 是否展示收藏音乐按钮
	134: optional bool ShowMusicCollectButton,
	// 视频是否被道具选为封面
    135: optional i32 IsEffectSelected,
	// 音乐收藏标题
	136: optional string MusicDisplayMappingTitle,
	// 活动视频类型
    137: optional i64 ActivityVideoType,
    // 创作者对item的设置
    138: optional CreatorItemSettingStruct CreatorItemSetting,
    // 点赞特效
    139: optional DiggLottieStruct DiggLottie,
    // 关联音乐锚点
    140: optional RelatedMusicAnchorStruct RelatedMusicAnchor,
    // 视频的一级二级三级分类
    141: optional list<VideoTagStruct> VideoTags,
    // 新增音乐剪裁信息
    142: optional ImageAlbumMusicInfo ImageAlbumMusic,
    // 是否收藏过该作者其他视频
    143: optional bool CollectOtherItem,
    // 知识类视频底bar
    144: optional KnowledgeBar KnowledgeBar,
    // 推荐召回类型，0: unknown 1: 普通召回 2: 熟人召回 3: 共同兴趣召回
    145: optional i32 RecallType,
    // 音乐转盘翻转视频池
    146: optional list<i64> MusicGuidanceTagList,
    // 快拍过期时间（单位分钟）180:3小时 1440:1天 4320:3天
    147: optional i32 StoryTTLMinute,
    148: optional i32 IsCollectsSelected,
	// 是否为学习内容
	149: optional bool IsStudyContent,
	// 视频章节信息
	150: optional list<ChapterInfo> ChapterList,
    // 粉丝通底 bar
	151: optional FansToolBarStruct FansToolBar,
	// 西瓜打包额外信息合集
	152: optional string XiguaExtraInfo,
	// 原生文字投稿
	153: optional bool IsOriginText,
	// 是否为图文卡点视频
	154: optional bool IsImageBeat,
	// 音乐宣推评论锚点
	155:optional MusicPromoteCommentAnchorStruct MusicPromoteCommentAnchor,
	// 密友时刻作品类型 0-图片 1-视频 2-图集 3-日常
	156:optional i32 CFItemType,
	// "不喜欢" 新 ui Deprecated
	158: optional DislikeDimensionStruct DislikeDimension,
	// "不喜欢" 新 ui 
	159: optional list<DislikeDimensionStruct> DislikeDimensionList,
	// 封面消重用gid_list
	160: optional list<i64> CoverGidListA,
    // 封面消重用gid_list
    161: optional list<i64> CoverGidListB,
    // Seo视频相关结构化信息
    162: optional SeoInfoStruct SeoInfo,
	// 视频框架控制相关字段
	163: optional string MainArchCommon,
	// 快捷评论
    164: optional bool FastComment,
    // now题材作品 0-非now题材作品 1-图片双摄
    165:optional i32 NowPostType,
    // Now类型投稿
    166: optional NowPost NowPost,
    // 精简过的标题
    167: optional string preview_title,
    168: optional string PreviewTitleStr,
    // 双列视频 状态
    169: optional i32 PreviewVideoStatus,
    // 纯文本投稿原始文本
    170: optional string OriginDescText,
    // 纯文本投稿高亮信息
    171: optional list<TextExtraStruct> OriginTextExtraInfos,
    // 左下角提醒Icon
    172: optional RemindIconStruct RemindIcon,
    // 视频评论全审状态
    173: optional i32 CommentReview,
    // 作品是否需要打码
    174: optional bool ItemNeedMask,
    // 作品未读马赛克状态
    175: optional i32 ItemMaskStatus,
    // 作者侧马赛克实验
    176: optional i64 AuthorMaskTag,
    // 展示作者黄蓝V标签
    177: optional enum_type.CertLabelEnum UserCertLabel,
	178: optional map<i32, list<DislikEntityStruct>> CommerceDislikeMap, //kv: dimensinoID: entitys
	// 评论投稿对应评论id
	179: optional i64 ImageCommentId,
	// 评论投稿对应视频id
	180: optional i64 CommentItemId,
	// 评论投稿对应视频标题
	181: optional string CommentItemDesc,
	182: optional UrlStruct EffectDynamicCover,
	183: optional string EffectDynamicCoverAverageColor,
	// 新版group_id_list
	184: optional list<i64> GroupIdListC,
	// 收藏角标类型。 1=未看完角标类型
	185: optional i32 CollectionCornerMark,
	// 评论投稿原视频作者id
	186: optional i64 CommentItemUserId,
	// 评论投稿原视频作者昵称
	187: optional string CommentItemUserName,
	// 是否带有商业化道具
	188: optional i32 HasBusinessProp,
	// TTS 一创作品音色id列表 用于vv埋点
	189: optional list<string> TtsIDList,
	// TTS 复用作品音色id列表 用于vv埋点
	190: optional list<string> RefTtsIDList,
	// 变声作品音色id列表 用于vv埋点
	191: optional list<string> VoiceModifyIDList,
	// 变声作品音色id列表 用于vv埋点
	192: optional list<string> RefVoiceModifyIDList,
	// pack打包数据后置鉴权通用token
	193: optional string AuthenticationToken,
	// 作品采用圆角展示（即四个角采用圆角）
	194: optional bool IsItemRoundedCorner,
	// 用于区分相机照片TAB发时刻场景
	195: optional i32 ShootCameraSource,
	// 兴趣小组
	196: optional string InterestGroupExtra,
	// "不喜欢"新面板结构，包含主客观理由
    197: optional list<DislikeStructOpt> DislikeStructList,
	// 火山业务专用字段
	198: optional HotsoonInfoAweme HotsoonInfoAweme,
	// 视频圈层隔离信息
	199: optional DistributeCircleStruct DistributeCircle,
	// GuideBtn兼容
	200: optional GuideBtnStruct GuideBtnDump,
	// 低活引导推荐系统分数
	201: optional double LowActiveGuideShareScoreRate
	// 文章朗读音轨(废弃)
	202: optional ArticleSpeechStruct ArticleSpeech,
	// 不推荐理由code
	203: optional i64 UnrecommendReasonCode,
	// 作者侧ab相关
	204: optional AuthorAbInfoStruct AuthorAbInfo,
	// 音乐导流相关
	205: optional string MusicDiversionInfo,
	// 关键封面和视频段落
	206: optional KeyCoverStruct KeyCover
	// commerceBtn
	207: optional CommerceBtn CommerceBtn
	// 第一个道具相关信息
	208: optional EffectGuideStruct EffectGuideV2
	// 是否为政媒账号豁免底bar等组件
	209: optional i32 IsGovMediaFeedComponentCtrl, 
	// 是否是slides
	210: optional bool IsSlides,
	// slides音乐卡点
	211: optional i32 IsSlidesBeat,
	// slides卡点信息
	212: optional list<i32> SlidesMusicBeats,
	// 图文裁切控制
	213: optional i32 ImageCropCtrl,
	// 是否是促分享视频vv
	214: optional i32 IsHighShareRateFeed,
	//针对朋友推荐作品，用户快捷回复私信的emoji
    215: optional list<ItemSmartEmojiStruct> ReplySmartEmojis,
	216: optional i32 ImageCommentVersion,
	// feed场景下,添加相关锚点评价tab信息展示信息
	217: optional string RawCommentData,
	// 作品的保量状态
	218: optional enum_type.BoostStatusEnum BoostStatus,
	// 是否是暗水印识别出的特效
	219: optional bool dark_watermark_effect,
	// aigc信息
	220: optional AwemeAigcStruct AigcInfo,
	//是否是基于被分享者召回的feed
	221: optional i32 is_im_shared_uid_rec,
	// 基于被分享者召回的feed，对应推荐的被分享者列表
	222: optional list<i64> im_shared_uid_list
	223: optional list<string> CreateScaleType
	// 加入收藏稍后看按钮文案
	224: optional string CollectWait2SeeBtnText,
	225: optional bool EnableAffinityFastComment,
	226: optional bool GuideBtnCanShareToGroup,
	227: optional bool InSystemSeeLaterCollects,
    // 视频宠粉红包单号
	228: optional string FavourRpNo,
	229: optional i64 CommentScreenshotItemId,
	// 滤镜 id
	230: optional i64 CameraFilterId,
	// 新推荐视频引导
	231: optional i32 IsShareBtnRecall,
	232: optional i32 ShareBtnRecallType,
	233: optional i32 OriginShareBtnType,
	// 快闪朗读音色id
	234: optional string flash_mob_speak_id,
	// 是否使用了音乐
	235: optional bool is_use_music,
	// 新推荐视频引导
	236: optional string ShareRecExtra,
	237: optional i64 Original, // 是否从相机上传
	// 作品发布路径 0-未知，1-写笔记
	238: optional enum_type.PublishWayType publishWay,
	239: optional FastReplyData FastReplyData,                   // 快捷回复相关数据
	240: optional i32 ChapterType  // 章节视频种类
	// 新时刻朋友页分发可见性标签
    241: optional string SkiiVisibilityLabel,
	242: optional i64 CfAwemeType, // 时刻子类型
	243: optional i64 CfTextTtl, // 喊话召回时间
	244: optional bool markLargelyFollowing, // 高跟拍作品
	245: optional string CfTextNotes, // 喊话文字
	246: optional i32 ChapterGenType // 章节生成类型 0:作者创建 1:ai生成
	247: optional i32 SkiiFirst
	// 评论通用数据
	248: optional string CommentCommonData
	249: optional bool IsRecentFriendItem // 是否是3日新增关系朋友的作品
	250: optional string RespFrom //item 来源
	// 剪映二创模板ID
	251: optional string JianyingExtendTemplateId
	// 激励推荐类型
	252: optional i32 IncentiveItemType
	// 朋友视频的评论面板出推荐表情
	253: optional bool EnableCommentStickerRec
	254: optional i32 HasImageSticker
	255: optional RecommendChapterInfo RecommendChapterInfo; //智能章节信息
    256: optional string ChapterAbstract;  // 章节全文总结
    257: optional i32 ChapterReviewStatus; // 章节审核状态。1-审核中，2-审核成功，3-审核未通过
	258: optional map<string, string> ExtraMap;	//下发额外的一些字段不用从新填充协议
	// 转发作品的编辑状态，1=编辑过，0=无修改
	259: optional i32 VideoShareEditStatus;
	260: optional i32 Is24Story; // 2024 新日常
	261: optional IMShortcutShareInfoStruct ImShortcutShareInfo; // IM 快捷分享信息
	262: optional i64 CfRecheckTs; // 密友时刻补打卡时间戳
	263: optional CfEdit CfEdit; // 密友时刻补打卡时间戳
	//分享三边模型推荐SecUidList
	264: optional list<string> ShareRankSecUidList,
	// pc抖音独有字段，在gofeed_service中赋值
	265: optional string WebRawData;
	266: optional i32 CfVersion; // 新老时刻
	// 警示信息
	267: optional WarnInfo WarnInfo;
	268: optional i32 HasImageTemplate;
	// 来源是否为团购tab
	269: optional bool FromGrouponTab;
	270: optional i32 IsFriendPanel; // 绑定的朋友权限面板

	// 拍摄路径 
	271: optional string ShootWay;
	272: optional bool HasProfileInspiration; //已生成个人页创作灵感
	273: optional list<TrendsInfo> TrendsInfos; // 玩法信息
	274: optional ItemUnifiedMusicGroupStruct ItemUnifiedMusicGroup;
	275: optional i32 AICloneSwitch; // 视频ai开关

	// 小说顶bar
	276: optional NovelCommentBarStruct NovelCommentBar; // 小说顶bar结构
	277: optional i32 ImageItemQualityLevel // 图文作品品质等级 0-非优质 1-较优质 2-优质
	278: optional i32 FriendInteraction; // 共友互动作品 0-不是 1-是

	// 同城攻略内容
	279: optional string FirstTagNameV2;
	280: optional string LifeLabel;
	281: optional string GuideQualityScoreV2;

	// pc跨tab引导信息
	282: optional i32 PcGuideChannelId;

	283: optional string SmartEmojiExtra; //针对朋友推荐作品，用户快捷回复私信的emoji extra信息
	284: optional enum_type.CertLabelStyleEnum CertLabelStyle; // Feed 认证外显标识

	// 转发投稿原作品id
	285: optional i64 SharePostOriginItemId;

	// 抖音优质图文流量激励
	286: optional ImageNetflowIncentiveStrcut ImageNetflowIncentive;
	287: optional list<ChapterBarColorInfo> ChapterBarColor; // 章节进度条算色

	// 已废弃字段，转移至ItemStatus
	288: optional i32 PrivacyPanelVersion;
	289: optional i32 FlashMobTrends, // 0-非二期实验组, 1-二期实验组：挑战音乐融合玩法
	290: optional i32 HasTrends, // 0 - 没有匹配到玩法, 1- 二期实验组 or 二期对照组有匹配到玩法

	291: optional bool HideRecommendReason, // 隐藏关系解释

	292: optional string TriangleShareListRankMap // 三边模型推荐好友排序
	293: optional string OriginDuetResourceUri // 合拍的原作品uri
	294: optional PackFieldMonit PackFieldMonitTest //字段管控演练用，不在线上使用
	295: optional bool ShowAddMateBtn // 展示加mate好友按钮
	// 可颂顶bar
	296: optional SicilyCommentBar SicilyCommentBar 
	297: optional i32 CommentProtectionMode // 评论防护模式
	298: optional string  MateVideoTag // 日常2.0 Ta的作品标签
	299: optional i32 EcomCommentAtmosphereType // 视频评论氛围类型
	300: optional TrendsMusicInfo TrendsTopMusic // 玩法音乐

	301: optional MusicEditButton MusicEditButton
	302: optional list<MvInfo> MvInfo //模板信息
	303: optional PublishPlusAlienation PublishPlusAlienation //加号异化
	304: optional bool RecommendMate // 推好友视频
	305: optional LynxCardStruct LynxCardStruct // lynx卡片信息
    306: optional string EffectSocialData  // 用户使用特效生成的UGC数据
	307: optional string DiversionLogoType // 导流水印类型
	308: optional i32 DisableCommentChunk // 评论chunk强制关闭开关
	309: optional i32 TestForBreaker // 精准熔断降级测试用字段，其他业务请勿使用
	310: optional string TestForBreakerStr // 精准熔断降级测试用字段，其他业务请勿使用
}

struct LynxCardStruct {
    1: optional bool is_lynx_card // 是否使用lynx渲染
    2: optional i32 card_type // 业务场景
    3: optional string lynx_params // lynx渲染使用的自定义参数
}

// 加号异化公用信息
struct PublishPlusAlienation {
	1: required enum_type.AlienationEnum AlienationType // 异化类型
}

// 模板信息
struct MvInfo {
	1: optional string Id, //模板id
	2: optional UrlStruct IconUrl, //模板icon
	3: optional i32 MvType, //mv type
	4: optional string Name, //模板名称
	5: optional string LokiId, //模板对应的loki id
	6: optional bool IsImageTemplate, // 是否图文模板
	7: optional i32 MvUploadType, // 上传类型，0-默认 1-二次上传
	8: optional bool EnableAlienation, // 是否异化
}

// 可颂顶bar结构体
struct SicilyCommentBar {
	1: optional string Prefix // 前缀
    2: optional string Desc // 描述文案
	3: optional string Schema // 中间页schema
}

// pack字段管控演练专用字段，模拟字段突然变长等情况
struct PackFieldMonit {
	1: optional string MockString
}

struct ItemUnifiedMusicGroupStruct {
	1: optional i64 SongID, // ugID对应的songID
	2: optional string Title, // song的title
	3: optional string Author, // 作者
	4: optional UrlStruct MediumCoverUrl, // 封面
	5: optional i64 UgID // UnifiedMusicID
	6: optional i64 MusicId
}

struct ChapterBarColorInfo {
  1: optional i32 timestamp; // 时间戳
  2: optional string color; // 章节首帧颜色
}

struct MusicEditButton {
	1: optional bool InMusicEditExpire
	2: optional string ExceedExpireReason
}

struct TrendsInfo {
	1: optional i64 Id
	2: optional string Title
	3: optional i64 UseCount
	4: optional i32 DisplayLocation // 1-头部； 2-底部；
	5: optional list<TrendsMaterial> TrendsMaterials
	6: optional string ButtonText // 文案
	7: optional string ButtonAction // schema
	8: optional string FlashMobId
	9: optional i64 UgId
	10: optional i64 MusicId
	11: optional i32 CollectStatus // 0-不可收藏, 1-未收藏，2-已收藏
	12: optional list<MusicStruct> TrendsMusicInfo // 玩法页面音乐列表
	13: optional list<ItemUnifiedMusicGroupStruct> TrendsUnifiedMusicGroup
	14: optional UrlStruct TopIcon // 顶端的icon，ugc玩法有挑战 和 热门玩法 才会有
	15: optional list<string> InsertMusicIds // 玩法页面强插音乐id列表
	16: optional string OriginalMaterials
	17: optional string FlashMobTitle
	18: optional string TrendsDescribe
}

struct TrendsMaterial {
  1: optional i32 MaterialType // 素材类型：1-特效；2-ai特效；3-合拍；4-模板；5-挑战；6-音乐；
  2: optional string Id // 素材id
  3: optional string Name // 素材名字
  4: optional string ExtraInfo // 扩展字段
  5: optional i64 DuetFromId // 合拍视频id
  6: optional string ButtonText // 按钮文案
  7: optional string ButtonSchema // 按钮跳转schema
  8: optional UrlStruct Cover //  素材封面
  9: optional i64 UseCount // 素材使用数量
  10: optional string NickName
  11: optional i32 MvType
}

struct TrendsMusicInfo {
	1: optional UrlStruct CoverMedium
}

struct WarnInfo {
	1: optional string WarnText
	2: optional string WarnIconKey
	3: optional string WarnUrl
	4: optional i32  WarnId
	5: optional bool SemiElastic
	6: optional string SemiElasticTitle
	7: optional string SemiElasticBody
	8: optional string SemiElasticLinkTitle
}

struct CfEdit {
    1: optional i32 EditCount;        // 0:原始投稿；1:第一次编辑；2：第二次编辑
    2: optional string PreItemId;     // 编辑投稿传上一次的itemId
	3: optional string OriginItemId;  // 原始投稿id
}

struct RecommendChapterInfo {
    1: optional list<ChapterInfo> RecommendChapterList;    // 智能章节信息
    2: optional i32 ChapterRecommendType;    // 智能章节类型
    3: optional i32 GenerationStatus;      // 智能章节生成状态。1-生成成功，2-生成失败
    4: optional string ChapterAbstract;  // 章节要点全文总结
	5: optional i32 ChapterRecommendSource;    // 智能章节来源。1-异步生成，2-离线生成，3-手动章节优化建议
    6: optional list<i32> PushScene; // 推送场景。空-不推送, 1-内流条，2-优化建议
	7: optional list<ChapterBarColorInfo> ChapterBarColor; // 章节进度条算色
}

struct CommerceBtn {
    1: optional string Schema // buttonSchema
    2: optional i32 Width // 按钮宽
    3: optional i32 Height // 按钮高
    4: optional string BackgroundColor // 按钮背景色
    5: optional i32 AnimationDelay // 动画时间 单位毫秒
    6: optional list<ButtonArea> InitAreas // 初始态
    7: optional list<ButtonArea> FinalAreas // 终态
}

struct ButtonArea {
    1: optional string Key  // area唯一key
    2: optional string Icon // 图片类型的area
    3: optional string Text // 文字类型的area
    4: optional string Position // left middle right
    5: optional string CoverImg // area遮罩
    6: optional i32 PaddingLeft // 左边的间距
    7: optional i32 PaddingRight // 右边的间距
	8: optional UrlStruct IconImg // 带宽高的img
}


struct AuthorAbInfoStruct{
	1:optional bool DisableFastCommentFriend,// 反转朋友视频快捷评论
}
struct ArticleSpeechStruct{
	1:optional string URL,// 文章朗读音轨url
}

struct HotsoonInfoAweme {
	1: optional HotsoonDoubleFlowCardUi CardUi; //火山双列卡片Ui配置
	2: optional HotsoonIncentiveTaskCard Card;// 火山激励的任务卡片
}

struct HotsoonDoubleFlowCardUi{
	1: optional HotsoonDoubleFlowCardInfoPanel CardInfoPanel, // 信息区配置
	2: optional double CoverAspectRatio, // 封面高宽比
}

struct HotsoonIncentiveTaskCard{
	1: optional i32 Type; // 激励卡片类型 
	2: optional string Title; // 卡片标题
	3: optional string SubTitle; // 卡片副标题
	4: optional string IconUrl; // icon图片
	5: optional string ButtonText; // 按钮文案
	6: optional string ButtonSchema; // 按钮跳转链接
}

struct HotsoonDoubleFlowCardInfoPanel{
	1: optional bool ShowNickname, // 是否展示昵称
	2: optional i32 TextLine, // 展示文案行数
	3: optional string TextTitle, // 展示文案内容，为title或者为tag，服务端计算提取
	4: optional bool ShowLiveHead, // 是否展示直播live head
}

struct DislikeStructOpt {
    1: optional string Icon              // 文案前面的小Icon
    2: optional string Text           //  文案（反馈内容问题/我不想看）
    3: optional list<DislikeEntityStructOpt> Entitys    // dislike内容实体
}


struct DislikeEntityStructOpt {
    1: optional i32 DimensionID     // 维度id
    2: optional string PreText      // 客观理由第一行文案&主观理由文案
    3: optional string SubText      // 客观理由第二行文案
    4: optional string Extra        // 具体dislike理由id
    5: optional string EnName       // 用于埋点上报的英文
}

// 左下角提醒Icon
struct RemindIconStruct {
	1: optional string IconGeckoChannel // 使用哪个 Gecko Channel 资源
	2: optional string IconLottie // 使用 channel 中哪个动画资源
	3: optional string IconImage // 使用 channel 中哪个图片资源
}

struct SeoInfoStruct {
	1: optional string  OcrContent;   //ocr信息
	2: optional string  AIContent;	  //ai转文字信息
	3: optional string  ChatGPTContetn;	  //chatgpt信息
	4: optional string  ShowContent;	//展示信息
}

struct DislikeDimensionStruct {
	1: optional i32  DimensionId;
	2: optional UrlStruct Icon;
	3: optional list<DislikEntityStruct>  Entitys;
	4: optional string EnName;
}

struct DislikEntityStruct {
	1: optional string Text;
	2: optional string Exrta;
}

struct ChapterInfo {
    1: optional string KeyWord;    // 章节关键字
    2: optional string Desc;      // 章节描述
    3: optional i32 Timestamp;    // 时间区间，记录章节的开始时间 
	4: optional string DescForSearch;  // 章节描述--搜索专用
	5: optional bool Isecomword; //是否为电商词
	6: optional i32 EcomWord; //是否为看后搜点位词
	7: optional string Url; // 章节封面url
    8: optional string Detail; // 章节要点
}

struct KnowledgeBar {
    1: optional string Content  // 文案
    2: optional string KnowledgeSchema // 跳转
    3: optional string Extra
}

struct ImageAlbumMusicInfo {
    1: optional i32 BeginTime // 音量开始时间
    2: optional i32 EndTime //音量结束时间
    3: optional i32 Volume //音量
}

struct DiggLottieStruct {
    1: optional string LottieId   // 动效的资源uri 或者id
    2: optional i32 CanBomb        // 是否允许连击爆炸  1:允许爆炸  0: 不允许爆炸
}

struct CreatorItemSettingStruct {
    // 视频可自审评论 true 可自审, false 不可自审(默认)
    1: optional bool ChargeCommentAudit,
}

struct LivePaidRoomStruct {
	// 付费回放内容类型 0-非付费 1-付费演出回放
	1: optional i32 paidLiveType,
	// 观看权限 0-无权限 1-购票权限 2-白名单权限
	2: optional i32 viewRight,
	// 履约状态 0-未履约 1-履约
	3: optional i32 delivery,
	// 付费回放对应的门票ID
	4: optional i64 ticketID,
}

struct XiguaIncomeBarInfoStruct {
	// 收益
	1: optional double income,
	// 跳转链接
	2: optional string schema,
	// 扶持播放量
    3: optional i64 increment_play,
}

struct RelatedSearchBarInfoStruct {
	// 搜索图标
	1: optional UrlStruct icon,
	// 引导词
	2: optional string guide_text,
	// 搜索词
	3: optional string query_word,
	// 跳转类型
	4: optional i32 jump_type,
	// 跳转链接
	5: optional string schema,
	6: optional string query_id,
}

struct CommerceVisualSearch {
	1: optional bool VisualSearchShowEntry,
	2: optional string VisualSearchLabel,
	3: optional UrlStruct VisualSearchImg,
	4: optional string VisualSearchEntryText,
}

// TC21互动/彩蛋视频
struct TC21InteractiveVideoStruct {
	// 活动ID
	1: required string ActivityId,
	// 跳转链接
	2: required string SchemaUrl,
	// 延迟触发时间
	3: required i64 ShowDelayTime,
	// 锚点文案内容
	4: optional string TagText,
	// 其他
	255: optional string Extra,
}

// 主 feed 关注关系标签
struct ItemRelationLabelStruct {
	// 标签相关评论 id
	1: optional i64 CommentId,
	// 标签后缀文本
	2: optional string Text,
	// 标签类型
	3: optional enum_type.RelationLabelTypeEnum Type,
	// 标签相关用户 id 列表
	4: optional list<i64> UserIds,
	// 双列展示标签文本
	5: optional string TabText,
	// 标签背景图
	6: optional list<string> TextBackgroundImgs,
	// 标签使用背景色或背景图
	7: optional enum_type.LabelStyleEmum LabelStyle,
	// 双列封面标签背景图
	8: optional list<string> TabTextBackgroundImgs,
	// 标签文本颜色
	9: optional string TextColor,
	// 标签背景颜色
	10: optional string TextBackgroundColor,
	// 双列封面标签颜色
	11: optional string TabTextColor,
	// 双列封面标签背景色
	12: optional string TabTextBackgroundColor,
	// 视频详情页标签跳转逻辑
	13: optional string schema,
	// 双列封面标签背景图拉伸位置
	14: optional string TabTextBackgroundImgStretchPosition,
	// 标签背景图拉伸位置
	15: optional string TextBackgroundImgStretchPosition,
	16: optional string LabelInfoColor,
	17: optional string LabelInfoBackgroundColor,
	//通用埋点使用
	18: optional string LabelTag,
	//通用埋点使用

	19: optional string LabelType,
	//知识类标签埋点使用
	20: optional i64 TagId,
	// 消息id
	21: optional i64 ServerMessageId,
	22: optional string MessageId,
	23: optional i32 MessageType,
    // 会话id
    24: optional i64 ConversionShortId,
    25: optional string ConversionId,
    // 会话类型
    26: optional i32 ConversionType,
    27: optional string MessageContent,
    28: optional string ConversationAvatarUrl,
    29: optional string ConversationName,
    // 通用扩展资源
    30: optional string Extra
    // 标签子类型,Type和SubType是一对多的关系
	31: optional enum_type.RelationLabelSubTypeEnum SubType,
	// 标签展示具体评论
	32: optional LabelCommentStruct comment,
	33: optional LabelIconStruct Icon,

	//展示标签所需icon集合和箭头
	50: optional IconsStruct Icons
	51: optional bool ShowArrow

    99: optional list<RelativeUserStruct> UserList,
	// UserIds[0]，只用于graphql
	100: optional string UserID,
	// show_type, from pb_bulder
	101: optional enum_type.RelationDynamicLabelShowType ShowType,
	102: optional i32 Count,
	103: optional string NickName
	// 来自同城标签是否使用同城tab上的文案
    104: optional bool NearbyLabelUseTabText
	// 埋点字段，json结构体形式，由server透传给客户端
	105: optional string log_extra
}

struct IconsStruct{
	1: optional list<string> IconList //urlmodel ,已废弃
	2: optional list<UrlStruct> Icons

}

struct LabelIconStruct {
	1: optional UrlStruct IconImg,
	2: optional enum_type.IconPosition Position,
	3: optional enum_type.IconScale Scale,
}

struct LabelCommentStruct {
    1: required string cid,        // 评论的ID
    2: required string text,       // 评论的文案
    3: required i32 digg_count,  // 评论被点赞的数量
    4: required bool user_digged,  // 评论是否被当前用户点赞
	5: required bool user_buried,  // 评论是否被当前用户点踩
	6: optional string ReplyToUserName, // 评论回复的用户名
	7: optional string ReplyId,         // 回复ID，评论的parentID
	8: optional string ReplyToReplyId,  // 回复的ID，三级评论直接回复二级评论的二级评论ID
}

// 580 前使用
struct ItemPromotionStruct {
	// 推广ID
	1: required i64 Id,
	// 点击量
	2: required i32 Clicks,
	// 佣金
	3: required i64 CosFee,
	// 分成比
	4: required double CosRadio,
	// 封面图
	5: required UrlStruct CoverUrl,
	// 达人可编辑的导语
	6: required string ElasticIntroduction,
	// 达人可编辑的图片
	7: required list<UrlStruct> ElasticImageUrls,
	// 达人可编辑的标题
	8: required string ElasticTitle,
	9: required string Extra,
	// 商品ID
	10: required i64 Gid,
	// 1#淘宝商品 2#游戏 3#放心购商品 4#精选联盟
	11: required i64 ItemType,
	// 是否收藏
	12: required bool IsFavorited,
	// 落地页
	13: required string LandingPageUrl,
	// 售价
	14: required i64 Price,
	// 市场价格, 原价
	15: required i64 MarketPrice,
	// 销售数量
	16: required i64 Sales,
	// 商品标题
	17: required string Title,
	// 浏览量
	18: required i32 Views,
	// 上一个被绑定的视频ID
	19: optional i64 LastAwemeId,
	// 220及以后版本新增字段
// 普通/上新/推荐
	20: required i32 ElasticType,
	// 商品下发h5链接
	21: required string H5Url,
	// 商品原始多张图
	22: required list<UrlStruct> Images,
	// 自定义标签
	23: required list<string> Labels,
	// 商品来源
	24: required i32 Source,
	// 标题前缀
	25: required string TitlePrefix,
	// 好物榜排名
	26: optional i32 Rank,
	// 好物榜跳转链接
	27: optional string RankUrl,
	// 访客信息
	28: optional PromotionVisitorStruct VisitorInfo,
}

struct ItemReviewResultStruct {
	// 0 正常；1 审核下架；2 审核自见
	1: required i32 Status,
	// 可否告知
	2: optional bool ShouldTell,
	// 详情 H5 页
	3: optional string DetailUrl,
	// 视频下红色按钮文字
	4: optional string VideoDetailNoticeBottom,
	// 视频中间的提示文字
	5: optional string VideoDetailNotice,
	// 个人页下架蒙层文字
	6: optional string CoverNotice,
	// 状态描述
	7: optional string StatusDesc,
	// 状态来源
	8: optional string StatusSource,
	// 其他
	99: optional string Extra,
}

struct ItemRiskStruct {
	1: required i32 Type,
	2: required string Content,
	3: required bool Sink,
	4: required bool Vote,
	5: required bool Warn,
	6: optional bool Notice,
	7: optional string Url,
    8: optional string PostContent,
    9: optional i32 WarnLevel,
    10: optional i32 ReflowPlayable,
    11: optional string ReflowPlayNotice,
    // 警示条图标样式
    12: optional string IconUrl,
	// 视频举报提交页提示条
	13: optional string ReportBannerContent,
}

struct ItemWarnNotificationStruct {
   1: required i32 Type,
   2: required string Content,
   3: required bool show
   4: optional string Url,
}

struct ShareRiskWarningStruct {
   1: required string Title,
   2: required string RemindType,
   3: required list<ShareRiskWarningParamStruct> Params
}

struct ShareRiskWarningParamStruct {
   1: required i32 ParamType,
   2: required string Key,
   3: required string Text,
   4: required string Target,
}

// 580 后使用
struct ItemSimplePromotionStruct {
	// 商品原始数据
	1: required string RawData,
}

struct ItemSimpleShopSeedingStruct {
	// 种草锚点原始数据
	1: required string RawData,
}

struct ItemStatisticsStruct {
	1: required i32 CommentCount,
	2: required i32 DiggCount,
	3: required i32 PlayCount,
	4: required i32 ShareCount,
	5: required i32 FakeDiggCount,
	6: required i32 FakePlayCount,
	7: required i32 ForwardCount,
	8: required i32 DownloadCount,
	// 计数信息(不包括评论)
	9: optional enum_type.CountStatusEnum CountStatus,
	// 评论计数信息
	10: optional enum_type.CountStatusEnum CommentCountStatus,
	11: optional i32 WhatsAppShareCount,
	// 原i32类型字段不满足业务增长需求，相关计数字段请使用i64版本
	12: optional i64 CommentCountI64,
	13: optional i64 DiggCountI64,
	14: optional i64 PlayCountI64,
	15: optional i64 ShareCountI64,
	16: optional i64 FakeDiggCountI64,
	17: optional i64 FakePlayCountI64,
	18: optional i64 ForwardCountI64,
	19: optional i64 DownloadCountI64,
	20: optional i64 WhatsAppShareCountI64,
	// 统计信息的简化版："播放量：XXX，平均观看时长：XXX"。显示于符合特定规则的视频底端
	21: optional string Digest,
	// 曝光量的值
	22: optional i64 ExposureCount,
	// 直播pv:个人页的精彩直播回放
	23: optional i64 LiveWatchCount,
	// 收藏数
	24: optional i64 CollectCount,
	// 赞赏数
	25: optional i64 AdmireCount,
	// from familiar_feed
	26: optional i64 FriendDiggCount,
    // 火山8663 赠送过火苗的人数
    27: optional i64 FlameSendCount,
    // 火山8663 赠送过火苗的人数简写
    28: optional string FlameAmountSimpleStr,
    // 火山8663 item火力数量	 
	29: optional i64 FlameIncomeCount,
	// 火山8663 item火力数量简写
	30: optional string FlameIncomeCountStr,
	// 作者经营 播放分析低谷数
	31: optional i64 PlayValleyCount,
	// 推荐数
	32: optional i64 RecommendCount,
	// 共同朋友点赞数
	33: optional i64 MutualFriendDiggCount,
	// 共同朋友评论数
	34: optional i64 MutualFriendCommentCount,

	100: optional string AwemeId,
	101: optional bool LoseCount,
}

struct YummeStatisticsStruct {
    1: required i64 CommentCount,
    2: required i64 DiggCount,
    3: required i64 CollectCount,
    4: required i64 PlayCount,
    5: optional i64 ShareCount,
    100: optional string AwemeId,
}

struct VideoMuteStruct {
	1: optional bool IsMute,
	2: optional string MuteDesc,
}

enum UserStatusEnum {
  UserStatusUnkown = -1; // 未知可见性
  AllPublic = 0; // 公开
  Private = 1; // 私密
  FriendSee = 2; // 好友可见
  PublicAndDontShare = 3;
  PartSee = 4;
  CloseFriendSee = 5; // 密友可见
  FriendSeeAndDontShare = 146; // 好友可见 且设置了不给谁看
  FriendSeeAndMutualCFSee = 161; // 好友可见 且双向密友可见
  FriendSeeAndForwardCFSee = 162; // 好友可见 且正向密友可见
  MateSee = 163;                  // 新朋友可见
  MateSeeAndDontShare = 164;      // 新朋友可见，且设置了不给谁看
}

struct ItemStatusStruct {
	1: required bool AllowComment,
	2: required bool AllowShare,
	// 0:allow_download, 1:ad_prevent
	3: required i32 DownloadStatus,
	4: required bool InReviewing,
	5: required bool IsDelete,
	6: required bool IsHotReviewed,
	7: required bool IsPrivate,
	8: required bool IsReviewed,
	9: required bool IsUserDigged,
	10: required bool IsVideoProhibited,
	// 0:公开, 1:私密, 2: 好友可见
	11: required i32 PrivateStatus,
	12: required bool SelfSee,
	13: required i32 ValidFansStatus,
	// 是否带有 淘宝/放心购 商品
	14: required bool WithFusionGoods,
	// 是否带有商品
	15: required bool WithGoods,
	16: required bool WithPromotionMusic,
	17: required i32 SecondReviewStatus,
	//music edit status
	18: optional i32 MusicEditStatus,
	// video mute
	19: optional VideoMuteStruct VideoMute,
	20: optional bool AllowBeLocated,
	21: optional string HometownVisible,
	22: optional string Hometown,
	23: optional bool IsThreeReviewed,
	// 是否是审核好友可见
	25: optional bool ReviewedFriendSee,
	//视频编辑信息
	26: optional AwemeEditInfo EditInfo,
	// 0: 非部分可见作品 1: 部分可见作品 2: 密友可见作品
	27: optional i32 PartSee,
	// 0:未保量 1:已保量
	28: optional i32 BoostHistoryStatus,
	// 视频赞赏权限
	29: optional AdmireStatusInfo AdmirePermission,
	// item当前版本 默认为0
	30: optional i64 ItemVersion,
	// 点赞 emoji
	31: optional i64 UserDiggedEmoji,
    // 听视频音乐版权 0=无版权 1=老长按面板+长按转盘+有引导 2=长按面板+长按音乐转盘+无引导 3=长按面板
    32: optional i64 ListenVideoStatus
	// 用户设置的可见性 146:好友可见+不给谁看 161:好友可见+密友可见 162:好友可见+正向密友可见
	33: optional UserStatusEnum user_status,
	// 用户设置的可见性是否过滤
	34: optional i32 UserStatusFiltered,
	// 低版本降级的可见性
	35: optional UserStatusEnum DowngradeUserStatus,
	// AwemeId
	100: optional string AwemeId,
	// 点赞授权
	101: optional bool AllowFriendRecommend,
	// 社交传播允许主动推荐
	102: optional bool AllowSelfRecommendToFriend,
	// 社交传播用户推荐状态
	103: optional i32 UserRecommendStatus,
	// 社交传播允许主动推荐引导
	104: optional bool AllowFriendRecommendGuide,
	// 青桃 n1策略命中情况
	105: optional bool YummeHitN1,
	// 偏业务语义的可见性。支持按需获取，比如：纯公开、用户设置私密、客态不可见等。内部添加请联系pollock.ji
	106: optional BizStatusStruct BizStatus,
	// 投稿时可见性设置面板的版本号
	107: optional i32 PrivacyPanelVersion,
}

struct BizStatusStruct {
    1: optional bool IsPrivate, // 是否客态不可见，包括用户设置的删除、私密；审核设置的新发待审、审核下架、审核自己、审核删除. 定时发布先不处理
	2: optional bool IsUserPrivate, // 用户设置私密。用于一些仅主态时，类似私密视频标签展示的判断场景。区分于上面，审核自见不能返回true
	3: optional bool IsReviewPrivate, // 审核设置的私密。有很多审核逻辑仅判断 141+144
	4: optional bool IsFriendSee, // 是否好友可见。仅仅排查 好友可见叠加部分可见的老视频即可
	5: optional bool IsUserFriendSee, // 是否纯用户设置的好友可见。需要过滤：仅审核好友可见、互关可见且设置不给谁看、审核好友可见叠加部分可见等状态
	6: optional bool IsReviewFriendSee, // 是否审核设置的好友可见，包括：待审好友可见；审核好友可见
	7: optional bool IsPublic, // 是否纯公开，102叠加的其他可见性都会被过滤掉, 定时发布先不改造，后续会优化
}

struct AdmireStatusInfo {
    // 是否展示赞赏xTab 0:否 1:是 for作者视角
    1: optional i32 ShowAdmireTab,
    // 是否展示视频赞赏开关 0:否 1:是 for作者视角
    2: optional i32 ShowAdmireButton,
    // 视频赞赏开关状态 0:打开 1:关闭 for作者视角
    3: optional i32 ButtonStatus,
    // 视频赞赏权限 0:关闭 1:打开 for用户视角
    4: optional i32 AdmireStatus,
	// 是否近30天点击赞赏icon 0:否 1:是 for用户视角
	5: optional i32 IsClickAdmireIconRecently,
	// 是否50位及以上开通赞赏作者的铁粉 0:否 1:是 for用户视角
	6: optional i32 IsFiftyAdmireAuthorStableFans,
	//赞赏开启状态 仅为1时候是作者打开赞赏
	7: optional i32 AuthorCanAdmire,
	// 是否符合个人页内流的铁粉条件 0:否 1:是 for用户视角
	8: optional i32 IsIronFansInAwemePost,
	//个人页内流中退场，仅方案2-1使用 0:否 1:是 for用户视角
	9: optional i32 ExitAdmireInAwemePost,

}

struct AwemeEditInfo {
	// 按钮状态 0: 可以修改标题; 1: 不可以修改标题; 2: 不展示
	1: optional i32 ButtonStatus,
	2: optional string ButtonToast,
	3: optional string BarToast,
	// 审核状态 0: 没编辑过; 1: 审核中; 2: 审核成功; 3: 审核失败
	4: optional i32 EditStatus,
	// 重新编辑成功时间戳
    5: optional i64 ModifyAllEditSuccessTime,
	// 是否重新编辑过
	6: optional bool HasModifiedAll,
}

struct ItemStarAltasLinkStruct {
	1: required i64 Id,
	2: required i64 OrderId,
	3: required string Title,
	4: required string SubTitle,
	5: required UrlStruct AvatarIcon,
	//H5落地页
	6: optional string WebUrl,
	7: optional string OpenUrl,
	8: optional string ComplianceData,
	9: optional string DownloadUrl,
}

struct ItemStarAtlasLiveInfoStruct {
    // 直播组件信息，会放在视频desc前面
    1: required string LiveDesc,
    // 需要跳转的直播间ID
    2: required string LiveData,
    // live_desc 中出现@直播名称的start
    3: required i32 Start,
    // live_desc 中出现@直播名称的end
    4: required i32 End,
    // 直播间主播ID
    5: required string UserId,
    // sec uid
    6: required string SecUid,
    // TextExtra type
    7: required i32 Type,
    // TextExtra sub_type
    8: required i32 SubType,
    // 原TextExtra中start和end应该后移的长度
    9: required i32 LiveDescLen,
}

struct ItemLiveInfoForXigua {
    // 直播间ID
    1: required i64 RoomID,
    // 直播类型，0-竖屏（秀场），1-横屏，2-媒体直播
    2: required i32 Orientation,
    // 开播时的appID
    3: required i32 AppID,
    // 主播openID
    4: required string OwnerOpenId,
    // 房间类型
    5: required i64 LiveRoomMode,
    // 直播间布局
    6: required i64 RoomLayout,
    // 语音直播间
    7: required bool LiveTypeAudio,
    // 三方推流&OBS推流&媒体直播间
    8: required bool LiveTypeThirdParty,
    // 录屏直播间
    9: required bool LiveTypeScreenshot,
    // 是否电商直播间
    10: optional bool ContainCart
    // 西瓜uid
    11: optional i64 XiguaUID
}

struct BookBarInfo {
    // 图书id
    1: required i64 BookID,
    // 底bar标题
    2: required string BookTitle,
    // 跳转schema
    3: required string Schema,
}

struct SpecialImageStruct{
	1:optional ImageDescStruct DescInfo,// 描述信息
	2:optional ProductImagePriceInfoStruct ProductInfo,// 商品图文信息
	3:optional string DetailSchema,// 详情页schema
	4:optional enum_type.SpecialImageEnum ImageType,// 图文类型
	5:optional LifeEvaluationImageInfoStruct LifeEvaluationInfo,// 生服评价图文信息
	6:optional string ExtraInfo, // map[string]interface 拓展信息
	7:optional ProductCommentImageInfoStruct ProductComment, // 商品图文信息
	8:optional LifeCardTransImageInfoStruct LifeCardTransImageInfo, // 生服独立卡图文信息
}

struct LifeCardTransImageInfoStruct {
	1:optional i32 Type,	            // 1: poi图文样式 2: 商品卡样式
    2:optional string Title, 			// 标题
    3:optional string Desc, 		    // 标题后描述
    4:optional LifeCardSpuInfo SpuInfo, // 商品卡样式下的商品信息
	5:optional LifeCardImagePoiInfo PoiInfo, // poi信息
	6:optional list<LifeCardImageTabInfo> TabInfo, //  页面信息
	7:optional string Extra,            // 额外信息，结构体维护在服务内
}

struct LifeCardImageTabInfo {
    1:optional i32 Index, // 对应图片的index
    2:optional string TabName, // 每一页的tab名称
}

struct LifeCardImagePoiInfo {
    1:optional string PoiId,
    2:optional string BackendType,
    3:optional string CityCode,
}

struct LifeCardSpuInfo {
	1:optional string Price, // 当前价
    2:optional string OriginPrice, // 原价
	3:optional string Desc, // 描述
	4:optional string SpuId, // 商品id
	5:optional string PriceSuffix, // 商品价格后缀
}

struct ProductCommentImageInfoStruct{
  1:optional CommentAttitudeStruct CommentAttitude, // 方案一评价表态
  2:optional ProductLabelStruct ProductLabel, // 方案一商品标签
}

struct CommentAttitudeStruct{
  1:optional string ProductInfo, // 商品信息
  2:optional UrlStruct AttitudeIcon, // 表态icon
}

struct ProductLabelStruct{
  1:optional string CommentPrefix,   // 评价前缀
  2:optional string ProductName,     // 商品名称
  3:optional string ProductAttitude, // 评价态度
  4:optional UrlStruct AttitudeIcon,  // 表态icon
  5:optional string AnchorSchema,   // 半层弹窗schema
}

struct ImageDescStruct{
	1:optional string Title,// 标题
	2:optional string Desc,// 正文
	3:optional string EndDesc,// 尾部文本
	4:optional string MinorDesc, // 二行描述
}

struct ProductImagePriceInfoStruct {
	1: optional i64 ProductID, // 商品ID
    2: optional i64 MinPrice, // 最低价格
    3: optional string Header, // 价格描述
    4: optional string CommodityID, // 商品的推广id，取接口的promotion_id
    5: optional i64 CommodityType, // 商品来源，取接口的promotion_source
    6: optional i64 AnchorType  // 挂购物车锚点类型
	7: optional i64 MaxPrice, // 最高价格
	8: optional i64 CommentCount,// 评价数
	9: optional string SalesDesc, // 销量描述
	10: optional i64 CombinationIndex, // 搭配帧index 
}

struct LifeEvaluationImageInfoStruct {
	1: optional UrlStruct EvaluationLevel,// 评价
    2: optional string EvaluationPrefix,// 评价前缀描述
    3: optional string OrderDesc,// 订单信息
}

struct ProductImageInfoStruct {
	// 商品id
	1: optional i64 ProductID,
	// 标题描述
	2: optional ProductImageDescInfo DescInfo,
	// 价格描述
	3: optional ProductImagePriceInfo PriceInfo,
	// 商品详情页schema
	4: optional string ProductDetailSchema,
}

struct ProductImageDescInfo{
	// 标题
	1: optional string Title,
	// 描述
    2: optional string Desc,
	// 尾部描述
    3: optional string EndDesc,
}

struct ProductImagePriceInfo{
	// 价格
    1: optional string MinPrice ,
	// 价格描述
    2: optional string Head ,
}


struct ItemStarAtlasLiveInfoForBarStruct {
    // 组件名称-描述信息
    1: required string LiveDesc,
    // 需要跳转的直播间ID
    2: required string LiveData,
    // 直播间主播ID
    3: required string UserId,
    // sec uid
    4: required string SecUid,
}

struct ItemStarAtlasTrackUrlInfoStruct {
	// 点击监测
	1: optional list<string> ClickTrackUrlList,
	// 播放监测
	2: optional list<string> TrackUrlList,
}

struct ItemTalentStruct {
	// 新版达人添加商品链接
	1: optional string GoodsRecUrl,
	// 达人添加商品链接
	2: optional string ManageGoodsUrl,
	// 星图订单ID
	3: optional i64 StarAtlasOrderId,
	// 星图状态
	4: optional i32 StarAtlasStatus,
	// 星图link信息
	5: optional ItemStarAltasLinkStruct StarAtlasLinkInfo,
	// TCM 商单状态: 1-已结束
	6: optional i32 TcmStatus,
	// 是否禁止可见性操作
	7: optional bool PreventPrivacy,
	// 禁止可见性操作原因
	8: optional string PreventPrivacyReason,
	// 埋点透传字段 json string
	9: optional string LogExtra,
	// 星图视频直播间引流信息
	10: optional ItemStarAtlasLiveInfoStruct StarAtlasLiveInfo,
	// 星图视频直播引流信息 - 底bar
	11: optional ItemStarAtlasLiveInfoForBarStruct StarAtlasLiveInfoForBar,
	// 星图视频下发客户端监测链接
	12: optional ItemStarAtlasTrackUrlInfoStruct StarAtlasTrackUrlInfo,
}

struct ItemVideoReplyStruct {
	1: optional i64 AwemeId,
	2: optional i64 CommentId,
	3: optional i64 AliasCommentId,
	4: optional i64 ReplyUserId,
	5: optional i32 ReplyAwemeVersion,
}

struct ItemDouplusToastStruct {
	// toast Id
	1: required i64 Id,
	// 文案 Id
	2: required i64 ContentId,
	// toast类型
	3: required i32 Type,
	// toast内容
	4: required string Content,
	// 跳转地址
	5: optional string RedirectUrl,
}

struct ItemDouplusStruct {
	// toast信息
	1: optional ItemDouplusToastStruct ToastInfo,
}

struct ItemShareTaskStruct {
	// 任务展现时机，单位 ms
	1: required i32 ShowTimestamp,
	// 任务奖励金币数
	2: required i32 CoinCount,
	// 0-无法完成 1-可完成
	3: optional i32 TaskStatus,
}

// Music Structs
struct MusicAudioStruct {
	1: required i32 Duration,
	2: required i32 EndTime,
	3: required i32 StartTIme,
	4: required UrlStruct PlayUrl,
	5: optional UrlStruct AudioTrackUrl,
	6: optional UrlStruct CoverHdUrl,
	7: optional UrlStruct CoverMediumUrl,
	8: optional UrlStruct CoverLargeUrl,
	9: optional UrlStruct CoverThumbUrl,
	10: optional UrlStruct EffectsDataUrl,
	11: optional enum_type.LyricTypeEnum LyricType,
	12: optional string LyricUrl,
	13: optional double PreviewStartTime,
	14: optional double PreviewEndTime,
	//试听时长
	15: optional i32 AuditionDuration,
	//拍摄时长
	16: optional i32 ShootDuration,
	//可用视频时长
	17: optional i32 VideoDuration,
	// 音频的一些meta信息map<string, string>: 音量均衡参数等
	18: optional string Meta,
	// Bitrate 配置
    19: optional list<BitrateStruct> BitrateInfos,
    // cdl_url过期时间，utc时间，和时区无关, 单位具体到秒
    20: optional i64 CdnUrlExpired,
    // 试听
    21: optional MusicPreviewInfo PreviewInfo,
    // vid
    22: optional string Vid,
}

struct MusicPreviewInfo {
	// 试听开始时间（单位：ms）
	1: optional i64 StartMs,
	// 试听持续时间（单位：ms）
    2: optional i64 DurationMs,
    // 完整版播放链接
    3: optional UrlStruct FullPlayUrl,
}

struct MusicExternalStruct {
	1: required string H5Url,
	2: required string PartnerName,
	3: required string PartnerSongID,
	4: required string SongKey,
	5: optional string ExternalAppLink,
	6: optional string ExternalDeepLink,
}

struct MusicMuteStruct {
	1: optional bool IsVideoMute,
	2: optional list<enum_type.MusicUnshelveReasonEnum> MuteReasonTypes,
}

struct MusicClimaxStruct {
	//音乐高潮开始时间点
	1: required i32 start_point,
}

struct MusicOtherStruct {
	1: optional UrlStruct BodydanceChallengeId,
	2: optional i64 BindedChallengeId,
	3: optional UrlStruct BodydanceUrl,
	4: optional string Extra,
	5: optional UrlStruct StrongBeatUrl,
	6: optional list<string> UnshelveCountries,
	7: optional string InternalExtra,
	8: optional list<i64> UGCMappingPGCClipIDs,
	// is music metadata from matched PGC sound clip?
	9: optional bool IsMatchedMetadata,
	// subtitle for resso exclusive(temporary, can be used for other purpose)
	10: optional string ExternalSongSubtitle,
	11: optional bool CanReplaceMusic,
	12: optional MusicMuteStruct MusicMute,
	13: optional UGCMappingSongStruct UGCMappingSong,
	14: optional i64 ExtractedItemID,
	15: optional MusicClimaxStruct MusicClimax,
	16: optional MappingSongStruct MetaSong,
	17: optional KaraokeSongStruct KaraokeSong,
	18: optional list<MappingSongStruct> RawMappingSongs,
	19: optional MusicAnchorStruct MusicAnchor,
	20: optional map<enum_type.MusicSceneEnum,list<i32>> RelatedLabelIDs,
	21: optional DetailStatusInfo DetailStatusInfo,
	22: optional MusicPermissionStruct PermissionInfo,
	23: optional i32 OldMusicStatus,
	24: optional HSVStruct CoverColorHSV,
	25: optional list<i64> MetaSongGroupIDs,
	26: optional DisplayMappingSongStruct DisplayMappingSong,
	27: optional list<RelatedMusicAnchorStruct> RelatedMusicAnchors,
	28: optional RelevantLinkmicWebcastStruct RelevantLinkmicWebcast,
	29: optional i32 DspStatus,
	30: optional bool IsInPlaylist,
	31: optional UrlStruct MusicxBeatsTrackerURL, // 二合一的图文卡点地址
	32: optional string MusicxBeatsTrackerRaw, // 二合一的图文卡点原始数据
	33: optional MusicDiversionStruct MusicDiversion,
	34: optional LunaSongStruct LunaSong, // 折叠到汽水Song数据
	35: optional MusicDiversionResultContext MusicDiversionContext,
	36: optional MusicUnifiedMusicGroupStruct MusicUnifiedMusicGroup,
	37: optional i32 MaskCover,
	38: optional PromotedMusicTagStruct PromoteMusicTag, // 宣推标签
}

struct PromotedMusicTagStruct {
  1: optional string SchemaUrl, // 跳转链接 
  2: optional UrlStruct TagUrlLight, // tag icon链接，浅色模式
  3: optional UrlStruct TagUrlDark, // tag icon链接，深色模式
  4: optional double AspectRatio, // tag 宽高比
  5: optional string MetaSongIDStr, 
  6: optional string ActivityID, // 活动名称 
}

struct MusicUnifiedMusicGroupStruct {
	1: optional i64 SongID, // ugID对应的songID
	2: optional string Title, // song的title
	3: optional string Author, // 作者
	4: optional UrlStruct MediumCoverUrl, // 封面
}

struct MusicDiversionResultContext {
	1: optional i64 SongID, // 导流结果songID
	2: optional i32 HitStrategy,
	3: optional enum_type.DiversionFilterReasonEnum Fr,
	4: optional list<EventTrackSongEntity> SongInfos,
}

struct EventTrackSongEntity {
	1: optional i64 SongID, 
	2: optional i32 ContentLevel,
	3: optional DiversionYesOrNoEnum CopyRight,
	4: optional DiversionYesOrNoEnum IsOp, 
	5: optional DiversionYesOrNoEnum IsPromotion, 
	6: optional DiversionYesOrNoEnum IsL3Recall, 
	7: optional DiversionMatchModelEnum MatchMode,
	8: optional DiversionMatchTypeEnum MatchType, // 废弃
	9: optional DiversionGroupInfo GroupInfo,
	10: optional i64 Flag,
}

struct DiversionGroupInfo {
	1: optional i64 GroupID, 
	2: optional DiversionMatchModelEnum MatchMode,
	3: optional DiversionMatchTypeEnum MatchType,
}

enum DiversionYesOrNoEnum {
	NO = 0
	YES = 1
}

enum DiversionMatchTypeEnum {
	SAME = 0
	SIM = 1
}

enum DiversionMatchModelEnum {
	UNKNOWN = 0
	FINGER_PRINT = 1
	COVER = 2
	HUMMING = 3
}




struct LunaSongStruct {
    1: optional i64 LunaSongID,	// 折叠到汽水的SongID
	2: optional string LunaSongIDStr,
	3: optional bool LunaCopyright // 是否有汽水版权
}

struct MusicDiversionStruct {
    1: optional i64 SongId,
	2: optional i32 Version,
	3: optional UrlStruct MediumCoverUrl,
	4: optional i32 HitStrategy, // 命中的策略
	5: optional string Author,
	6: optional string Title,
	7: optional bool IsSame, // pgc与识别歌曲是否相同
	8: optional i32 Scene, // 0是导流，1是收藏
	9: optional i32 CollectStatus // 0是未收藏，1是已收藏
	10: optional bool ShowHead // 是否在头部展示
	11: optional string MediaType // 导流资源类型，与跳转汽水强插的类型对齐
	12: optional i64 MvMetaSongID // mv关联的songID
	13: optional i64 HitStrategyV2 // 命中策略v2
	14: optional string ReqUserNickName // 请求用户的名字
}

struct MusicAnchorStruct {
	1: optional string SchemaUrl,
	2: optional string Title,
	3: optional string Id,
}

struct KTag {
	1: required string Text,
	2: required string Color,
}

struct KaraokeSongStruct {
	1: required i64 Id,
	2: optional i64 MusicID,
	3: optional i32 UserCount,
	4: optional string Title,
	5: optional string Author,
	6: optional UrlStruct CoverHdUrl,
	7: optional UrlStruct CoverLargeUrl,
	8: optional UrlStruct CoverMediumUrl,
	9: optional UrlStruct CoverThumbUrl,
	11: optional i32 Duration,
	12: optional i32 LyricType,
	13: optional UrlStruct LyricUrl,
	14: optional i32 LyricStart,
	15: optional bool ShowAuthor,
	16: optional KaraokeAudioStruct OriginalSoundAudio,
	17: optional KaraokeAudioStruct AccompanimentAudio,
	18: optional KaraokeSongMappingTypeEnum MappingType,
	19: optional UrlStruct MidiUrl,
	20: optional list<KTag> Tags,
	21: optional bool IsPgc,
	22: optional bool IsFull,
	23: optional i32 MidiSource,
}

struct KaraokeAudioStruct {
	1: optional double VolumeLoudness,
	2: optional double VolumePeak,
	3: optional i32 PlayUrlStart,
	4: optional UrlStruct PlayUrl,
	5: optional i32 PlayUrlDuration,
}

struct MusicOwnerStruct {
	1: required i64 Id,
	2: required string Nickname,
	3: required string SecretId,
	4: required string Sign,
	5: optional bool VCDNotAuth,
}

struct MusicArtistStruct {
	// 用户id
	31: optional i64 UserId,
	// 不再使用
	32: optional string Nickname,
	// 不再使用
	33: optional string SecretId,
	// 不再使用
	34: optional string UniqueID,
	// 不再使用
	35: optional UrlStruct Avatar,
	// 不再使用
	36: optional bool IsVerified,
	// 艺人入驻类型（不再使用）
	37: optional enum_type.MusicArtistTypeEnum EnterType,
	38: optional i64 ArtistID,
	// 艺人名称
	39: optional string ArtistName,
}

// NoticeStructs
struct DouyinAssStruct {
	1: optional string Keyword,
	2: optional string DisplayKeyword,
}

struct NoticeCommentStruct {
	1: optional string ReplyUserID,
	2: optional string ReplyUserNickname,
	// 如果回复的是视频评论，用该字段标识评论视频id
	3: optional string AliasItemId,
	// 评论中视频的类型，4-评论区上传的视频
	4: optional i32 AliasItemType,
}

struct NoticeDiggStruct {
	1: optional i32 DiggType,
	2: optional bool hasDiggList,
	3: optional i32 RefType,
	4: optional string ForwardID,
	5: optional ContentWithIconStruct ContentWithIcon,
	6: optional UrlStruct Cover,
	7: optional UrlStruct CoverOrigin,
	8: optional DanmakuInfo DanmakuInfo,
	9: optional IMDataSourceStruct IMDataSource
}

struct ThanksDiggInfo {
    1: optional i32 ThanksDiggType,
    2: optional string ThanksDiggContent,
}

struct IMDataSourceStruct {
    1: optional i32 ConvType,
    2: optional string ConvId,
    3: optional i64 ConvShortId,
    4: optional i64 MessageId
}

struct DanmakuInfo {
	1: optional i64 DanmakuID,
	2: optional i64 Offset,
	3: optional i64 Status,
	4: optional string extra,
	5: optional i64 ActionType, // 点赞状态 0:无状态 1:点赞 2:踩
	6: optional i64 DanmakuNoticeType,
    7: optional DanmakuReplyNoticeInfo ReplyInfo
}

struct DanmakuReplyNoticeInfo {
    1: optional string ParentDanmakuID,
    2: optional i64 ParentDanmakuOffset,
    3: optional i64 ParentDanmakuStatus
}

struct NoticeGameStruct {
	1: optional string Id,
	2: optional string Name,
	3: optional string SubTitle,
	4: optional string Icon,
}

struct NoticeMicroAppStruct {
	1: optional string Id,
	2: optional string Name,
	3: optional string SubTitle,
	4: optional string Icon,
	5: optional i32 Unsub,
}

struct NoticeCreatorMissionStruct {
	1: optional string Id,
	2: optional string Name,
}

struct NoticeMigrateStruct {
	1: optional string ExportUserID,
	2: optional string ImportUserID,
	3: optional i64 RejectStatus,
	4: optional list<NoticeMigrateTextStruct> MigrateText,
}

struct NoticeMigrateTextStruct {
	1: optional string text,
	2: optional i64 key,
	3: optional i64 action,
	4: optional string link,
}

struct NoticeShopStruct {
	1: optional string SessionId,
	2: optional string SessionAvatar,
	3: optional string OwnMessage,
	4: optional string PigeonHint,
}

struct NoticeTcmStruct {
	1: optional i32 SourceType,
	2: optional string SourceName,
	3: optional UrlStruct SourceIcon,
	4: optional UrlStruct DarkSourceIcon,
}

struct NoticeVCDStruct {
	1: required i32 JumpStatus,
	2: required string SchemaURL,
	3: required string SchemaText,
}

struct NoticeVoteStruct {
	1: optional string OptionText,
	2: optional i32 RefType,
	3: optional i64 OptionId,
}

struct DouyinUgcWendaAnswerInfo {
  	// 回答id
  	1: required i64 Ansid,
	// 问题id
	2: required i64 Qid, 
	// 回答内容
  	3: required string Content,
	// 回答审核状态，0：默认or过机审；1: 人审
  	4: required i64 AnswerReviewed,
	// 回答最终可见度
  	5: required i64 AnswerStatus,
	// 问题审核状态，0：默认or过机审；1: 人审
  	6: required i64 QuestionReviewed,
	// 问题最终可见度
  	7: required i64 QuestionStatus,
}

// User Structs
struct UserAvatarDecorationStruct {
	1: required i64 Id,
	2: required string Name,
	3: required UrlStruct SourceUrl,
	// 0: 老式上半球挂件; 1: 全包挂件; 2: 激进版尺寸
	4: optional i32 PositionType,
	// 动态挂件素材链接（多库存后废弃）
	5: optional string DynamicSourceUrl,
	// 动态挂件素材链接-profile预加载
	6: optional string DynamicSourceUrlProfile,
	// 分活动的跳转链接
	7: optional string WebUrl,
	// 标识为首投活动挂件，与首投资格共同作为半弹层的弹出条件
	8: optional bool IsFirstPost,
	// 活动配置ID
	9: optional string ConfigId,
	// 动态挂件素材链接-视频上素材
	10: optional string DynamicSourceUrlFeed,
	// 按钮类型
	11: optional i32 BtnType,
	// 按钮文案
	12: optional string BtnText,
	// 氛围素材json
	13: optional string Atmosphere,
	// 分活动的端内跳转
	14: optional string OpenUrl,
	// 六分屏内H5链接
	15: optional string PrepageUrl,
}

struct UserCertificationStruct {
	1: required i32 CertType,
	2: required i32 OrganizationType,
	// 认证类型(国外)：个人、机构、企业
	3: optional enum_type.MTCertTypeEnum MTCertType,
}

struct UserCommerceAccountStruct {
	1: required i32 Level,
	2: optional list<i64> TopItemIds,
	// 高级账号状态
	3: optional enum_type.ProAccountStatus ProAccountStatus,
	// 广告本地推信息 
	4: optional i32 LifeLocalUserAdTag,
}

struct UserCommunityStruct {
	1: required i32 DisciplineStatus,
}

struct UserEcommerceAccountStruct {
	1: required list<i64> TopItemIds,
}

struct UserExtraStruct {
	1: optional string GeneralExtra,
	2: optional string Extra,
}

struct UserLevelStruct {
	1: optional string ModelLevel,
	2: optional string AuthLevel,
}

struct UserIconStruct {
	1: required string AvatarUri,
	2: required UrlStruct AvatarThumbUrl,
	3: required UrlStruct AvatarMediumUrl,
	4: required UrlStruct AvatarLargeUrl,
	5: required UrlStruct AvatarUrl168x168,
	6: required UrlStruct AvatarUrl300x300,
	7: required list<UrlStruct> BackgroundImages,
	8: required UrlStruct VideoIconUrl,
	9: optional UserAvatarDecorationStruct AvatarDecorationInfo,
	10: optional string VideoIconVirtualURI,
	11: optional string BackgroundImageJumpUrl,
	12: optional UrlStruct AvatarMaskThumbUrl,
	13: optional UrlStruct AvatarMaskMediumUrl,
	14: optional UrlStruct AvatarMaskLargeUrl,
	15: optional list<string> AvatarSchemaList,

}

struct UserOriginalMusicianStruct {
	1: required i32 Count,
	2: required i32 Digg,
	3: required i32 Used,
	4: optional UrlStruct CoverUrl,
	5: optional UrlStruct QrcodeUrl,
}

struct UserOtherStruct {
	1: required bool Blocked,
	2: required enum_type.FollowStatusEnum FollowStatus,
	3: required i64 RoomId,
	4: optional string RemarkName,
	5: optional list<i64> LabelTypes,
	6: optional i32 FollowerStatus,
	7: optional string RecommendReason,
	8: optional string RoomData,
	9: optional i64 AgeInterval,
	10: optional i64 UgcOffer,
	11: optional i32 ReviewTestTag,
	12: optional i16 RealStatus,
	13: optional list<i64> BanUserFunctions,
	14: optional string UseWxName,
	15: optional string UseWxAvatar,
	16: optional string WxReplaceAvatarUri,
	17: optional string WxReplaceNickname,
	18: optional string Extra,
	19: optional bool IsFamiliar,
	20: optional double FamiliarScore,
	21: optional i32 StoryTag,
	22: optional bool NotShow,
	23: optional bool FromNotShow,
	24: optional bool NotSee,
	25: optional bool ShowFavoriteListOnItem,
	26: optional i32 SignatureDisplayLines,
	27: optional i32 FollowerRequestStatus,
	// 直播状态：普通直播，连麦
	28: optional i32 LiveStatus,
	// 是否是我的朋友 0-不展示设置项，1-不是朋友，2-是朋友
	29: optional i32 NewFriendType,
	//e项目tag
	30: optional i32 VxETag,
	31: optional i64 NewFriendCount,
	32: optional string RecommendReasonType,
	33: optional bool CollectKnowledgeUserItem,
	34: optional string MobileKey,
	// from pb builder
	100: optional bool IsStar,
	// from pb builder
	101: optional string RelationLabel,
	// 用户同城兴趣标签
	102: optional list<UserInterestTagStruct> InterestTags,
	// 是否被催更标志
	103: optional UserUrgeStruct UrgeInfo,
	// 直播Room的Private数据
	104: optional string RoomPrivateData,
	// 上次投稿的时间
	105: optional i64 LastAwemeTime,
	// from awemeStructV1 pb_builder
	106: optional double KyOnlyPredict,
	// 用户视频消费兴趣标签
	107: optional list<i32> VideoConsumeInterest,
	// 密友关系
	108: optional enum_type.CloseFriendStatusEnum CloseFriendStatus,
	// 用户是否活跃(在线)
    109: optional enum_type.UserOnlineStatus OnlineStatus,
    // 用户最后活跃时间
    110: optional i64 LastActiveTime,
    // from_uid 是否拉黑 to_uid
    111: optional bool IsBlockingV2,
    // to_uid 是否拉黑 from_uid
    112: optional bool IsBlockedV2,
    // 人店一体账号 店铺入口
    113: optional string EcomEntranceSchema,
    // from familiar_feed 推人场景下用户推荐分数
    114: optional double RecommendScore
    // 用户祝福
    115: optional enum_type.UserWishType UserWish,
    // 电商导流风险提示文案
    116: optional string RiskNoticeText,
    // UG关注引导
    117: optional UserFollowGuideStruct FollowGuide,
    //ever信息
    118:optional EverInfoStruct EverInfo
    // now icon
    119:optional i64 NowPostDate,
	// 特别关注关系 0： 未特别关注 1： 特别关注
	120:optional i32 SpecialFollowStatus, 
	121: optional i32 ShowSpecialFollowButton,
	// 兴趣小组组员状态 0-非小组成员 1-小组成员
	122: optional i32 InterestGroupStatus,
	// 兴趣小组标签
	123: optional string InterestGroupLabel,
	124: optional list<FamiliarVisitorStruct> FamiliarVisitor,
	// 直播高价值 0-非直播高价值，1-直播高价值
	125: optional i32 LiveHighValue,
	// 关注状态查询错误码
	126: optional i32 FollowStatusErrCode,
	127: optional string AwemehtsGreetInfo,  //新火山问候信息
	// 用户头像&背景url，公参提取结构
   	128: optional map<string,string> UrlCommonData,
	129: optional i64 HostDoubleCloseFriend,   // 主态用户的双向密友开启状态
	130: optional i32 RealEstateCertification // 房产认证
	131: optional string FormatData // 数字人房间
	132: optional i64 FriendCreateTime // 朋友创建时间.
	133: optional i64 CFCheckinDays // 密友时刻连续打卡天数
	134: optional string RoomIdStr // 字符串类型的直播间ID
	135: optional bool HideFollowButton // 是否展示关注引导button
	136: optional string RecommendRecallType  // 推荐侧透传recall类型,用于埋点
	137: optional list<PrivateRelationStruct> PrivateRelationList, //账号维度的私域关系，存在关系才下发
	138: optional MateRelationStruct MateRelation, // 新版朋友关系状态
    139: optional i32 FamiliarConfidence, // 高置信熟人标记，0=否，1=是
    140: optional i32 SocialNegativeUser, // 社交负向账号标记，0=无，1=黑灰产等恶意账号
    141: optional i64 MateCount, // 新版朋友关系数量
}

struct PrivateRelationStruct {
	1: required enum_type.PrivateRelationType RelationType, // 私域关系类型
	2: required i32 RelationValue, // 私域值
}

struct MateRelationStruct {
	1: optional i32 MateStatus, // 是否有新版朋友关系，0=无，1=有
	2: optional i32 MateApplyForward, // 我是否申请加对方好友，0=无，1=有
	3: optional i32 MateApplyReverse, // 对方是否申请加我为好友，0=无，1=有
	4: optional i64 MateApplyUid, // 已达成的朋友关系中申请者的uid
}

struct FamiliarVisitorStruct {
	1: required i64 UserID,
	2: required string Nickname,
	3: required string Signature,
	4: required UrlStruct AvatarThumb,
}

struct UserFollowGuideStruct {
    // 关注引导触发类型
    1: required enum_type.FollowGuideTriggerType TriggerType
    // 关注引导tag，如：football_author
    2: optional string GuideTag
    // 关注引导label文本，如：关注TA看世界杯
    3: optional string LabelText
}

struct UserUrgeStruct {
	1: required bool UserUrged,
}

struct UserInterestTagStruct {
	1: required i64 TagID,
	2: required string TagName,
}

struct UserStatisticsStruct {
	1: required i64 AwemeCount,
	2: required i64 FavoritingCount,
	3: required i64 FollowerCount,
	4: required i64 FollowingCount,
	5: required i64 StoryCount,
	6: required i64 TotalFavorited,
	7: optional i64 XmasUnlockCount,
	8: optional enum_type.CountStatusEnum FollowCountStatus,
	9: optional i64 FriendCount,
	10: optional i64 PrivateAwemeCount,
	11: optional i64 FriendAwemeCount,
	12: optional i64 FollowLunaArtistCount,
    13: optional i64 MaxFollowerCount,
    14: optional bool NeedSpecialShowFollowerCount,
    15: optional i64 MixFollowerCount
    16: optional map<string,i64> CounData    //  新增数据结构，返回 counter 的所有计数相关信息
}

struct YummeUserStatisticsStruct {
	1: required i64 VideoPublishCount, // 用户作品数
	2: required i64 VideoDiggCount, // 用户作品获赞总数
	3: required i64 FollowerCount, // 用户粉丝数
	4: required i64 FollowingCount, // 用户关注数
	5: optional i64 PrivateAwemeCount, // 隐私视频数
    6: optional i64 MaxFollowerCount,
}

struct UserSocialStruct {
	1: required i32 AppleAccount,
	2: required i32 FacebookExpireTime,
	3: required string GoogleAccount,
	4: required bool HasFacebookToken,
	5: required bool HasTwitterToken,
	6: required bool HasYoutubeToken,
	7: required bool IsBindedWeibo,
	8: required string InsId,
	9: required i32 TwitterExpireTime,
	10: required string TwitterId,
	11: required string TwitterName,
	12: required string WeiboName,
	13: required string WeiboSchema,
	14: required string WeiboUrl,
	15: required string WeiboVerify,
	16: required string YoutubeChannelId,
	17: required string YoutubeChannelTitle,
	18: required i32 YoutubeExpireTime,
}

struct UserSettingStruct {
	1: required bool AcceptPrivatePolicy,
	2: required string AccountRegion,
	3: required i32 CommentFilterStatus,
	4: required i32 CommentSetting,
	5: required i32 Creatorlevel,
	6: required string CvLevel,
	7: required i64 DownloadPromptTimestamp,
	8: required i32 DownloadSetting,
	9: required i32 DuetSetting,
	10: required list<string> Geofencing,
	11: required bool HasInsights,
	12: required bool HasRegisterNotice,
	13: required bool HideLocation,
	14: required bool HideSearch,
	15: required i32 LiveAgreement,
	16: required i64 LiveAgreementTime,
	17: required i32 LiveRecLevel,
	18: required string Location,
	19: required i32 Mode,
	20: required bool NicknameLock,
	21: required bool NeedRecommend,
	22: required i32 Period,
	23: required map<string,i32> PolicyVersion,
	24: required bool PreventDownload,
	25: required i32 Rate,
	26: required i32 ReactSetting,
	27: required i32 RealnameVerifyStatus,
	28: required i32 RiskFlag,
	29: required i64 ReflowPageGid,
	30: required i64 ReflowPageUid,
	31: required string SchoolName,
	32: required string SchoolPoiId,
	33: required i32 SchoolType,
	34: required bool ShieldCommentNotice,
	35: required bool ShieldDiggNotice,
	36: required bool ShieldFollowNotice,
	37: required bool ShieldNeiguang,
	38: required bool SpecialLock,
	39: required i32 StoryReplyPermissionStatus,
	40: required bool SyncToToutiao,
	41: required bool UpdateBefore,
	42: required i32 IsolationLevel,
	43: optional enum_type.FavoriteListPermissionEnum FavoriteListPermission,
	44: optional list<string> CommentFilterWords,
	45: optional list<string> GeoFilter,
	46: optional enum_type.FavoriteListPermissionEnum FavoriteOnItemPermission,
	47: optional bool AllowBeLocated,
	// 用户维度的stitch设置
	48: optional i32 StitchSetting,
	49: optional i32 MutualFriendComment,
	50: optional enum_type.ContactStatus ContactStatus,
	51: optional string HometownVisible,
	52: optional string Hometown,
	53: optional i32 ShowMutualFriendCommentCount,
	54: optional i32 ShowGenderStrategy,
	// 用户是否打开了同城活跃开关
	55: optional bool EnableNearbyActive,
	// 用户主页访客权限 -1,空:未设置 0: 关闭, 1: 开启
	56: optional enum_type.ProfileVisitorPermissionEnum ProfileVisitorPermission,
	// 校园日常，学校ID
	57: optional string SchoolId,
	// 校园日常，学校类型。1：国内大学，2：其他学校
	58: optional i32 SchoolCategory,
	// 是否禁止他人保存我的图评. 0: 不禁止, 1: 禁止
	59: optional i32 DisableImageCommentSaved,
	// 非新朋友能看三条日常作品封面 0:关闭 1:开启 私密账号默认关闭 普通账号默认开启
    60: optional i32 NotMateCanSee,
    // 隐私设置-谁可以加我为朋友 0:所有人, 1:我关注的人, 2:粉丝, 3:互关
    61: optional i32 MateAddPermission,
}

struct UserVCDStruct {
	//是否火山用户
	1: required bool IsHotsoon,
	//是否帐号授权
	2: required bool Authorized,
	//是否允许下载视频
	3: required bool AllowDownload,
	//用户隐藏位置信息开关
	4: required bool AllowLocated,
	//1. 无评论限制 2. 仅作者关注的人可以评论 3. 仅作者的粉丝可以评论 4. 仅和作者互关的人可以评论
	5: optional i32 CommentRestrict,
	//是否关系授权
	6: optional bool AuthorizdRelation,
	//帐号授权时间
	7: optional i64 AuthorizedTime,
	//关系授权时间
	8: optional i64 AuthorizedRelationTime,
}

struct UserRoleStruct {
    1: required i64 Id,
    2: required string Key,
}

struct GivenSourceDTO {
    1: optional list<i64> RoleIds,
    2: optional list<i64> LevelIds,
    3: optional list<i64> RelationIds,
}
struct PermissionVal {
    1: required i64 R, // 来源于role_id 
    2: required i64 L, // 来源于level_id
    3: required i64 Re, // 来源于relation_id
    4: required string Val, // 权益的value
} 

struct UserPermissionStruct {
    1: required i64 Id,
    2: required string Key,
    3: required string Value,
    4: optional GivenSourceDTO GivenSource,
    5: optional string Name,
    6: optional list<PermissionVal> ValList,
}

struct CertLabel {
    1: required string LabelText, // 标签文案
    2: optional string Scheme,   
	3: optional string Extra // 标签所属的额外业务数据
}

struct UserVerificationStruct {
	1: required i64 AuthorityStatus,
	2: required string CustomVerify,
	3: required bool EnterpriseVerify,
	4: required string EnterpriseVerifyReason,
	5: required bool IsVerified,
	6: required i32 LiveVerify,
	7: required i32 VerificationType,
	8: required string VerifyInfo,
    9: optional list<UserRoleStruct> Roles,
    10: optional list<UserPermissionStruct> Permissions,
	11: optional map<string, string> CertDataMap,
	12: optional map<enum_type.CertLabelEnum, CertLabel> CertLabelMap,
	13: optional string AccountCertInfo, 	// 认证信息
}

struct UserUnreadVideoStruct {
	1: optional i32 Count,
	2: optional i64 LatestTime,
	3: optional list<i64> ItemIds,
}

// Meta Structs
struct ChallengeStruct {
	1: required i64 Id,
	2: required i64 Type,
	3: required string ChaName,
	4: required i64 CreateTime,
	5: required string Desc,
	6: required string Schema,
	7: required i64 UserId,
	8: required i32 Status,
	9: optional ChallengeMaterial MaterialInfo,
	10: optional string BaikeSchema,
}

struct ItemStruct {
	1: required i64 Id,
	2: required i32 AppId,
	3: required i64 ChallengeId,
	4: required i64 CreateTime,
	5: required string Desc,
	6: required i64 GroupId,
	7: required enum_type.MediaTypeEnum MediaType,
	8: required i64 MusicId,
	9: required string Region,
	10: required i32 Status,
	11: required i32 Type,
	12: required i64 UserId,
	13: required i32 VrType,
	14: optional i64 ModifyTime,
	15: optional string Caption,
	16: optional string ItemTitle,
	17: optional XiGuaBaseInfo XiGuaBaseInfo,
	18: optional string AwemeTypeTags,
}

struct MusicStruct {
	1: required i64 Id,
	2: required string Album,
	3: required string Author,
	4: required i64 CreateTime,
	5: required string OfflineDesc,
	6: required i16 LabelId,
	7: required string SchemaUrl,
	8: required i16 SourcePlatform,
	9: required i16 Status,
	10: required string Title,
	11: required i64 UsedCount,
	12: optional enum_type.MusicUnusableReasonTypeEnum UnusableReasonType,
	13: optional bool IsAudioURLWithCookie,
}

// schema v2
struct NoticeSchemaStruct {
    1: required string Url,
    2: required string Text,
}

// schema v3 start
struct RichNoticeSchemaStruct {
    1: required string Url,
    2: required string Text,
	3: optional string RightText,
	4: optional NoticeSchemaUi UiInfo,
}

struct NoticeSchemaUi {
	1: required NoticeSchemaUiItem Dark,
	2: required NoticeSchemaUiItem Light,
}

struct NoticeSchemaUiItem {
	1: required string TextColor,
    2: required string RightTextColor,
	3: optional string LeftIcon,
}
// schema v3 end

struct NoticeTextKvStruct {
    1: required string Key,
    2: required string Value,
}

struct NoticeNumberStruct {
    1: required string Title,
    2: required string Content,
    3: optional string Note,
}

struct NoticeContentStruct {
    1: optional list<NoticeTextKvStruct> Text,
    2: optional string Header,
    3: optional string Footer,
	4: optional NoticeNumberStruct NumberInfo,
}

struct NoticeStruct {
	1: required i64 ID,
	2: required i32 Type,
	3: required i64 CreateTime,
	4: optional string Title,
	5: optional string Content,
	6: optional string SchemaUrl,
	7: optional UrlStruct ImageUrl,
	8: optional i32 SubType,
	9: optional i32 ItemMediaType,
	10: optional i32 MergeCount,
	11: optional bool Pending,
	12: optional list<i64> FromUserIDs,
	13: optional i64 TaskID,
	14: optional i64 RefID,
	15: optional i64 ObjectId,
	16: optional string NoticeLabelText,
	17: optional string WebUrl,
	18: optional string LogExtra,
	19: optional i32 NoticeLabelType,
	20: optional i32 ActionApp,
	21: optional bool HasRead,
	22: optional string ContentSchemaUrl,
	23: optional string SchemaText,
	//该消息是否来自新系统
	24: optional bool FromNew,
	//业务方自定义的埋点字段是json格式
	25: optional string MessageExtra,
	//是否是大图
	26: optional bool BigPic,
	27: optional string NoticeLabelTracking,
	28: optional string Desc,
	29: optional string From,
	30: optional string FromPre,
	// 模板优化
	31: optional NoticeContentStruct ContentStructs,
	32: optional list<NoticeSchemaStruct> SchemaStructs,
	33: optional string SubContent,
	34: optional string Highlight,
	35: optional i32 GoldType,
	36: optional list<FansLabelsStruct> NoticeLabels,
	37: optional string CooperationInfo,
	38: optional string GreetInfo,
	39: optional VsNoticeDetailStruct VsDetail, //vs 节目业务字段
	40: optional i64 ReadTime,
	41: optional list<RichNoticeSchemaStruct> RichSchemaStructs,
	42: optional list<i64> ItemIDs, //点赞类型聚合视频用的item_id列表
	43: optional string OriginExtra, // 中台原始extra数据
	
	128: optional DouyinAssStruct DouyinAssInfo,
	129: optional NoticeDiggStruct DiggInfo,
	130: optional NoticeVoteStruct VoteInfo,
	131: optional NoticeCommentStruct CommentInfo,
	132: optional NoticeShopStruct ShopInfo,
	133: optional NoticeGameStruct GameInfo,
	134: optional NoticeMigrateStruct MigrateInfo,
	135: optional XSpaceStruct XSInfo,
	136: optional NoticeTcmStruct TcmInfo,
	137: optional NoticeCreatorMissionStruct CreatorMissionInfo,
	138: optional ShopServiceStruct ShopServiceInfo,
	139: optional NoticeMicroAppStruct MicroAppInfo,
	140: optional NoticeActionStruct ActionInfo,
	141: optional NoticeVisitorStruct VisitorInfo,
	142: optional NoticeInteractiveStruct InteractiveInfo,
	143: optional UrlStruct MaskImageUrl,
	144: optional list<i64> EffectIDs, // 特效id
	145: optional i64 InterestGroupId // 兴趣小组id
	146: optional PitayaActivityStruct PitayaActivityInfo,
	147: optional FlameInteractiveStruct FlameInteractiveInfo, // 抖音火山版-火苗相关信息
	148: optional i32 DuetType,
}

struct PitayaActivityStruct {
	1: required i64 TaskType,
	2: required i64 TaskStatus,
	3: optional i64 RemainNum,
	4: optional i64 RewardAmount,
	5: optional bool MutualFollowed, // 已互关 满减场景用
	6: optional i64 AwemeID, // 作品id
	7: optional string RewardText, // 奖励文案 主会场用
}

struct VsNoticeDetailStruct{
    1: optional i32 vs,
    2: optional i64 episodeId,
    3: optional string schema_url,
}

struct NoticeInteractiveStruct {
	1: optional string AvatarSchema,
	2: optional string CellSchema,
	3: optional string CoverSchema,
	4: optional string Desc,
	5: optional string Abstract,
	6: optional UrlStruct AvatarUrl,
	7: optional UrlStruct ImageUrl,
	8: optional UrlStruct TypeUrl,
	9: optional string ButtonText,
	10: optional string ButtonSchema,
	11: optional string DynamicSchema,
    12: optional i32 IsDeleted,
    13: optional DanmakuInfo DanmakuInfo,
    14: optional ThanksDiggInfo ThanksDiggInfo,
	15: optional DouyinUgcWendaAnswerInfo DouyinUgcWendaAnswerInfo,
}

struct NoticeActionStruct {
	1: optional list<Button> Button,
	2: optional ActionResponse ActionResponse,
	3: optional string RequestTag,
	4: optional string RequestExtra,
	5: optional enum_type.NoticeActionStatus ActionStatus,
}

struct NoticeVisitorStruct {
	1: optional list<i64> FromUids,
	2: optional i32 Total,
	3: optional i32 ProfileVisitorPermission,
}

struct Button {
	//按钮的文案
	1: optional string Name,
	//按钮旁的图标
	2: optional string ImageUri,
	3: optional string LightImageUri,
	//该按钮的请求的value
	4: optional string RequestValue,
}

struct ActionResponse {
	1: optional string Name,
	2: optional string ImageUri,
	3: optional string LightImageUri,
}

struct UserStruct {
	1: required i64 Id,
	2: required i32 AppId,
	3: required string BindPhone,
	4: required string Birthday,
	5: required enum_type.ConstellationTypeEnum Constellation,
	6: required i64 CreateTime,
	7: required string Email,
	8: required enum_type.GenderEnum Gender,
	9: required string Language,
	10: required string Nickname,
	11: required string Phone,
	12: required string Region,
	13: required string SecretId,
	14: required i64 ShortId,
	15: required string Signature,
	16: required i16 Status,
	17: required string UniqueId,
	18: required i64 UniqueIdModifyTime,
	19: optional i16 Secret,
	20: optional i32 UserAge,
	21: optional bool IsYoungUser,
	22: optional UrlStruct Avatar,
	23: optional string RemarkName,
	24: optional UrlStruct AvatarLarger,
	25: optional UrlStruct AvatarThumb,
	26: optional enum_type.FollowStatusEnum FollowStatus,
}

struct MixStatisStruct {
	1: optional i64 PlayVV,
	2: optional i64 CollectVV,
	3: optional i64 CurrentEpisode,
	4: optional i64 UpdatedToEpisode,
	5: optional i64 HasUpdatedEpisode,
	6: optional i64 TotalEpisode,
}

struct MixStatusStruct {
	1: required i32 Status,
	2: optional i32 IsCollected,
}

struct ChargeStrategyStruct {
	1: optional i32 IsCharge, // 0：非付费短剧/合集 1：付费短剧/合集，已发布付费视频  2：付费短剧/合集，尚未发布付费视频
	2: optional double TotalPrice, // 整部购买折扣后总价格，为0时，代表用户已购买，非0时为整部折扣后购买价格
	3: optional bool SupportSegmentUnlock, // 是否支持梯度解锁
	4: optional i32 UnitPrice,  // 合集下单集视频的付费价格
	5: optional i32 DiscountThreshold, // 购买集数大于当前阈值时，进行折扣优惠
	6: optional i32 HasPaidEpisodes, // 用户已购买集数
	7: optional double MinimumDiscount, // 最低折扣
	8: optional i32 UnlockCount, // 整部剩余未解锁集数
	9: optional string Extra, // 附加信息
	10: optional i64 PromiseUpdateTime, // 承诺更新时间
}

struct MixStruct {
	1: required i64 Id,
	2: required string Name,
	3: optional UrlStruct CoverUrl,
	4: optional UrlStruct IconUrl,
	5: optional MixStatusStruct Status,
	6: optional MixStatisStruct Statis,
	7: optional string Desc,
	//废弃不用
	8: optional UserStruct Author,
	9: optional string Extra,
	10: optional i64 UserId,
	11: optional i32 Type,
	12: optional i64 CreateTime,
	13: optional i64 UpdateTime,
	14: optional i64 WatchedItem,
    15: optional i64  WatchedEpisode,
    16: optional i32 IsSerialMix,
	17: optional i32 HasMoreRecommendMix,
	18: optional i32 MixPicType,
	19: optional i32 PicItemCount,
	20: optional i32 UnReadMixCount,
	21: optional i32 EnableAd,
	22: optional i64 WatchedTime, //观看历史时间
    23: optional ChargeStrategyStruct ChargeStrategy,
	24: optional MixChargeStruct ChargeInfo, // 基建新付费信息
	25: optional EntertainmentProductStruct ProductInfo, // 文娱商品信息
	26: optional list<i32> DeletedIndex, // 付费合集中已删除的位置 
	27: optional i32 IsIAA, // 是否是激励广告内容（根据appID和配置决定的）
	28: optional list<i64> PaidEpisodes; // 用户已经付费或者有权益的集(包含限免的和解锁购买的)
}

struct MixOtherStruct {
	1: optional map<i64,i32> EpisodeMap,
	2: optional AutoMixAuthorStruct AutoMixAuthor,
	3: optional list<i64> MixItemIDs,
	4: optional map<i32,double> EpisodeToMinimumDiscount, // 付费集对应的后续解锁最低折扣
	5: optional map<i32,i32> EpisodeToUnlockCount // 当前集开始的未解锁集数
}

struct AutoMixAuthorStruct {
	1: required string title,
	2: required string schema_url,
}

struct ShopServiceStruct {
	1: optional i32 BizId,
	2: optional i32 BizType,
}

struct UGCMappingSongStruct {
	1: required i64 SongID,
	2: required string Title,
	3: required string Author,
	4: optional list<i64> ClipIDs,
	5: optional string MixedTitle,
	6: optional string MixedAuthor,
	7: optional UrlStruct MediumCoverUrl,
}

struct DisplayMappingSongStruct {
	1: optional i64 SongID,
	2: optional string Title,
}

struct MappingSongStruct {
	1: required i64 SongID,
	2: optional string Title,
	3: optional string Author,
	4: optional i32 FullDuration,
	5: optional UrlStruct MediumCoverUrl,
	6: optional string h5_url,
	7: optional list<MusicExternalStruct> ExternalInfos,
	8: optional string sourceId,
	9: optional string DspName,
	10: optional map<i64,enum_type.AudioTypeEnum> ClipIDs,
	11: optional DetailStatusInfo detailStatusInfo,
	12: optional i64 GroupID,
	13: optional i64 ClipID,
	14: optional list<MusicArtistStruct> ArtistInfos,
	15: optional ChorusStruct ChorusInfo,
	// 全曲Clip，优先获取ClipID，否则从ClipIDs中取全曲
	16: optional i64 FullClipID,
	// DSP 3.0新增的版权字段
	17: optional PaymentSetting PaymentSetting,
	18: optional bool WithLunaStream, // 拥有露娜流媒体版权
	19: optional list<ChorusStructV3> ChorusV3Infos,
}

struct DetailStatusInfo {
	// Song status in short video scene
	4: optional enum_type.ShortVideoDetailStatusEnum ShortVideoSceneStatus,
	// Song status in interactive music streaming scene
	12: optional enum_type.InteractiveMusicStreamingDetailStatusEnum InteractiveMusicStreamingSceneStatus,
}

struct StoryItemStruct {
	1: required i64 Id,
	2: required bool Unread,
	3: required i64 CreateTime,
}

struct ItemOffset {
	1: required i64 ItemId,
	2: required i32 Offset,
	3: optional i32 PicCount,
}

struct StoryStruct {
	1: required i32 Total,
	2: required string FolderId,
	3: required i32 Offset,
	4: required list<StoryItemStruct> Ordered,
	5: required i64 MinCursor,
	6: required i64 MaxCursor,
	7: required i64 HeadCursor,
	8: required i64 TailCursor,
	9: optional bool NeedNormal,
	10: optional i64 InsertId,
	11: optional i32 TTL,
	12: optional i64 InsertCreateTime,
	13: optional list<ItemOffset> ItemOffsets,
}

// copied from pb builder
// 关注关系相关 userStruct
// 使用场景1: xxx 等若干人也关注了 Ta 中的 xxx 用户列表
// 使用场景2: feed 的关注关系标签
struct RelativeUserStruct {
	1: optional i64 Uid,
	2: optional UrlStruct Avatar,
	// 下面字段 feed 的关注关系标签使用
	3: optional string Nickname,
	4: optional string RemarkName,
	5: optional UrlStruct AvatarLarger,
	6: optional UrlStruct AvatarThumb,
	7: optional enum_type.FollowStatusEnum FollowStatus,
	8: optional string SecUid,
}

// feed中打包快闪店信息时需要一个空的challenge struct
struct EmptyChallengeStruct {
}

struct SmartPhoneSettingsStruct {
	1: optional string PhoneNumber,
	2: optional string PhoneId,
	3: optional string EncryptKey,
}

// 从AwemeStruct中拷贝过来的，主要是快闪店信息
struct UserCommerceInfoStruct {
	1: optional UrlStruct HeadImageUrl,
	2: optional list<OfflineInfoStruct> OfflineInfoList,
	3: optional list<EmptyChallengeStruct> ChallengeList,
	4: optional SmartPhoneSettingsStruct SmartPhone,
	5: optional string QuickShopUrl,
	6: optional string QuickShopName,
	7: optional string SiteId,
}

// 主 feed 关注关系标签
struct FeedRelationLabelStruct {
	1: optional list<RelativeUserStruct> UserList,
	// 场景  0-你的关注 1- xxx转发 2-点赞列表 3-转发new 4-新的带头像的评论
	2: optional enum_type.RelationLabelTypeEnum LabelType,
	// 相关信息，json格式，预留
	3: optional string Extra,
}

// topview信息
struct CNYStruct {
	1: optional i64 StartTime,
	2: optional i64 EndTime,
	3: optional bool TopviewValid,
	4: optional i32 FeedShowTime,
	5: optional string LiveInfo,
}

// copied from go platform
struct FeedBannerTip {
	1: optional enum_type.FeedBannerType BannerType,
	2: optional string BannerTxt,
	3: optional i32 LinkType,
	4: optional string LinkUrl,
	5: optional string LinkTxt,
}

// copied from go platform
struct UserProfileInitStruct {
	1: optional double HeadModelScore,
}

// 预加载信息
struct PreloadStruct {
	1: optional i32 Comment,
	2: optional i32 Profile,
	3: optional double CommentPro,
	4: optional double ProfilePro,
	5: optional double CommentThres,
	7: optional double ProfileThres,
	8: optional double CommentMedianTime,
	9: optional double ProfileMedianTime,
	10: optional i32 ModelV2,
}

// 用于打包之前在feed platform 中的信息
struct FeedOtherStruct {
	1: optional bool IsHorizontal,
	2: optional UserProfileInitStruct UserProfileInitInfo,
	3: optional CNYStruct CNYInfo,
	4: optional FeedBannerTip BannerTip,
	5: optional bool EnableTopview,
	6: optional PreloadStruct Preload,
	7: optional string RawAdData,
	8: optional RapidRedPacketStruct RapidRedPacket,
	9: optional AwemeLiteStruct LiteInfo,
	// 是否是强插视频
	10: optional bool IsForcePlaced,
	// 视频强插跳转直播间
	11: optional string LibfinsertTaskId,
	// pitaya param for item
	12: optional string ItemPitayaParam,
	// 视频相关推荐
	13: optional RelatedRecom RelatedRecom,
	// 保量强插ID
	14: optional string BoostHistoryId,
	// 防沉迷相关信息回传
	15: optional string AddicInfo,
	// 透传字段
	16: optional string ExtraInfo,
	17: optional i32 ExternalVideoType,
	18: optional string ToClientInfo,
	19: optional AddicStructV2 AddicData,
    20: optional i32 HasRelatedRec,
}

struct AddicStructV2 {
	1: optional string Info,
}

struct RelatedRecom {
	// 是否出低bar
	1: optional bool RelatedBar,
	// 是否弹出，0:不弹出，1：弹出。
	2: optional i32 BarEject,
	// 标题文案
	3: optional string RelatedText,
	// json字符串，透传信息
	4: optional string RelatedInfo,
}

struct OfflineInfoStruct {
	1: optional enum_type.OfflineInfoType OfflineInfoType,
	2: optional string Text,
	3: optional string Action,
}

struct NearbyCircleStruct {
	//同城圈id
	1: optional i64 NearbyCircleId,
	//是否优先同城分发
	2: optional i32 DistributedInNearbyFeed,
	// 同城圈用户id
	3: optional list<i64> UserIds,
	// 同城圈名称
	4: optional string NearbyTitle,
	// 同城圈文案
	5: optional string NearbyCopywriter,
	6: optional list<RelativeUserStruct> UserList,
}

struct CircleStruct {
	//同城圈id
	1: optional i64 Id,
	// 同城圈名称
	2: optional string Title,
	// 加入状态
	3: optional i32 UserRole,
    // 底bar 文案
	4: optional string BarText,
    // common schema
	5: optional string CommonSchema,
    // schema type
	6: optional string SchemaType,
}

struct HotCommentStruct {
    // 热评论的id
    1: optional string Cid,
    // 热评的文本
    2: optional string Text,
    // 点赞的数目
    3: optional i32 DiggCount,
}

struct PoiFootprintStruct {
	// title
	1: optional string Title,
	// 跳转
	2: optional string Schema,
}

struct SocialTagStruct {
	1: optional string Title,
	// 样式图片
	2: optional UrlStruct ImageUrl,
	3: optional string Schema,
	4: optional string MobLabel,
	5: optional i32 Type,
}

struct ContentWithIconStruct {
	// 下发的文案
	1: optional string Content,
	// 图片或其他数据的填充位置
	2: optional list<IconWithIndexStruct> IconWithIndex,
}

struct IconWithIndexStruct {
	// 如果文案是ABC，icon用#,&表示，0表示#ABC，多个0则顺序展示：#&ABC，1表示A#BC，3表示ABC#
	1: optional i32 Index,
	2: optional UrlStruct Icon,
}

struct TCVideoRedPacketStruct {
	1: optional string Url,
	2: optional string RedPacketId,
	3: optional string OrderId,
	4: optional string FirstShowTime,
	5: optional i32 RedPacketType,
	6: optional string CouponId,
	7: optional i32 Scope,
	8: optional bool IsVisible,
}

// copied from feed platform,极速版红包
struct RapidPopWindowStruct {
	1: optional string AmountType,
	2: optional i32 Amount,
	3: optional string TopText,
	4: optional string MiddleText,
	5: optional string BottomText,
	6: optional string ButtonText,
	7: optional string Schema,
}

// 极速版红包视频的配置信息
struct RedPackShowInfoStruct {
	// 红包展现形式(0:挂件, 1:按钮)
	1: optional enum_type.RedPackShowType RedPackShowType,
	// 红包是否已经开启，true已领取，false未领取
	2: optional bool RedPackDone,
	// 红包开启前的文案
	3: optional string ButtonTextBefore,
	// 红包开启后的文案
	4: optional string ButtonTextAfter,
}

// btn
struct AwemeLiteButtonStruct {
  1: optional string Title,        // 文案
  2: optional string Schema,       // schema
  3: optional string RewardNum,    // 金币数量文案
  4: optional i32    PlayTime,     // 播放时间，-1 代表结束展示， 其他代表N秒展示
}

// 抖极金币赞
struct AwemeLiteInteractionStruct {
    1: optional enum_type.AwemeLiteInteractionEntranceType InteractionEntranceType, // 入口
    2: optional enum_type.AwemeLiteInteractionTabType InteractionTabType, // tab
    3: optional i64 DiggNum,
    4: optional bool UserDigged,
    5: optional string ItemToken,
	6: optional i64 UserDiggNum,
	7: optional i64 UserDiggAmount,
	8: optional i64 OnceDiggAmount,
	9: optional enum_type.AwemeLiteInteractionGiftType GiftType, // 金币赞类型
}

// 抖极视频裂变
struct AwemeLiteFeedFissionStruct {
  1: optional string InviteToken; // 分享助力token;
}

// 极速版特有的字段
struct AwemeLiteStruct {
	//  1表示是红包视频，0或者无此字段表示不是红包视频
	1: optional i32 IsLiteRedPackItem,
	// true表示可以完成分享私信任务，false表示不可完成分享私信任务
	2: optional bool CanDoneSharePrivateChatTask,
	// 是否可以送金币
    3: optional bool CanDoneLiteVideoInteraction,
    // 是否为互动视频（展现tab）
    4: optional bool IsLiteVideoInteractionItem,
    // Deprecated，use TaskToken
    5: optional map<i64,string> TaskTokenMap,
    // 任务的token信息
    6: optional string TaskToken,
	// 红包视频的展现配置信息，包括展现形式、文案、红包是否开启等信息
	// Deprecated, plz use RedPackUserStatus
	7: optional RedPackShowInfoStruct RedPackShowInfo,
	// 用户的红包状态领取信息
	8: optional enum_type.RedPackUserStatusType RedPackUserStatus,
	// feed button
	9: optional AwemeLiteButtonStruct Button,
	// 是否展现金币tab 社交、投稿共用
    10: optional bool ShowCoinTab,
    // 点击金币tab的来源，默认是社交送金币场景
    11: optional string CoinTabSource,
    // 社交相关的实验信息
    12: optional string SocialLibraInfo,
    // 是否有社交送金币的面板功能
    13: optional bool HasInteractionGiftTab,
    // 是否展现社交送金币的面板
    14: optional bool ShowInteractionGiftTab,
	// 投稿音乐拍同款路径教育
	15: optional AwemeLiteButtonStruct MusicCoverButton,
	// 金币赞信息
	16: optional AwemeLiteInteractionStruct AwemeLiteInteractionInfo,
	// 是否是命中激励评论实验A后发布的作品
	17: optional i32 IsLiteCommentInspireA,
	18: optional AwemeLiteFeedFissionStruct FeedFissionInfo,
	// 是否新道具挑战任务
	19: optional bool IsNewChallengeTask,
}

// copied from feed platfrom, 极速版
struct RapidRedPacketStruct {
	1: optional bool TopRedPacket,
	2: optional i32 AlertRedPacketSecond,
	3: optional bool RedPacketGuide,
	4: optional bool WelfareGuide,
	5: optional RapidPopWindowStruct WelfareGuideInfo,
	6: optional i32 VideoType,
	7: optional string PopUpSource,
}

struct JumpConfirmParam {
    1: optional string Title, // 弹窗标题文案
    2: optional string SubTitle, // 弹窗副标题文案 - 长视频有
    3: optional string CheckBoxTitle, // 确认勾选框的文案
    4: optional string StayButtonTitle, // 内流消费按钮文案
    5: optional string JumpButtonTitle, // 跨端按钮文案
    6: optional i64 EnableReplayCount, // 展现次数，当前实验，如果命中实验返回1；如果不命中返回0
    7: optional i64 ShowFrequentDay, // 展现时间间隔 - 天数
    8: optional UrlStruct VideoPicture, // 中视频跨端封面图 - 中视频
    9: optional UrlStruct GroundPicture, // 跨端封面兜底图片 - 长视频有
}

struct XiguaRelatedBarStruct {
	1: required string Id,
	2: required string Title,
	3: required string OpenUrl,
	4: optional UrlStruct Icon,
	5: optional i32 Type,
	6: optional string OpenAppSchema,
	7: optional string RightDesc,
	8: optional string JumpConfirmTitle,
	9: optional i64 GroupId,
	10: optional i64 UserId,
	11: optional i64 DyGroupId,
	12: optional i64 DyUserId,
	13: optional string VideoType,
	// 跨端弹窗样式内容参数
    14: optional JumpConfirmParam JumpConfirmParam,
}

struct AncestorInfoStruct {
	1: required i32 ProductId,
	2: optional i64 Gid,
	3: optional i64 Uid,
}

struct LocalExposureStruct {
	// 本地曝光优化-蒙层
	1: optional LocalExposureMaskStruct mask,
	// 本地曝光优化-底部通用浮条
	2: optional LocalExposureFloatingBarStruct bar,
}

struct LocalExposureMaskStruct {
	// 同城曝光文本
	1: optional string normal_style_text,
	// 图标
	2: optional UrlStruct normal_style_text_icon,
	// 同城曝光文本
	3: optional string new_style_text,
	// 图标
	4: optional UrlStruct new_style_text_icon,
	// 曝光类型
	5: optional i32 type,
	// 曝光量
	6: optional i32 count,
}

struct NameValuePair {
  1: optional string name, // 字段名
  2: optional string value, // 字段值
}

struct LocalExposureFloatingBarStruct {
	// 图标
	1: optional UrlStruct icon,
	// 文本
	2: optional string text,
	// 曝光类型
	3: optional i32 type,
	// 跳转链接
	4: optional string schema,
	// 曝光量
	5: optional i32 count,
	// 是否跳转热力图
	6: optional bool hotMap,
	// 视频同城L2曝光pv
	7: optional i64 pvCnt,
	// 视频经度
	8: optional double latitude,
	// 视频纬度
	9: optional double longitude,
	//底Bar唯一id(code)
	10: optional string unique_code,
	// 打点字段合集
    11: optional list<NameValuePair> report_values,
}

struct FamiliarActivityStruct {
	1: optional string ActivityId,
	2: optional bool ShowActivityBtn,
	3: optional string SchemaUrl,
	4: optional string FollowText,
	5: optional string FollowedText,
	6: optional i64 EndTime,
}

//关注列表中二级文案展示所需状态字段
struct UserInfoInFollowingListStruct {
	1: optional i32 SecondaryInformationPriority,
	2: optional string SecondaryInformationText,
	3: optional i32 SecondaryInformationTextType,
	4: optional string SecondaryInformationEcomLabelType,   // 店铺、橱窗入口埋点
	5: optional SecondaryInformationLabelStyleStruct SecondaryInformationLabelStyle,
	6: optional list<i64> NotSeenItemIDList, // 未看视频列表
	7: optional string SecondaryInformationTrackInfo, // 埋点信息
	8: optional i32 SecondaryInformationRecallDay //未看视频召回时间
}

struct SecondaryInformationLabelStyleStruct {
    1: optional i64 LabelCornerStyle
}

// 粉丝列表中二级文案展示所需状态字段
struct UserInfoInFollowerListStruct {
	1: optional i32 SecondaryInformationEnum,       // 标签枚举类
	2: optional string SecondaryInformationText,    // 标签文本
	3: optional string SecondaryInformationTracking,   // 标签埋点字段
}

struct EffectGuideStruct {
	1: optional bool ShowGuide,
	2: optional UrlStruct Icon,
	3: optional string EffectId,
	4: optional string EffectName,
}

// 调研视频的调研问题信息
struct QuestionnaireStruct {
	// feelgood平台问题标识id
	1: optional string TaskId,
	// 问题是否过期
	2: optional bool IsExpired,
	// feelgood平台问题配置信息
	3: optional string TaskSetting,
	// 代表当前视频是否进行问卷弹窗
	4: optional bool IsPopped,
	// lynx schema
	5: optional string Schema,
	// 前端需要的数据
	6: optional string FeData,
	// 问卷版本号
	7: optional string Version,
	// 问卷样式
	8: optional i32 Style,
	// 额外信息
	9: optional string Extra,
    // 背景地址
    10: optional string BackgroundUrl,
    //弹窗问卷时机进度最小值
    11: optional i32 PopUpMinProgress,
    //问卷弹出时机进度最大值
    12: optional i32 PopUpMaxProgress,
}

struct RewardStatisticsStruct {
	// 奖励类型
	1: optional enum_type.RewardTypeEnum type,
	// 奖励发放状态
	2: optional enum_type.RewardStatusEnum status,
	// 奖励进度文案
	3: optional string result,
	4: optional UrlStruct icon,
	5: optional string schema,
	6: optional string task_type,
}

// 视频保量信息
struct BoostInfoStruct {
	// 保量状态
	1: optional enum_type.BoostStatusEnum Status,
	// 保量完成额度
	2: optional i32 BoostCount,
	// 保量完成时间
	3: optional i64 FinishTime,
	// 保量进度文案
	4: optional string Result,
	// 保量展示图标
	5: optional UrlStruct Icon,
	// 保量跳转schema
	6: optional string Schema,
}

// 用于描述在抖音侧多个微服务之间传递 abparam 数据 from=https://code.byted.org/cpputil/service_rpc_idl/blob/master/iesarch/abtest/ies.arch.abtest.thrift?from=from_parent_mindnote
struct AbParamStruct {
	1: required enum_type.AbVersion AbVer,
	// 强烈不建议使用的参数
// 只是为了兼容可能存在的业务正好使用了 vid 并且还接入 SDK 的服务；
// 在 SDK 内部会通过一些监控手段做到耕细粒度的监控；
	2: optional string VersionNames,
	3: optional string ClientVersionNames,
	4: optional string Parameters,
	5: optional string ClientParameters,
	6: optional map<string,binary> NsParameters,
	7: optional map<string,binary> NsClientParameters,
	// 过渡期参数；
// 用来解决 old abparam 大多数情况必然被 unmarshal 的性能问题
	8: optional map<string,binary> TranParameters,
	9: optional map<string,binary> TranClientParameters,
	// 内部保留字段，业务伙伴请勿使用；
// 用于向未来拓展更多可能的优化方案，包括但不限于：透传 request 和 vidList 等信息；
	254: optional binary RequestData,
	// 保留字，SDK 会以 const 的模式约束这个值的具体含义
// 在满足兼容性和上下一致性的同时，可以表达 63 种状态值
	255: optional i64 ReservedWord,
}

struct SeriesStatisStruct {
	1: optional i64 PlayVV,
	2: optional i64 CollectVV,
	3: optional i64 CurrentEpisode,
	4: optional i64 UpdatedToEpisode,
	5: optional i64 TotalEpisode,
	6: optional i64 LastAddedItemTime,
}

struct SeriesStatusStruct {
	1: required i32 Status,
	2: optional i32 IsCollected,
	// 合集更新状态描述，新剧、更新集数、已完结等
	3: optional string StatusDesc,
}

struct SeriesOtherStruct {
	1: optional map<i64,i32> EpisodeMap,
	2: optional AutoSeriesAuthorStruct AutoSeriesAuthor,
	3: optional map<i32,double> EpisodeToMinimumDiscount
	4: optional map<i32,i32> EpisodeToUnlockCount // 当前集开始的未解锁集数
}

struct AutoSeriesAuthorStruct {
	1: optional string title,
	2: optional string schema_url,
}

struct DogCardInfoStruct {
	1: optional string dog_card_text,
	2: optional i32 rank,
	// hot表示最热，new表示最新
	3: optional string rank_type,
	4: optional string rank_schema,
}

struct SeriesPlayerStruct {
	1: optional string Name,
	2: optional i64 UserId,
}

struct SeriesContentStruct {
	1: required i32 SeriesContentType,
	2: optional string Name,
}

struct AdSettingInfo {
    1: optional list<i32> MidAdsIndex, // 可进行非阻断性中插广告位置列表，10：表示第10集之后，11集之前
    2: optional list<i32> RewardedAdsIndex, // 需要激励广告解锁位置， 10: 第10集内容需要用户以激励广告形式解锁
	3: optional string BizExtra; // json字符串，服务端聚合的一些业务数据，透传给算法包进行中插广告的策略迭代
}

struct SeriesStruct {
	1: required i64 Id,
	2: required string Name,
	3: optional UrlStruct CoverUrl,
	4: optional UrlStruct IconUrl,
	5: optional SeriesStatusStruct Status,
	6: optional SeriesStatisStruct Statis,
	7: optional string Desc,
	8: optional string Extra,
	9: optional i64 UserId,
	10: optional i32 Type,
	11: optional i64 CreateTime,
	12: optional i64 UpdateTime,
	13: optional bool IsExclusive,
	14: optional i64 RelatedId,
	// 短剧内容额理性
	15: optional i32 ContentType,
	//狗牌图片的URL
	16: optional DogCardInfoStruct DogCard,
	17: optional list<SeriesContentStruct> SeriesContentTypes,
	//导演
	18: optional list<SeriesPlayerStruct> Directors,
	// 演员
	19: optional list<SeriesPlayerStruct> Actors,
	20: optional UrlStruct AlbumCoverUrl,
	21: optional i64 WatchedEpisode,
	22: optional i64 WatchedItem,
	//短剧付费规则
	23: optional i32 SeriesChargeType,
	//付费短剧整部购买优惠价格
	24: optional i64 SeriesPrice,
	// 0:非付费短剧  1:付费短剧
	25: optional i32 IsChargeSeries,
    26: optional list<i32> RecommendColor,
    27: optional i64 WatchedTime, //观看历史时间
    28: optional UrlStruct HorizontalCoverUrl, // 短剧pad横版封面
	29: optional ChargeStrategyStruct ChargeStrategy, // 短剧新付费策略结构
	30: optional MixChargeStruct ChargeInfo, // 基建新付费信息
	31: optional EntertainmentProductStruct ProductInfo, // 文娱商品信息
	32: optional list<i32> DeletedIndex, // 付费合集中已删除的位置 
	33: optional i32 IsIAA, // 是否是激励广告内容（根据appID和配置决定的）
	34: optional  SeriesIcpStruct SeriesIcp, // icp相关信息
	35: optional  EntVIPDataStruct EntVIPData, // 会员信息
	36: optional  string CoverLabel, // 短剧左上角封面标签
	37: optional  EntPreAccessDataStruct PreAccessData, // 抢先看信息
    38: optional  string LogExtra, // 文娱埋点信息
	39: optional  SeriesUIConfig SeriesUIConfig, // 短剧UI信息
	40: optional list<enum_type.SeriesPaidTypeEnum> SeriesPaidTypeList, // 短剧当前变现方式列表
	41: optional AdSettingInfo AdSettingInfo, // 短剧内流广告混排策略信息
	42: optional list<i64> PaidEpisodes; // 用户已经付费或者有权益的集(包含限免的和解锁购买的)
}
struct SeriesIcpPosStruct {
    1:optional i32 XPos, // 像素px
    2:optional i32 YPos,
}
struct SeriesIcpStruct {
    1: optional SeriesIcpPosStruct HorizonalPos 
    2: optional SeriesIcpPosStruct VerticalPos 
    3: optional string FontColor // 字体颜色 0xaaaaaa 
    4: optional i32 FontSize // 字号 
    5: optional i32 StartTimeSec // 出现时间
    6: optional i32 DisappearTimeSec // 退场时间
	7: optional string IcpNumber // icp备案号
	8: optional SeriesIcpPosStruct CardPos // 搜索小卡
	9: optional string IcpNumberSplit // 换行备案号
	10: optional i32 CardFontSize // 小卡字号
}

struct GrootBottomBarStruct {
	1: optional i64 SpeciesId,
	2: optional UrlStruct IconUrl,
	3: optional string Description,
	4: optional string Schema,
	5: optional string SpeciesName,
}

struct RecommendTemplateStruct {
	1: optional enum_type.RecommendTemplateEnum template_id,
	// 推荐理由模版 ex: 有%s,%s等2个通讯录好友
	2: optional string template,
	// 用户id加密后的key
	3: optional list<string> value_list,
}

struct ToolBarStruct {
	// 被跟拍数
	1: optional i64 followed_count,
	// 被跟拍文案
	2: optional string followed_shot_info,
	// 跟拍详情页schema
	3: optional string followed_shot_schema,
}

struct FeedDiversitySurveyStruct {
	1: required string LynxSchema,
	2: required string RawData,
	3: optional i32 StyleType,
}

struct FeedEventCardInfoStruct {
	1: optional string SettingKey,
	2: optional string Schema,
	3: optional string FeData,
	4: optional string ClientData,
	5: optional string Extra,
}

struct LightWeightSurveyStruct {
	1: optional string SettingKey,
	2: optional string Schema,
	3: optional string FeData,
	4: optional string ClientData,
	5: optional string Extra,
}

struct UniversalFeedPopSurveyStruct {
	1: optional string SettingKey,
	2: optional string Schema,
	3: optional string FeData,
	4: optional string Extra,
    5: optional i32 PopUpMinProgress,
    6: optional i32 PopUpMaxProgress,
}

struct EcoSystemSurveyStruct {
    1: optional string InsertTagList, // list<int32> 的json化
    2: optional string SatiScore,     // map<string, double> 的json化
	3: optional string Extra,
}

struct NearbyTabBubbleStruct {
	// 同城tab下发气泡的文案
	1: optional string NearbyTabBubbleText,
	// 同城承接气泡需要透传的信息
	2: optional string NearbyTabBubbleMessage,
	// 透传给/nearby/settings的信息
	3: optional string NearbyDiamondMessage,
	// 气泡类型
	4: optional NearbyTabBubbleType NearbyTabBubbleType,
	// 气泡展示触发条件, 长度为2的数组: [x, y], 累计第x个视频观看y秒展示
	5: optional list<i32> LifeBubbleCondition,
    // 6 保留，对应client pb的结构中已经使用。保持对齐
    // 用于气泡埋点相关数据扩展
    7: optional string nearby_tab_bubble_mob_extra,
    // 用于埋点对比上报
    8: optional string bubble_after_search_mob,
    // 气泡触发时机（单item维度）
    9: optional string NearbyTabBubbleMoment
    // 开始时间，秒
    10: optional i64 StartTime
    // 结束时间，秒
    11: optional i64 EndTime
    // 节假日/周末气泡期间的频率
    12: optional i32 Frequency
    // 节假日/周末气泡每天的频率
    13: optional i32 DayFrequency
    // 节假日/周末名称
    14: optional string FestivalName
    // 拓展字段
    15: optional string Extra
    // 气泡属性，0普通气泡，1节假日气泡，2周末气泡
    16: optional i32 BubbleAttribute
	17: optional i32 Style  // 气泡样式 参考DSL
	18: optional UrlStruct BubbleImgUrl // 气泡图片(图文气泡使用)
	19: optional i32 BubbleImgType // 气泡图片样式(图文气泡使用) 0： 矩形样式 24*24 圆角4 1： 圆形样式  24*24  圆角12
	20: optional UrlStruct BubbleIconUrl // icon 气泡 icon URL 暗色模式
	21: optional i32 DotStyle // 红点style
	22: optional string DotText  // 红点文字、数字
	23: optional string GuideDsl // 气泡&红点DSL
}

struct NearbyVideoAttributeStruct {
	// 是否生服视频
	1: optional i32 IsLocalLifeVideo,
	// 同城承接气泡需要透传的信息
	2: optional i32 HasSpuService,
	// 透传给/nearby/settings的信息
	3: optional string Snackbar,
	// 是否泛生服视频
    4: optional i32 IsLocalLifeExtVideo,
    // 卡片点击跳转格式 0:内流； 1：详情页
    5: optional i32 OpenType,
    // 跳转schema，预留拓展字段
    6: optional string OpenTypeSchema,
}

enum NearbyTabBubbleType {
    // 同城气泡
    Nearby = 0
    // 生活服务气泡
    Life = 1
    // 2 保留， client有使用此枚举。
    // 搜索同城气泡
    SearchNearByBubble = 3
    // 节假日气泡
    FestivalBubble = 5
    // 周末气泡
    WeekendBubble = 6
}

struct SuggestOneWord {
	1: optional string Word,
	2: optional string WordId,
	3: optional string Info,
	// 词透传信息 点击出词透传给下游(搜索服务端)的信息
	4: optional string PenetrateInfo
}

struct SuggestWord {
	// 推荐词列表
	1: optional list<SuggestOneWord> Words,
	// 推荐词的场景，如底bar出词、评论区顶部出词等
	2: optional string Scene,
	// 推荐词前面的icon
	3: optional string IconURL,
	// 推荐词前面的提示文案，例如”搜索“
	4: optional string HintText,
	// 额外的信息，json的字符串
	5: optional string ExtraInfo,
}

struct SuggestWords {
	1: optional list<SuggestWord> SuggestWords,
}

struct VSearchTagStruct {
    // videotag生效标识
	1: optional bool VTagEnable,
	// videotag延迟获取timestamp
	2: optional i32 VTagDelayTs,
	// videotag默认tag, 生效标识
	3: optional bool DefaultVtagEnable,
	// videotag默认tag数据
	4: optional string DefaultVtagData,
}

struct GuideBtnStruct {
	1: optional string Config,
	2: optional list<BtnPropertyStruct> Buttons,
}

struct BtnPropertyStruct {
	1: optional string BtnText,
	2: optional string BtnSchema,
    3: optional i32 Status,
    4: optional string BtnIcon,
}

struct EnterpriseStruct {
	// 标签列表
	1: optional list<EnterpriseTagStruct> TagInfos,
	// 预览页的提示
	2: optional EnterpriseToastStruct ToastInfo,
	// 预览页引导按钮
	3: optional EnterpriseButtonStruct ButtonInfo,
}

struct EnterpriseTagStruct {
	// 标签类型
	1: required i32 Type,
	// 提示文案
	2: required string Text,
	// 埋点数据
	3: optional string EventData,
}

struct EnterpriseToastStruct {
	// 提示类型
	1: required i32 Type,
	// 位置
	2: required i32 Position,
	// 提示文案
	3: required string Text,
	// 跳转链接
	4: required string JumpUrl,
	// 是否需要Tag标签信息. 如果为true, 则展示EnterpriseInfo的TagInfo标签信息
	5: required bool NeedTagInfo,
	// 提示文案-颜色
	6: optional string TextColor,
	// 跳转链接文案
	7: optional string JumpText,
	// 跳转链接文案-颜色
	8: optional string JumpTextColor,
}

struct EnterpriseButtonStruct {
	// 行动按钮文案
	1: optional string ActionText,
	// 行动按钮链接
	2: optional string ActionLink,
	// 取消按钮文案
	3: optional string CancelText,
	// 取消后弹出文案
	4: optional string CancelToast,
	// 埋点数据
	5: optional string EventData,
	// 每天最多展示次数
	6: optional i64 TimesPerDay,
	// 频控小时数
	7: optional i64 ShowBlockHours,
	// 取消后屏蔽小时数
	8: optional i64 CancelBlockHours,
}

struct MusicPermissionStruct {
	// 拥有分享入口
	1: optional bool ShareEnable,
	// 分享到日常
	2: optional bool StoryEnable,
	// 能否使用Dsp播放
	3: optional bool DspPlay,
	// 能否添加到歌单
	4: optional bool PlaylistAvailable,
	// 是否能被收藏: 目前仅对于试听歌曲不可收藏
	5: optional bool CollectAvailable,
	// 是否能被下载: 依靠用户类型和版权总和来判断
	6: optional bool DownloadAvailable,
}

struct CommentPermissionInfo {
	// 评论权限 0 所有人 1 仅粉丝 2 仅互关朋友 3 仅自己
	1: required i32 CommentPermissionStatus,
	// 用户是否可以评论
	2: required bool CanComment,
	// 视频详情页入口
	3: required bool ItemDetailEntry,
	// 长按入口
	4: required bool PressEntry,
	// 引导
	5: required bool ToastGuide,
}

struct HSVStruct {
	1: required double Hue,
	2: required double Saturation,
	3: required double Value,
}

//通用bar标识
struct StandardBarInfoStruct {
	//各业务下的实体标识
	1: required string Id,
	//标题头
	2: required string Title,
	//标题内容
	3: required string Text,
	//业务场景，需申请
	4: required i32 BizScene,
	//业务线标识
	5: required i32 AppId,
	//业务线下对应数据类型。-- 通过AppId，RelationType,id可以标识不同业务方下唯一一条数据,各业务方自己定义即可
	6: required i32 RelationType,
	//关联抖音视频的id
	7: required i64 ItemId,
	//通用bar的标识 1：抖音底bar
	8: required i32 StandardBarId,
	//弃用
	9: optional UrlStruct IconUri,
	//小程序的跳转链接
	10: optional string AppletSchema,
	//唤起app时的确认文案
	11: optional string JumpConfirmTitle,
	//直接拉起app的schema
	12: optional string AppSchema,
	//其他需要透传的附属信息json
	13: optional string Extra,
	//展位bar的Icon的
	14: optional UrlStruct IconUrl,
}

struct JumpTabInfoStruct {
    1: required string Id, //各自业务方关联的实体id
    2: required string Title, //标题头
    3: required string  Text, //标题内容
    4: required i32  BizScene, //业务场景
    5: required i32 StrategyValue, // 策略
    6: required i32 StyleValue, //样式
    7: optional UrlStruct IconUrl, //的Icon的url
    8: optional string AppletSchema,//跳转链接
    9: optional string JumpConfirmTitle,//唤起app时的确认文案
    10: optional string AppSchema,//
    11: optional list<i64> InsertAwemeIds,//关联的抖音的视频id
    12: optional string SortExtra, //其他需要透传给推荐的附属信息json
    13: optional string ClientExtra, //客户端需要用的一些参数，埋点数据等

}
struct SeriesItemLimitFree {
    1: required i64 StartTime = 1, // 限免策略开始时间，开区间
    2: required i64 EndTime = 2, // 限免策略结束时间，闭区间
}

struct SeriesItemPaidInfoStruct {
	//付费短剧视频付费状态 0:非付费视频 1:付费视频，用户未付费 2:付费视频，用户已付费
	1: required i32 SeriesPaidStatus,
	//付费短剧视频购买价格
	2: required i64 ItemPrice,
	3: optional SeriesItemLimitFree SeriesLimitFree,// 付费短剧视频限免策略 
}

struct ChorusStruct {
	1: required i64 StartMS,
	2: required i64 DurationMS,
}

struct ChorusStructV3 {
	1: required i64 StartMS,
	2: required i64 DurationMS,
	3: required double StartProb,
	4: required double EndProb,
	5: required double ChorusProb,
}

struct CategoryKTVInfo {
	1: optional i64 LinkmicKtvSongAuthorId,   // 视频底bar相关直播，短视频 BGM 歌手 id  https://bits.bytedance.net/?storyId=2883753&project=live&app=meego&tab=doing#detail
	2: optional i64 LinkmicKtvSongId,         // 视频底bar相关直播, 短视频 BGM song id https://bits.bytedance.net/?storyId=2883753&project=live&app=meego&tab=doing#detail
	3: optional string LinkmicKtvSongName,
}

struct RecommendCollect {
    1: optional i32 ExposeSeconds,
    2: optional string Text,
    3: optional UrlStruct IconUrl,
}

struct RelevantLive {
	1: optional i64             VideoRelevantCategory,    // 视频底bar相关直播分类 1-ktv 2-英语学习 https://bits.bytedance.net/?storyId=2883753&project=live&app=meego&tab=doing#detail
	2: optional string          Title,                    // 视频底bar相关直播，文案
	3: optional CategoryKTVInfo CategoryKTVInfo,
	4: optional string          Extra,
}

struct RelatedMusicAnchorStruct {
	// 类型
	1: optional string Type,
	// 跳转链接
	2: optional string SchemaUrl,
	// 图片链接
	3: optional UrlStruct ImageUrl,
	// 优先级, 10000
	4: optional i64 Priority,
	// 锚点extra信息
	5: optional string Extra,
}

struct VideoTagStruct {
    // 标签id
    1: required i64 TagId,
    // 标签名
    2: required string TagName,
    // 标签级别
    3: required i32 Level,
}

struct RelevantLinkmicWebcastStruct {
    1: optional i64 AppID,
    2: optional i64 RoomID,
    3: optional i64 TotalUser, // 召回的前三个直播间的看播总数 + 基准值
    4: optional WebcastUrlStruct BgUrlStruct, // 直播间背景uri
    5: optional i64 Scene, // 连麦业务场景
    6: optional string Extra, // 其他信息包括feed参数和房间内参数  {"feed_params": { "linkmic_ktv_song_author_id": 12345 // int64},"inroom_params": {"linkmic_ktv_song_id": 56789, // int64 "linkmic_ktv_song_name": "song_name"}}
    7: optional KtvSingerUserLiteStruct singer, // 当前演唱用户的简化的结构体
}

struct KtvSongLiteStuct {
    1: optional i64 Id,
    2: optional i64 AuthorId,
}

struct KtvSingerUserLiteStruct {
    1: optional i64 Id,
    2: optional string NickName,
    3: optional WebcastUrlStruct AvatarThumbUrlStruct,
    4: optional WebcastUrlStruct AvatarMediumUrlStruct,
    5: optional WebcastUrlStruct AvatarLargeUrlStruct,
}

struct WebcastUrlContent {
    1: optional string Name;
    2: optional string FontColor;
    3: optional i64 Level;
}

enum WebcastImageTypeEnum {
    Unknow = 0,            // 未知类型
    PayGrade = 1,          // 财富等级相关-荣誉等级或贵宾
    SpecialID = 2,         // 靓号
    Admin = 3,             // 房管
    Activity = 4,          // 活动勋章
    Brotherhood = 5,       // 兄弟团
    Noble = 6,             // 贵族
    Fansclub = 7,          // 粉丝团
    IntraCity = 8,         // 同城图片，e.g. 海淀区
    SellGoods = 9,         // 封面主状态-带货
    DrawSomething = 10,    // 封面主状态-你画我猜
    KTV = 11,              // 封面主状态-K歌
    AudioLinkMic = 12,     // 语音直播间上麦
    PK = 13,               // 封面主状态-PK
    AudioLive = 14,        // 封面主状态-语音直播
    ActivityTag = 15,      // 封面辅助状态-活动标签
    OfficialLive = 16,     // 封面辅助状态-官方直播
    OfficialChannel = 17,  // 封面辅助状态-麦序直播
    HotSentenceTop = 18,   // 封面辅助状态-热点榜
    HourlyRankTop = 19,    // 封面辅助状态-小时榜
    RedPackage = 20,       // 封面主状态-红包
    Friend=21,             // 封面关系状态-好友
    Following=22,          // 封面关系状态-关注
    OnlineAudienceTopN=23, // Top N Medal in Online Audience Ranking
    HourlyRegionRankTop=24,// Cover auxiliary status-regional list
    GameLabel=25,          // game tag
    GameBackgroundDefault=26,         // game background default
    GameBackgroundCustom=27,          // game background custom
    TCFamilyTag=28, // TC21 family tag
    AudioChatKTV=29,       // 封面主状态-聊天室KTV
    ShareVideo=30,         // 一起看
    FriendLinkMic=31,      // 好友连麦
    LuckyPacket=32,        // 封面主状态，福袋
    FriendLinkMicKTV=33,   // 朋友KTV
    AnchorFriend=34        // 主播朋友标签
    AnchorFans=35          // 主播粉丝标签
    AnchorLocalCity=36     // 主播同城标签
    Urged = 42,   // 促开播标签，eg: 在你激励下开播
    HourlyPopularityRankTop = 44, // 封面辅助状态-人气小时榜
    ExploreCard = 45,      // 兴趣探索标签
    VerifiedBlue = 46,     // 蓝V认证
    VerifiedYellow = 47,   // 黄V认证
    HourlyRankNewTop = 48, // 封面辅助状态-新人榜
    Living = 49,           // 直播中标签
}

struct WebcastUrlStruct {
    1: required string Uri,
    2: required list<string> UrlList,
    3: optional i64 Width,
    4: optional i64 Height,
    5: optional WebcastImageTypeEnum ImageType,
    6: optional string OpenSchema,
    7: optional WebcastUrlContent Content,
    8: optional bool IsAnimated,   // 是否是动图
    9: optional string LongPressPrompt, // 长按提示
}

struct ItemProductRelatedInfo {
    1: required i32 Type,
    2: required string RawData,
}

struct FeedComponentCtrlStruct {
    1: optional bool HideAnchor,   // 是否隐藏锚点
    2: optional bool HideMix,   // 是否隐藏合集Bar
    3: optional bool HideHotspot,   // 是否隐藏热点Bar
    4: optional bool HideToutiao,   // 是否隐藏头条相关阅读Bar
    5: optional bool HideXigua,   // 是否隐藏西瓜相关视频Bar
    6: optional bool HideVs,   // 是否隐藏VS show Bar
    7: optional bool HideSearch,   // 是否隐藏相关搜索Bar
    8: optional bool HideRelateRec,   // 是否隐藏相关视频推荐Bar
    9: optional bool HidePlaylist,  // 是否隐藏播单bar
	10: optional list<string> HideBtnList, //隐藏的btn list
	11: optional list<string> ShowBtnList, //隐藏的btn list
	12: optional bool UseCommonAnchor,// 使用模版锚点
}

struct EntraceInFollowingListSturct{
    1: optional string EntranceText,    // 进店(商家); 进橱窗(达人)
    2: optional string EntranceUrl,     // 跳转schema
    3: optional string entrance_type,   // 标签类型:life_curtain(生活服务达人橱窗);life_merchant(生活服务商家)
    4: optional string EntranceTrackInfo, // 埋点信息
    5: optional string EntranceUrlV2,   // 跳转schema的v2版本
}

struct FromNearbyTransExtraStruct {
    1: optional string ContentSpace,        // from视频带poi：点进来的三级品类,from视频不带poi：视频标签映射的一级品类
    2: optional i64 EnterInfluxSlideGid,    // bar绑定的视频id
    3: optional i32 BubbleType,             // content_space是三级品类（0）还是一级品类（1）
    4: optional string AwemeTypeId,         // 点进来的poi id v2
}

struct SpecialImageExtra {
	1: optional string CardSchema,// lynx的schema
	2: optional string CardData,// lynx的json 数据
	3: optional NavigatorInfoStruct NavigatorInfo // 导航信息
}

struct FromNearbyBarStruct {
    1: optional string Id,                           // bar绑定的视频id
    2: optional string Text,                         // bar文案
    3: optional UrlStruct Icon,                      // 图标
    4: optional string Schema,                       // 二级页跳转链接
    5: optional i32 FrequencyLimit,                  // 频控上限
    6: optional list<NameValuePair> ReportValues,    // 打点字段

    100: optional string Extra,
}

struct OriginalAudioStruct {
    1: optional UrlStruct play_url, // 播放地址
    2: optional string vid,         // 原声音频vid
    3: optional double volume,      // 音量大小
}

struct UserColorEmotionStruct {
    1: optional string user_emotion_id, // 用户心情id
    2: optional EmotionTemplateStruct emotion_template, // 心情模版
    3: optional i32 is_digged, // 心情是否被点赞
}

struct EmotionTemplateStruct {
    1: optional string emotion_template_id, // 心情模版id
    2: optional enum_type.EmotionTemplateType template_type, // 心情模版类型
    3: optional EmotionDisplayStruct display, // 心情展示
    4: optional i64 create_user_id, // 作者id
    5: optional i64 create_time, // 创建时间
}

struct EmotionDisplayStruct {
    1: optional string text, // 心情文案
    2: optional EmotionIconStruct icon, // 心情图标
    3: optional EmotionColorStruct color, // 心情颜色
}

struct EmotionIconStruct {
    1: optional string icon_id, // 图标id
    2: optional UrlStruct icon, // 图标
    3: optional UrlStruct anim_icon, // 动态图标
    4: optional UrlStruct translucent_icon, // 半透明图标
}

struct EmotionColorStruct {
    1: optional string color_id, // 颜色id
    2: optional string color_str, // 颜色名称
    3: optional EmotionGradientColorStruct normal, // 普通颜色
    4: optional EmotionGradientColorStruct dark, // 深色模式

}

struct EmotionGradientColorStruct {
    1: optional string gradient_begin, // 渐变开始
    2: optional string gradient_end, // 渐变结束
}

struct FansToolBarStruct {
    1: optional string text,
    2: optional i32 type, // 底 bar 类型：1 流量领取提醒类型，2 加热进度类型
}

// 日记投稿模版信息
struct DiaryStruct{
	1: optional i64 Id, // 模版id
	2: optional string Name, // 模版名称
	3: optional string Desc, // 模版描述
	4: optional UrlStruct Icon, // icon信息展示
}

// 中长视频起播节点信息
struct VideoNodeInfoStruct {
    1: optional i32 PlayType,  // 0-从头播，1-从高光时刻开始播
    2: optional i64 HightLight,  // 视频高光时刻
}

//dislike动态理由
struct DislikeDynamicReasonList {
    1:required string Title ,//标题头
    2:required list<DislikeDynamicReasonInfo>  ReasonList,//
    3:optional string Extra,//其他需要透传的附属信息json
}
struct DislikeDynamicReasonInfo {
    1:required string ButtonType ,//reason_id
    2:required string Text,//reason_text
    3:optional UrlStruct IconUrl,//Icon的url
    4:optional string ClientAnchorExtra,//客户端埋点上报需要的部分埋点信息
    5:optional string ServerAnchorExtra,//服务端接口上报需要的部分参数信息
}

struct FansLabelsStruct {
    1: optional i32 LabelType,                          // 粉丝类型
    2: optional string Text,                            // 显示的文案（铁粉）
    3: optional string Url,                             // 点击label跳转的url
    4: optional UrlStruct Icon,                         // 图标
    5: optional string LabelTracking,
}

struct LiveRoomStruct {
    1: optional i64 RoomID, // 直播房间号
    2: optional i32 LiveStatus, // 0:未开播,1:开播,2:嘉宾连麦,3:融合前-VS首播,4:融合前-VS开播,5:联合直播-共创嘉宾
    3: optional string RoomData, // 直播房间的具体信息，例如自定义展示图片地址
}

struct CoCreatorStruct {
    1: required i64 UID,
    2: required string SecretID,
    3: required string NickName, // 昵称
    4: required UrlStruct AvatarThumb, // 用户头像 小图
    5: required i32 RoleID, // 共创角色id
    6: required string RoleTitle, // 共创角色 title
    7: required i32 InviteStatus, // 邀请状态 0=邀请中 1=接受
    8: required i32 Index, // 共创者排序
    9: required enum_type.FollowStatusEnum FollowStatus,  // 0-双方都没有互相关注, 1-A关注B,B没关注A, 2-互相关注
    10: optional i32 FollowerStatus,  // 0 没有关注本人, 1 关注本人
	11: optional string Extra,
	12: optional i64 FollowerCount,
	13: optional UserVerificationStruct VerificationInfo,
	14: optional LiveRoomStruct LiveRoom 
}

struct CooperationInfoStruct {
    1: optional list<CoCreatorStruct> CoCreators, //共创者列表-需要判空和null
    2: optional string Tag, // 共创标签-需要判空和null
    3: optional string Extra, // 共创其他需要透传的信息-需要判空和null
	4: optional i64 CoCreatorNums, // 共创总人数
	5: optional i64 AcceptedNums, // 已经接受的人数
	6: optional i64 Cursor, // 非强插共创作者最大索引
}

struct FeedCommentConfigStruct {
    1: optional string InputConfigText, // 评论输入框配置文案
    2: optional i32 AuthorAuditStatus,  // 作者开启评论精选状态, 0-关闭, 1-开启
	3: optional CommentBarStruct CommentBarConfig, // 评论区顶bar配置
	4: optional bool ShowCommentBottomInput, // 是否满足触发快捷发评框条件
	5: optional list<string> PublishWordsRecommend, // 0评视频输入框推荐发评文本
	6: optional ImageChallengeStruct ImageChallenge, // 图评挑战
}

// 评论区顶bar配置
struct CommentBarStruct {
	1: optional enum_type.CommentBarType Type,
    2: optional UrlStruct Icon,
	3: optional string Title,
	4: optional string URL,
	5: optional string Intro,
	6: optional string Extra,
	7: optional i64 ExpiraTime,
	8: optional UrlStruct DarkIcon,
	9: optional enum_type.CommentBarPriorityType PriorityType,
	10: optional i64 ID, 
}

struct ImageChallengeStruct {
	1: optional string ConfigId; // 配置id
	2: optional string InputText; // 输入框文案
	3: optional string InsertText; // 强插一级文案
	4: optional string InsertSubText; // 强插二级文案
	5: optional i32 InsertIndex; // 强插位置
	6: optional string InsertButtonText; // 强插按钮文案
	7: optional string InnerText; // 内流匹配到配置文案
	8: optional string InnerPublishText; // 内流发布文案 
}

struct CommentWordsRecommendStruct {
	1: optional list<string> ZeroComment, // 0评引导词
}

struct VirtualCharacterStruct {
    1: optional UserVirtualAnimAvatarStruct VirtualAnimAvatar,
    2: optional UrlStruct VirtualAvatar,
    3: required i64 Version,
    4: required bool UseVirtualAvatar,
    5: optional i64 UpdateAt,
    6: optional i64 AvatarVersion,
}

struct UserVirtualAnimAvatarStruct {
    1:required UrlStruct LargeVirtualAvatar,
    2:required UrlStruct SmallVirtualAvatar,
}

struct  UserVirtualEmotionStruct{
    1: required string Text,
    2: required UrlStruct Icon,
}

// 「相关视频」底bar
struct RelatedVideoStruct {
	1: optional bool ShowBar, // Deprecated
	2: optional string BarName, // 标题文案
	3: optional string ItemId, // Deprecated, use AwemeId
	4: optional string AwemeId, // 当前视频 所关联的视频ID
	5: optional string Source, // 关联视频的来源
	6: optional i32 JumpStyle, // 根据实验跳转 0-详情页，1-内流
    7: optional enum_type.MediumVideoBarType Type, // 底bar类型
    8: optional string Extra, //其他内容 json
    9: optional string JumpConfirmTitle, //强导流弹窗文案
    10: optional i32 JumpXiguaType, // 跨端西瓜样式 2:跨端弹窗；4：跨端弹窗新样式
    11: optional JumpConfirmParam JumpConfirmParam, // 跨端弹窗样式内容参数
}

//长视频-简要信息
struct LVideoBriefStruct {
	1: optional AlbumInfoStruct AlbumInfo,
	2: optional EpisodeInfoStructNew EpisodeInfo,
	3: optional LVideoHighLight HighLightInfo,
	4: optional LVideoPreviewConfig config,
	5: optional XiguaGuideStruct XiguaGuide,
	6: optional enum_type.LVideoContainerType ContainerType, //展示的容器
	7: optional i64 Cursor, //游标，当有选集时为集的游标，当album为系列电影时为album的游标
	8: optional string AuthorRoleTitle, //作者title，for共创
	9: optional TCRMatchInfo TCRMatch // TCR匹配信息
	10: optional bool IsRecommend // 是否来自推荐
}

struct TCRMatchInfo {
	1: optional double Similarity             // 相似度
	2: optional list<DurationInfo> Durations  // 短视频片度
	3: optional list<DurationInfo> RDurations // 匹配到的长视频片段
}

struct DurationInfo {
	1: optional i64 StartTime // ms
	2: optional i64 EndTim    // ms
}

//剧集
struct AlbumInfoStruct {
    1: required string AlbumId,
    2: optional string Title, // 专辑名称
    3: optional i32 Status, // 更新状态：完结、连载
    4: optional i32 EpisodeUpdateAt, // 更新至
    5: optional i32 Label, // 标签：0无，1独播，2会员，3付费, 4已付费，5限免，100000正片
    6: optional list<string> RewardList, // 获奖信息
    7: optional list<i32> CategoryType,  // 类型标签
    8: optional list<i32> CategoryTopic,   // 主题标签
    9: optional string Region, // 地区
    10: optional i64 ReleaseTime, // 上映时间
    11: optional UrlStruct Cover,
    12: optional list<ActorInfoStruct> ActorList, // 演员列表
    13: optional string Intro, // 剧情简介
    14: optional string UpdateCycle, // 更新时间 （每周四更新）
    15: optional i32 Pattern, // 0编号选集，1抽帧选集
    16: optional list<LanguageInfoStruct> LanguageList, // 支持的多语言版本
    17: optional i32 SeqsCount, // 总集数
    18: optional i32 SeriesRank, //同系列，在同系列中的排名rank
    19: optional string SeriesTab, //同系列，在同系列中的名称，例如第二季
    20: optional i64 Duration, //单视频时，为episode的时长
    21: optional list<i32> TypeList, //类型，1:电影 2:电视剧 3:动漫 4:综艺 5:纪录片 13:儿童
    22: optional list<string> CategoryStrType,  // 类型标签 字符串数组
    23: optional list<string> CategoryStrTopic,   // 主题标签 字符串数组
    24: optional string SubTitle, //客户端展示的副标题(可用于一句话推荐)
    25: optional i32 GroupSource, //发文group_source
    26: optional string LabelText, //标签 字符串格式
    27: optional string AwemeId,
    28: optional string Score,      //西瓜长视频评分
    29: optional list<LVideoCoverStruct> CoverList //封面列表，可能包含横/竖封面
    30: optional PayInfo PayInfo, //付费状态，付费片要防录屏
    31: optional bool IsDrm, // 是否需要过drm
    32: optional i64 Attribute = 0,          //属性，各个bit代表不同的属性
    33: optional map<string, bool> AttributeMap,           // attribute的map结构, 标识了各bit位代表的状态
	34: optional bool IsLimitFree, // 是否限免
    35: optional i32 IsCollect //用户是否收藏album， 0:未收藏 1:收藏
    36: optional i64 CollectCount //收藏数
    37: optional InteractControl InteractControl // 互动管理
    38: optional AlbumAdInfo AdInfo //广告信息
    39: optional string LanguageInfo //album的配音语言（实际介质的语言）
    40: optional string SeriesId, //系列id
    41: optional list<LVideoCoverStruct> LargeCoverList //（大）封面列表，可能包含横/竖封面
    42: optional list<LVideoCoverStruct> MediumCoverList //（中）封面列表，可能包含横/竖封面
    43: optional list<LVideoCoverStruct> ThumbCoverList //（小）封面列表，可能包含横/竖封面
    44: optional string CompassId, //媒资id
	45: optional ContentChargeStruct ChargeInfo //内容付费信息
	46: optional EntertainmentProductStruct ProductInfo // 商品基本信息
	47: optional i32 LabelV2 // 1独播，2会员，3付费, 4限免，5预告，6已购买
	48: optional i64 AlbumVv // 剧集观看数
	49: optional string AlbumType // 剧集分类，对应TypeList文案
}

//集
struct EpisodeInfoStructNew {
    1: required string EpisodeId,
    2: optional string Title, // 正片名称
    3: optional i32 ConnerMark, // 角标  0无，1更新，2预告
    4: optional UrlStruct Cover,
    5: optional i64 Duration,   // 时长
    6: optional i64 UpdateTime,  // 本集更新时间
    7: optional i32 Seq, // 选集编号
    8: optional i32 CornerMark, // 角标  0无，1更新，2预告
    9: optional string SubTitle, //客户端展示的副标题(可用于一句话推荐)
    10: optional i64 EpisodeType, //选集类型， 1:正片 2:预告 3: 花絮 4: 剪辑 5:片段 6:高光
    11: optional i32 Rank, //排序使用，用来确定选集的顺序，从1起
    12: optional string AwemeId,
    13: optional list<LVideoCoverStruct> CoverList //封面列表，可能包含横/竖封面
    14: optional PayInfo PayInfo
    15: optional i64 Attribute = 0,          //属性，各个bit代表不同的属性
    16: optional map<string, bool> AttributeMap,           // attribute的map结构, 标识了各bit位代表的状态
    17: optional bool DisableRecordScreen, //是否需要防录屏
    18: optional LVideoControl VideoControl,
    19: optional LVideoInfo VideoInfo,
    20: optional InteractControl InteractControl, // 互动管理
	21: optional string FeedTitle, //feed标题
	22: optional i32 TryStatus , // 是否可试看，不可则直接弹出付费阻断蒙层
	23: optional i64 SeekTsMsec, //跳过片头
	24: optional i32 TryDuration//试看时长
	25: optional LVideoEntranceData EntranceData //锚点信息
	26: optional i32 SeekTsType, //起播点类型 0 默认，1 历史起播
	27: optional list<LVideoCoverStruct> LargeCoverList //（大）封面列表，可能包含横/竖封面
	28: optional list<LVideoCoverStruct> MediumCoverList //（中）封面列表，可能包含横/竖封面
	29: optional list<LVideoCoverStruct> ThumbCoverList //（小）封面列表，可能包含横/竖封面
	30: optional i32 CornerMarkV2 //文娱新标签
	31: optional i64 ParentItemCreateTime,//父episode在抖音投稿时间，用于“刚刚看过”定位
	32: optional i64 ParentEpisodeType, //父选集类型
	33: optional i64 SeekTsEndMsec, //跳过片尾
    34: optional string HighlightTitle, // 选集集高光标题
}

struct LVideoHighLight {
    1:optional string HighlightEpisodeId ,
    2:optional i64 StartTimeMsec , //高光起播点，如果大于片源真实时长，则从头起播
	3:optional i64 EndTimeMsec , //高光结束点，为空时表示不存在结束点
	4:optional string HighlightTitle ,
	5:optional string HighlightItemId,
	6:optional string AuthToken, //长视频参数加密token，基于正片item_id和高光item_id
}

struct LVideoPreviewConfig {
    1: optional UrlStruct UpCover , // 上背景图
    2: optional UrlStruct DownCover , // 下背景图
    3: optional UrlStruct BackGroundCover, // 全背景图
}

struct InteractControl {
    1: optional bool CanShare ,
    2: optional bool CanCollect ,
    3: optional bool CanComment ,
    4: optional string NoShareReason ,
    5: optional string NoCollectReason ,
    6: optional string NoCommentReason ,
    7: optional bool CanDownLoad ,
    8: optional bool CanDanmaku ,
    9: optional bool CanScreen ,
    10: optional string NoDownLoadReason ,
    11: optional string NoDanmakuReason ,
    12: optional string NoScreenReason ,
	13: optional bool CanDigg ,
    14: optional string NoDiggReason ,
}

struct LVideoControl {
    1: optional bool AllowProjectScreen, //是否可投屏
    2: optional string DisableProjectScreenReason, //禁止投屏的原因
    3: optional i32 ScreencastOnly, //0未知 1无仅可投 2仅可投鲜时光
}

struct LVideoInfo {
    1: required string Vid,
    2: optional string BusinessToken,
    3: optional string AuthToken,
    4: optional string PlayAuthToken,
}

struct LVideoCoverStruct {
    1: required UrlStruct Cover
    2: required i64 Style //0未定义 1横版 2竖版
}

struct PayInfo {
  1: required i32 PayType //0:免费 1:单点付费 2:会员付费
  2: optional bool PayStatus //0:未购买 1:已购买
  3: optional i64 ExpireTime //有效观看截止时间
  4: optional bool DeviceOver // 设备在线数量超过阈值
  5: optional i64 Price //剧集价格  单位为分
  6: optional i64 OrderStatus //0未支付 3支付成功 13履约
  7: optional string LabelText //运营角标文案
  8: optional string BottomText //购买按钮文案
  9: optional string TextExtra //付费相关的文案，json格式
  10: optional bool UseCoupon //是否使用优惠券
  11: optional string CouponMetaNo //优惠券模板id
}

struct ActorInfoStruct {
  1: optional UrlStruct Avatar,  // 头像
  2: optional string Name,
  3: optional string Role,
  4: optional enum_type.ActorType type,
}

struct LanguageInfoStruct {
  1: required string AlbumId,
  2: required string Language, // 文案：英语版本、普通话版本
}

struct XiguaGuideStruct {
  1: required bool Guide,  //是否可以导流 true可以  false不可以
  2: optional string MinRatio, //可以导流的最小清晰度
  3: optional string LabelText, //导流角标文案
  4: optional i32 FullScreenControl,//0：无导流 1：弱导流 2:强导流
}

struct SelectEpisodeButtonStruct {
  1: required string AwemeId //当前aweme_id
  2: required string TitlePrefix
  3: required string Title
  4: required enum_type.SelectEpisodeButtonType ButtonType
  5: optional string AlbumId //当前album_id
  6: optional string EpisodeId //当前episode_id
  7: optional string Extra //扩展
}

struct AlbumAdInfo {
  1: optional AlbumAdScene AdBefore //广告场景，前贴广告
  2: optional AlbumAdScene AdMid // 广告场景，中插广告
  3: optional AlbumAdScene AdAfter // 广告场景，后贴广告
  4: optional AlbumAdScene AdUnderVideo // 广告场景，框下广告
}

struct AlbumAdScene {
  1: required bool Open // 是否开启 true开启, false关闭
  2: optional i32 AdType // 广告类型 0未知 1竞价广告 2品牌广告 3 竞价广告+品牌广告 4招商广告
  3: optional i32 SkipAdType // 跳过广告的原因，0不跳过， 非0则需要跳过
}

struct LVideoEntranceData {
    1: optional list<LVideoEntrance> Meta //meta区锚点
    2: optional list<LVideoEntrance> Play //播放区锚点
}

//长视频锚点
struct LVideoEntrance {
    1: required i32 Type //锚点类型，1放映厅
    2: optional string Title //主文案
    3: optional string Tag //图标文案
    4: optional UrlStruct Icon //图标
    5: optional string Link //跳转链接
    6: optional string Extra //其他 json
    7: optional i64 JumpType //跳转类型：1浮层 2新页面
}

struct CFGroupStruct {
	1: required i32 Total,
	2: required string FolderId,
	3: required i32 Offset,
	4: required list<CFItemStruct> CFList,
	5: required i64 MinCursor,
	6: required i64 MaxCursor,
	7: required i64 HeadCursor,
	8: required i64 TailCursor,
	9: optional i64 InsertId,
	10: optional i64 InsertCreateTime,
	11: optional list<ItemOffset> ItemOffsets,
}

struct CFItemStruct {
	1: required i64 Id,
	2: required bool Unread,
	3: required i64 CreateTime,
}

// 音乐宣推评论区锚点
struct MusicPromoteCommentAnchorStruct {
   1: optional string Tag, // 跳转文案
   2: optional string Comment, // 评论文案
   3: optional i64 MetaSongID, // 音乐的metasongid
   4: optional MusicPromoteLinkInfoStruct MusicPromoteLinkInfo, // 链接信息
}

struct MusicPromoteLinkInfoStruct {
    1: optional string OpenUrl, // 跳转schema
}

// feed等视频页面拍照搜索入口配置
struct PhotoSearchEntrance {
    1: required i32 EcomType,
}

// 抖音弹幕控制信息
struct DanmakuControlStruct {
    1: optional bool EnableDanmaku, // 是否开启弹幕功能
    2: optional i32 PostPrivilegeLevel,// 发弹幕权限等级
    3: optional i32 IsPostDenied, // 当前用户是否禁止发弹幕  0否，1是
    4: optional string PostDeniedReason, // 禁发提示文案
	5: optional i32 BonusSceneId, // 彩蛋id
    6: optional i32 PendantId, // 挂件id
	7: optional bool SkipDanmaku, // 是否不需要拉弹幕
	8: optional i64 DanmakuCnt, // 弹幕数量
	9: optional list<i32> BonusSceneIdList, // 彩蛋活动扩展 id 列表
	10: optional list<i32> PendantIdList, // 挂件活动扩展 id 列表
	11: optional list<DanmakuActivityStrcut> Activities, // 弹幕活动
	12: optional string PassThroughParams,// 弹幕透传到get_v2的参数
}

// 抖音弹幕活动信息(弹幕控制信息在 pack core，活动信息在 biz server)
struct DanmakuActivityStrcut {
	1: optional i32 Id, // 活动 id
	2: optional i32 Type, // 活动类型
}


// 视频隐私权限等级: 通过，置灰，隐藏三种
enum PrivacyResultLevelEnum {
    PASS = 0
    DISABLE = 1
    HIDE = 2
}

// 权限校验失败信息
struct PrivacyFailInfo {
    // 错误code
    1: required i32 Code,
    // 失败原因
    2: required string Reason,
    // 详细文案
    3: optional string Msg,
}

// 视频隐私权限结果
struct PrivacyInfo {
    // 权限等级
    1: required PrivacyResultLevelEnum Level,
    // 权限失败信息
    2: optional PrivacyFailInfo FailInfo,
}

// 削弱 bgm 的人声音频流
struct EnhanceSpeechAudioStruct {
    1: optional UrlStruct PlayAddr, // Playback address for the audio track
    2: optional double Loudness,
    3: optional double Peak,
    4: optional i32 BitRate,        // bit rate for this audio file, used for event tracking
}

struct OriginalSoundStruct {
    1: optional UrlStruct PlayAddr, // Playback address for the audio track
}

struct AudioStruct {
    1: optional EnhanceSpeechAudioStruct EnhanceSpeechAudio,
    2: optional list<OriginalSoundStruct> OriginalSoundInfos, // list of original sounds information
    3: optional bool DefaultEnableOriginSound,
	4: optional string AudioWave; // 声纹
}

struct HeadIconStruct {
	1: required string url //废弃，以icon_url为准
	2: optional i32 width
	3: optional i32 height
    4: optional i32 show
    5: optional ComponentUrlStruct icon_url
}

struct TitleStruct {
	1: required string text
	2: optional i32 font_size
	3: optional i32 deprecated_font_color
	4: optional i32 bold
	5: optional string font_color
    6: optional string font_name
}

struct SeparatorDotStruct {
	1: optional i32 show
	2: optional string differential_char
}

struct MainContentStruct {
	1: required string text
	2: optional i32 font_size
	3: optional string font_color
	4: optional i32 bold
	5: optional i32 truncate
	6: optional i32 ellipsis
	7: optional i32 font_family
	8: optional string font_name
}

struct SeparatorVerticalLineStruct {
	1: optional i32 show
	2: optional string differential_char
}

struct SubContentStruct {
	1: required string text
	2: optional i32 font_size
	3: optional string font_color
	4: optional i32 bold
	5: optional i32 truncate
	6: optional i32 ellipsis
	7: optional i32 font_family
	8: optional string font_name
}
struct TailIconStruct {
	1: required string url //废弃，以icon_url为准
	2: optional i32 width
	3: optional i32 height
    4: optional i32 show
    5: optional ComponentUrlStruct icon_url
}

struct ComponentUrlStruct {
	1: required string uri
	2: required list<string> url_list
	3: optional i64 data_size
	4: optional i32 width
	5: optional i32 height
	6: optional string url_key
	7: optional string file_hash
	8: optional string file_cs
	9: optional string player_access_key
}

struct BarContainerStruct {
	1: optional i32 height
	2: optional i32 width
	3: optional string background_color
}

struct ShowStrategyStruct {
	1: optional i32 display_identity_status
	2: optional list<string> white_list
	3: optional list<string> black_list
}
//字段具体含义参考https://bytedance.feishu.cn/docx/doxcnv2z7kJJsPcESLy6XlrueId
struct CommonBarBasicInfoStruct {
	1: required string id
	2: optional i32 view_type
	3: optional i32 display_identity_status
	4: required i32 business_type
	5: required string schema
	6: optional i32 schema_type
	7: optional TitleStruct title
	8: optional SeparatorDotStruct separator_dot
	9: optional MainContentStruct main_content
	10: optional SeparatorVerticalLineStruct separator_vertical_line
	11: optional SubContentStruct sub_content
	12: optional HeadIconStruct head_icon
	13: optional TailIconStruct tail_icon
	14: optional BarContainerStruct bar_container
	15: optional string extra
	16: optional string tracer_info
    17: required string name
    18: required string desc
    19: optional ShowStrategyStruct show_strategy
}

struct ItemFollowUnreadEntrance {
    1: required string UnreadNumber,
    3: optional string InsertUID,
    4: optional string NickName,
    5: optional list<UrlStruct> UrlList,
}

// 关系解释聚合结构
struct RecommendReasonData {
  1: optional bool AddressBookPermission // 是否需要通讯录权限
  2: optional bool GpsPermission // 是否需要地理位置权限
  3: optional RecommendReasonInteractData InteractData // 关系解释交互区域相关结构体
}

// 关系解释交互区域相关结构体
struct RecommendReasonInteractData {
    1: optional enum_type.RecommendReasonClickDisplayType DisplayType // 展现类型(点击进入二级页面、出toast、其他)
}

//sub_pack search传来的字段
struct SubPackSearchStruct{
    1: optional TextExtraStruct OriginTextExtraInfo //废弃，使用第三个
    2: optional string  OriginDescText
    3: optional list<TextExtraStruct> OriginTextExtraInfos
	4: optional UgcTag SearchUgcTag
}

//创作页ugc音乐标签
struct UgcTag{
	1: optional string SamiGenre
	2: optional string SamiLang
	3: optional string SamiMood
	4: optional string SamiMvc
	5: optional string SamiTheme
}
// ever相关用户信息
struct EverInfoStruct {
    1: optional bool ShowInviteBtn   //展示邀请btn
    2: optional bool ShowActiveIcon  //展示活跃标签 
    3: optional string EverLabelText  // ever特有的解释文案
}

// Now题材投稿
struct NowPost {
	1: optional UrlStruct BackImage // 后置大图
	2: optional UrlStruct BackImageThumbnail // 后置小图
	3: optional UrlStruct FrontImage // 前置大图
	4: optional UrlStruct FrontImageThumbnail // 前置小图
	5: optional UrlStruct FussyImage // 模糊图
	6: optional i64 PostPushedAtSec // 投稿时所在游戏轮次的push开始时间
	7: optional enum_type.NowPostStatus NowStatus // now投稿状态
	8: optional bool IsPostToday // 是否为今日投稿
	9: optional ImageUrlStruct CompositeEnlargeFront // 合成图
	10: optional ImageUrlStruct CompositeImage // 合成图
	11: optional UrlStruct BackFuzzyImage // 后置摄像头拍的图片，大图，模糊图
	12: optional UrlStruct FrontFuzzyImage // 前置摄像头拍的图片，大图，模糊图
}

struct RelatedRecLabelStruct {
    1: optional string Text //文案
    2: optional enum_type.RelatedRecRelationType RelationType //标签类型
    3: optional i64 Value //收藏/评论/···的值
}

struct AnimatedImageStruct {
    1: required i32 Type, // 动图类型，1: livephoto 2: gif
    2: optional i32 Effect, // 动图效果，1: 实况 2: 轮播
}

struct FlashMobStruct {
    1: optional string Id, // 快闪贴纸id
    2: optional string Text, // 快闪内容
    3: optional list<UrlStruct> UserAvatarList, // 参与用户头像列表
    4: optional i64 Count, // 快闪贴纸使用计数
    5: optional string CreatorNickName, // 快闪发起人昵称
    6: optional string CountStr, // 快闪贴纸使用计数 - 减去头像数量，格式化后的string
    7: optional i64 CreatorUid, // 快闪发起人uid
    8: optional i32 Type, // 快闪样式
    9: optional string CreatorAwemeid,
	10: optional bool IsCommerceFlashmob, // 是否为商业化快闪
	11: optional string CommerceHashtagId, // 商业化话题id
	12: optional string CommerceStickerId, // 商业化道具id
	13: optional bool UserHasJoined, // fromUser是否参与了该快闪
	14: optional bool IsPastMemory, // 是否为往年今日挑战 - 已废弃，使用type_extra字段
	15: optional string TypeExtra, // json格式，往年今日{"is_past_memory": true}
	16: optional bool IsFollowShoot, // 是否跟拍，非跟拍：编辑页自己加挑战、文字面板推荐加挑战、编辑页推荐加挑战、发布页推荐加挑战
	17: optional string SpeakID, // 朗读使用的音色id
	18: optional PitayaRedPacketStruct PitayaRedPacketInfo// 火龙果红包数据
	19: optional string ConfigRightButtonSchema // 跳转schema
}

struct PitayaRedPacketStruct {
	1: optional string Id
    2: optional enum_type.PitayaRedPacketStatus Status
}

struct ImGroupStickerStruct {
  1: optional i64 ConversationShortId
  2: optional string Name
  3: optional string GroupCreateType
}

struct ClipPagingStruct {
    1: optional bool HasMore
    2: optional i32 NextCursor
    3: optional i32 Direct
    4: optional i32 Start
    5: optional i32 End
    6: optional list<ImageUrlStruct> PackedClips // 废弃
	7: optional string Source
}

struct PushPermissionButtonStruct {
    1: optional bool PushPermissionStatus // 推送权限开关
    2: optional string PushPermissionButtonCopyWriting // 引导推送按钮文案
    3: optional i32 PushPermissionButtonEnum // 引导推送枚举
}

struct CommerceLabelStruct {
    1: optional enum_type.CommerceLabelType label_type // 电商标签枚举
    2: optional UrlStruct label_icon // icon url
    3: optional string label_header // 标签左头部文案
    4: optional string label_text // 标签正文文案
    5: optional string schema // 跳转链接
    6: optional string extra // 业务扩展字段，json格式
}

struct WannaLabelStruct {
  1:optional  string LabelType
  2:optional  string LightIconUrl
  3:optional  string DarkIconUrl
  4:optional  string Text  // 文案
  5:optional  string LightBgColor
  6:optional  string DarkBgColor
  7:optional  string LightTextColor
  8:optional  string DarkTextColor
  9:optional  string Schema
  10:optional i64    Location  // icon的位置 0下，1上
  11:optional string SubText  // 副文案
  12:optional i64    IsClick // 1为点击
  13:optional i64    TagId
  14:optional UrlStruct Avatar
  15:optional string  Id
}

//收藏夹元数据
struct CollectsInfoStruct {
    1: required i64 UserId
    2: required i32 AppId
    3: required i32 ItemType //	关联实体类型
    4: required string CollectsName //	收藏名字
    5: required i64 CollectsId //	收藏夹唯一标识
    6: required i64 CreateTime //	创建时间
    7: required i64 LastCollectTime //	收藏夹最后一次收录实体时间
	8: optional i64 FollowedCount // 收藏夹被关注数
	9: optional i64 PlayCount // xxx人看过
}

struct RelatedCollectsInfoStruct{
	1: required i32 RelatedHighQualityCollectsType // 收藏夹交互样式 1 强插卡片 2 底bar 3 标签
	2: required CollectsInfoStruct HighQualityCollectsInfo // 对应收藏夹数据
}

struct PreAggregationStruct {
    1: optional enum_type.PreAggregationType PreAggregationType
    2: optional i32 PreAggregationCount //预聚合视频数量，最大20，如果概率过滤返回-1，被降级返回-2
    3: optional string PreAggregationResourceId
}

struct RelatedXiguaGuide {
    1: optional string Title;
	2: optional UrlStruct Icon;
}

struct ArticleInfoStruct {
	1: optional string article_content;
	2: optional string article_id;
	3: optional bool has_more; 
	4: optional string music_url;
	5: optional i32 article_type;
	6: optional string container_lynx_url;
	7: optional i64 read_time;
	8: optional string article_title; 
	9: optional string fe_data;
	10: optional string detail_lynx_url;
	11: optional i32 is_cartoon;
}

// 视觉搜索相关字段
struct VisualSearchStruct {
    1: optional bool IsShowEntrance // 是否展示视觉搜索入口
	2: optional i32 VisualSearchLongpress	// 长按视频是否请求图搜关键信息
	3: optional bool is_show_img_entrance	// 图文体裁是否展示视觉搜索入口
	4: optional bool is_ecom_img	// 图文体裁是否是电商意图
	5: optional bool IsHighAccuracyEcom // 是否高准电商意图
	6: optional bool IsHighRecallEcom // 是否高召电商意图
    99: optional string extra // 预留扩展字段
}

//听视频相关字段
struct AwemeListenStruct {
	1: optional i32 VideoSleepStatus //视频是否适合助眠
	2: optional i32 MusicCoverListen // 音乐转盘支持听抖音

	998:optional string TraceInfo // 埋点
	999:optional string Extra // 预留
}

struct GameDataChannelConfigStruct {
	1: optional string GumID; // GUM标签
	2: optional string UnifiedGameID;  // 游戏ID
	3: optional i64 VideoStayLimit; // 短视频累计观看时长（秒）
}

struct RelatedVideoExtraStruct {
    1: optional string LabelName;  // 醒目标签
    2: optional string LabelType;  // 醒目标签类型
    3: optional string Querys;  // 相关搜索卡片query词
    4: optional string Tags;  // aweme v2标签
	5: optional i32 RelatedItemDiversionType;  // 西瓜混排导流参数
	6: optional FallCardCoverBgColorStruct CoverBgColor;  // 视频封面背景算色
	7: optional string DiversionSchema; // 抖音精选相关视频导流跳转schema
	8: optional string DiversionSchemaUninstall; // 抖音精选相关视频导流跳转schema（未安装情况使用）
	9: optional string Source;	// 中视频-相关视频，视频来源
	10: optional string Desc;	// 相关视频规则过滤后的desc
}


struct FallCardStruct {
	1: optional string RecommendReason //推荐理由
	2: optional HighValueAreaV2 HighValueArea
	3: optional FallCardCoverBgColorStruct CoverBgColor;
	4: optional FallLabelStruct FallLabel;
	5: optional string RecommendReasonV2; //新版推荐理由
	6: optional bool CanExtendPlay; //继续播
	7: optional bool CanSwitchToFall; //头像上方新入口切换至双列
	8: optional bool IsTidy; // 是否为精简数据
}

struct FallLabelStruct {
	1: optional list<FallReasonCandidate> Candidates;   // 推荐理由候选
}

struct FallReasonCandidate {
	1: optional i64 BusinessID;                // 唯一业务标识
  	2: optional i64 Priority;                 // 优先级
  	3: optional StaticReason StaticReason;      // 静态理由
}

struct StaticReason {
	1: optional list<ReasonContainer> Containers; //容器列表
}

struct ReasonContainer {
	1: optional list<ReasonElement> Elements; //推荐理由元素
}

struct ReasonElement {
	1: optional ReasonTextInfo Text;//文本信息
	2: optional ReasonImageInfo Image;//图标信息
}

struct ReasonTextInfo {
  1: optional string Content;           // 文本内容
}

struct ReasonImageInfo {
  1: optional string Uri;           // 图片uri
  2: optional list<string> UrlList;           // 图片urllist
}

struct FallCardCoverBgColorStruct {
	1: optional string ForWhite   // 视频底色，浅色主题
	2: optional string ForDark  // 视频底色，深色主题
}

struct HighValueAreaV2 {
	1: optional i64 XMin;
	2: optional i64 XMax;
	3: optional i64 YMin;
	4: optional i64 YMax;
}

struct PlayProgressStruct {
	1: optional i64 play_progress; //以毫秒为单位
	2: optional i64 last_modified_time; //以秒为单位
	3: optional string ProgressGuildBar;	// 进度引导标
	4: optional i32 WatchTimes; // 标识当前视频是否看完过 0或不存在没看完过
}

// IM 智能表情
struct IMSmartEmojiStruct {
	1: required string Name; 	// 展示名
	2: required string Label;	// 发送内容
}

// IM 分享记录
struct IMShareRecordStruct {
    1: required i64 FromUID,        	// 分享者 uid
    2: required i64 MessageID,      	// 消息 ID
    3: optional i64 ConvShortID,    	// 会话 ID
	4: optional string ClientMessageID,	// 客户端消息 ID
	5: optional string ConvID,			// 会话 string ID
	6: optional string AttachMsgContent, // 附言内容
	7: optional i64 AttachMsgId,	     // 附言ID
	8: optional string AttachClientMessageID,	  // 附言客户端消息ID
	9: optional string ShareId, //分享唯一标识，埋点用
}

// IM 分享信息
struct IMShareStruct {
    1: required list<IMShareRecordStruct> ShareRecords, // 分享记录
    2: optional bool ShowQuickReply;                    // 是否展示回复框
	3: optional list<IMSmartEmojiStruct> SmartEmojis;	// 智能表情
	4: optional string SmartEmojiExtra; // 智能表情extra信息
}

struct DistributeCircleStruct {
    1: optional enum_type.DistributeCircleType Type,
    2: optional bool IsCampus,
    3: optional bool CampusBlockInteraction,
}

//superlike 信息
struct SuperlikeStruct {
	// Superlike状态 0=未superlike 1=superlike
	1: optional i32 Status,
}

struct UserPortraitStruct {
    1: optional bool IsCurrentStudent,
    2: optional string SchoolId,
}

struct NearbyFeedTags {
	1: optional string Content,
	2: optional i32 Style,
	3: optional GrouponTagStruct FirstTag, // 标题前面的tag，适用于双tag的场景
	4: optional GrouponTagStruct Title, // 标题
	5: optional UrlStruct BackGround, // 背景图片
	6: optional string BgColor, // 背景色，优先使用背景图
	7: optional double BgDegree, // 背景色透明度，和背景色配套使用
	8: optional UrlStruct SplitUrl, // 分割线的图片，没下发不展示分割线
}

struct GrouponTagStruct {
	1: optional GrouponTextStruct Text, // 文案样式
	2: optional UrlStruct HeadIcon, // 文案前面的icon
	3: optional GrouponTextStruct ClickText, // 点击后的文案
	4: optional UrlStruct ClickIcon, // 点击后的icon
}


// 团购文案样式通用结构
struct GrouponTextStruct {
	1: optional string Text, // 文案
	2: optional string TextColor, // 文案颜色
	3: optional double TextDegree, // 文案透明度
	4: optional bool IsBold, // 是否加粗
	5: optional i32 TextSize, // 文字大小
}

struct GrouponExpressModuleStruct {
	1: optional GrouponTextStruct Title, // 标题
	2: optional NearbyFeedTags SubTitle, // 副标题
	3: optional list<NearbyFeedTags> Bottom, // 底部区域
}

// 每段元素的信息
struct GrouponCapItem {
	1: optional i32 type, // 类型：1=>文字   2=>图片
	2: optional GrouponTextStruct text_info,
	3: optional UrlStruct img_info,
}
// 标签结构信息
struct GrouponCapSule {
	1: optional i32 background_round, // 圆角 单位px
	2: optional string background,  // 色值
	3: optional list<GrouponCapItem> items, // 元素
}

// 视频属性
struct VideoAttribute {
	1: optional bool IsLocalLifeVideo, 	// 是否是生服视频
	2: optional bool HasSpuService, 	// 是否带交易
	3: optional list<NearbyFeedTags> NearbyTags, // 强插视频/直播携带的标签信息
    4: optional bool EnableFeedDualPlay, // 视频自动播放
	5: optional string Snackbar, //snackbar组件信息 
	6: optional i32 TitleLimitLine, // 标题截断行数
	7: optional NearbyFeedTags GrouponBottomTag, // 团购视频直播底部的icon
	8: optional NearbyFeedTags GrouponBottomRightTag, // 团购视频直播底部右边的icon，广告标签
	9: optional GrouponExpressModuleStruct GrouponExpressModule, // 视频直播下面的表达层
	10: optional bool IsPromotionCard, // 是否为引流的视频和直播
	11: optional bool HasAdTag,// 是否有广告标
	12: optional bool CacheDisable, // 缓存直出不缓存
	13: optional i32 OpenType, // 卡片点击跳转格式 0:内流； 1：详情页
    14: optional string OpenTypeSchema, // 跳转schema，预留拓展字段
	15: optional bool IsAds , // 是否广告
	16: optional list<GrouponCapSule> GrouponBottomTagList,  // 团购样式2.0
}

// 关键封面和视频段落
struct KeyCoverStruct {
	1: optional string uri, 	// 封面uri
	2: optional list<double> score, 	// 分数
	3: optional i32 width, 	// 图片宽度
	4: optional i32 height, 	// 图片高度
	5: optional string vid, 	// 关键片段vid
	6: optional double start_time, 	// 关键片段开始时间
	7: optional double end_time, 	// 关键片段结束时间
}

struct ItemSmartEmojiStruct {
    1: optional string Name
    2: optional string Content  // 比如[捂脸]
}

// 中视频-频道feed补充信息
struct ChanFeedExtraStruct {
    1: optional string Sort // 推荐透传
}

// 中视频-频道feed中专用字段
struct ChanFeedVideoStruct {
    1: optional string Desc // 标题
    2: optional RecallReasonStruct RecallReason  // 召回原因
	3: optional UrlStruct BigCardUrl // 大卡封面
	4: optional UrlStruct SmallCardUrl // 小卡封面
	5: optional string Type // 视频类型
	6: optional string Source // 视频来源
	7: optional FallCardCoverBgColorStruct CoverBgColor;  // 封面背景算色
	8: optional bool GuideForbidden;  // 引导视频是否禁止自动播, true-是
	9: optional string YummeBoostId; //精选视频保量任务ID
}

// 中视频-推荐理由
struct RecallReasonStruct {
    1: optional string Text // 文字
    2: optional string Url  // icon URL
	3: optional string BgColor // 背景颜色
	4: optional string TextColor // 文字颜色
	5: optional string Type // 类型
	6: optional i64 PlayProgress // 播放进度
	7: optional string DarkUrl  // icon URL 深色模式
	8: optional string TextSuffix // 文字后缀
}

struct LiveAppointmentDetail {
	1: optional i64 LiveStartTime // 预计开播时间
	2: optional i64 AppointmentID // 预约id
	3: optional i64 Type // 1=单条预约，2=激进预约（下一次）
	4: optional i64 Status // 预约状态
	5: optional i64 LastStartTime // 上次开播时间用于激进预约（下一次）
}

struct AwemeAigcStruct {
    1: optional i32 IsStickerAigc // 是否Ai特效
    2: optional string OriginalStickerId  // 母版特效ID
	3: optional string AigcStickerId // Ai特效ID 
	4: optional i32 AigcType // aigc特效类型
	5: optional string Source // 素材来源 "direct_shoot" 直拍
}

struct EcomVideoBizInfo {
	1: optional i32 EcomVideoType // 1为挂车视频 2为非挂车电商意图种草视频
    2: optional string EcomVideoProductIds // 相关商品id拼接
	3: optional string EcomWindowProductIds // 橱窗同款商品 id 拼接
}

struct ChimeVideoInfo {
	1: optional bool IsChimeVideo // 是否整点报时视频
    2: optional string ChimeInfo // 整点报时视频信息
    3: optional i32 ResultCode // 打包结果
}

struct YummeMixStruct {
	1:  required string                 MixId          // 合集ID
    2:  required string                 MixName        // 合集名称
    3:  optional string                 Desc           // 合集描述
    4:  optional UrlStruct              CoverUrl       // 合集封面
    5:  optional YummeMixStatus         Status         // 合集状态信息
    6:  optional YummeMixStats          Stats          // 合集统计信息
    7:  optional enum_type.YummeMixType Type           // 合集类型，0：作者合集，1：自建合集
    8: required i64                     CreateTime     // 合集创建时间
    9: optional i64                     CurrItemId     // 当前集数的item id
    10: optional YummeMixCompilationTag CompilationTag // 合集分类标签
}

struct YummeMixStatus {
    1: optional i32 IsCollected // 是否收藏了合集
}

struct YummeMixStats {
    1: optional i64 PlayCount    // 播放数
    2: optional i64 CollectCount // 收藏数
    3: optional i64 CurrIndex    // 当前是合集第几集
    4: optional i64 Total        // 合集更新至第几集
}

struct YummeMixCompilationTag {
    1: optional string Level1 
    2: optional string Level2 
    3: optional string Level3 
}

// VideoInteractInfo UG内容带增长短视频互动组件信息
struct VideoInteractInfo {
	1: required string ActivityName,								// 活动主key
    2: required enum_type.UserState UserState,                      // 当前用户状态
	3: required list<ActivityBtn> ActivityBtnList,					// 用户状态对应Btn信息
    4: required string Scehma,                                      // 活动入口链接
	5: optional i64 NowTimestamp,									// 当前时间戳（秒级）
	6: optional string EventData,									// 埋点数据
}

struct ActivityBtn {
	1: required enum_type.UserState UserState, //用户状态
    2: required string Text,     		       //具体文案    
	3: optional string IconUrl,				   //（预留）icon链接
}

struct EnterpriseImStruct {
	1: optional bool HasImBtn, //是否有进入私信按钮
	2: optional string ImSchemaUrl, //私信页面SchemaURL,ImSchemaUrl
}

struct WatchLaterInfoStruct{
	1: optional i64 ListNum,  		// 当前用户稍后再看列表数量
	2: optional string Tag, 		// tag信息需要判空和nil
	3: optional string ButtonText,  // app 左交互区button文案
	4: optional i64 AddTimestamp,   // 当前item添加到稍后再看的时间 

	200:  optional string Extra   // 预留字段
}

struct WatchLaterRecommendTipsStruct{
	1: optional i64 TipsType,  		// 推荐类型
	2: optional string TipsText, 	// 推荐文案
	3: optional i64 TipsShowTimestamp // 推荐提示展示时间戳

	200:  optional string Extra   // 预留字段
}

// 基建付费视频付费信息
struct ContentChargeStruct {
	1: optional bool IsChargeContent, // 是否付费
	2: optional bool HasPaid, // 用户是否已购买
	3: optional PreviewConfig PreviewConfig, // 试看配置
	4: optional bool UseDemotion; // 使用降级
	5: optional bool IsDeviceOver; //在线设备是否达到上限
	6: optional i64 ExpireTime; //付费过期时间
	7: optional bool IsSubscribeContent; // 是否为会员视频
	8: optional bool IsDelivery; // 是否已履约(HasPaid是true的时候再判断这个字段)
	9: optional string HasRightText; //当前视频有权限下发文案，因为可能之前是通过购买获得的权限 
	10: optional bool DisableAutoOpenPayPage; //  禁用自动提单
	11: optional string NoRightText; // 无权益时下发的文案
    12: optional string MaskText; // 蒙层文案
}

 // 基建付费视频试看配置
struct PreviewConfig {
  1: optional bool IsPreview; // 是否是试看视频
  2: optional i64 StartTime; // 试看起始相对时间ms
  3: optional i64 EndTime;// 试看结束相对时间ms
  4: optional bool IsDeviceOver; //在线设备是否达到上限
  5: optional i32 SetType; // 1:推荐，2:自定义
  6: optional i32 DisableReason; // 0: 本来就没有试看，1: 内流不给试看，2: 外流续播不给试看
  7: optional i64 UpdateStartTime; // 作者更新的试看起始相对时间ms
  8: optional i64 UpdateEndTime; // 作者更新的试看结束相对时间ms
 }

// 基建付费合集短剧付费信息
struct MixChargeStruct {
  1: optional i32 ChargeType; // 0:非付费，1:付费且有付费视频，2:免费但是有付费视频，3:付费但无付费视频
  2: optional bool HasPaid; // 用户是否已购买整个合集短剧
  3: optional i32 ChargeCount; //剧集下有多少集付费视频 
  4: optional i32 SellType; // 售卖方式 0:整包，1:单集，2:整包+单集
  5: optional i32 UnpaidCount; // 用户还有多少集未购买
  6: optional bool UseDemotion; // 是否降级
  7: optional string BuySchema; // 提单页链接
  8: optional i64 PromiseUpdateTime; // 承诺更新时间
  9: optional list<i64> PaidEpisodes; // 用户已经付费或者有权益的集(包含限免的和解锁购买的)
  10: optional list<i64> ChargeEpisodes; // 短剧维度本身需要付费的集列表
 }


// 商品价格
struct ProductPriceInfo {
  1: optional string CurrencyType ; // 币种枚举
  2: optional string CurrentPrice; // 现价
  3: optional string OriginPrice;  // 原价
  4: optional string CurrencyName; // 币种名字
  5: optional string StartHint; // 展示 xx 起
}

// 商品营销活动
struct MarketingInfo {
  1: optional LimitFreeStruct LimitFree; // 限免活动
  2: optional MarketingHint MarketingHint; // 营销提醒，后续可通用
  3: optional list<string> MarketingTag; //阻断卡片上的营销tag，比如 可领券、可收益抵扣 等
  4: optional ApplyCouponStruct ApplyCoupon; //领券活动
}

// 商品营销提醒
struct MarketingHint {
  1: optional string HintText; // 营销提醒文案
  2: optional UrlStruct HintIcon; // 营销提醒的图标
}

struct LimitFreeStruct {
  1: optional bool InFree; // 是否在限免中
  2: optional i64 StartTime; // 限免起始时间
  3: optional i64 EndTime; // 限免结束时间
}

struct ApplyCouponStruct {
  1: optional bool CanApplyCoupon; //是否能够领券
}

struct BuyBottonStruct {
	1: optional string TextWithPrice; // 购买完整版10钻起
	2: optional string TextWithoutPrice; // 购买完整版
	3: optional string TextFroAdCharge; // 激励广告解锁button文案
}

struct EntertainmentProductStruct {
  1: optional i64 ProductId;// 商品ID
  2: optional i32 ProductCategory; // 商品种类
  3: optional string Title; // 标题
  4: optional list<string> SubTitle; // 滚动副标题
  5: optional UrlStruct CoverUrl; // 商品封面
  6: optional ProductPriceInfo PriceInfo; // 价格信息
  7: optional i64 Sales; // 商品销售量
  8: optional MarketingInfo MarketInfo; // 商品营销活动
  9: optional string BuySchema; // 提单页链接
  10: optional UrlStruct Icon; // 商品icon(合集，短剧，长视频)
  11: optional BuyBottonStruct BottonInfo; // 引导购买按钮 
  12: optional i64 SkuID;
  13: optional i32 WatchPeriod; // 购买后可观看时间（单位天）
  14: optional string ProductIdStr; // 商品ID，字符串形式
  15: optional string SkuIdStr; // skuID,字符串形式
  16: optional i32 HasRePurchase //1|null表示有复购，0表示没有复购
  17: optional i32 HasRechargeCardBalance //null|0 表示余额不足，1表示余额充足
  18: optional string BuyPanelSchema; //余额充足-余额抵扣提单页，余额不充足-正常一步提单页
  19: optional string FeedBuySchema; // feed 阻断卡的长链 schema
  20: optional bool IsPersonalStrategyContent; // 是否是接入个性化折扣的内容
  21: optional string TradePassThrough; // 交易server透传字段，json格式
}

// 文娱节目使用的预加载信息
struct EntertainmentPreloadStruct {
  1: optional bool BuyPanelPreload;
}

enum AdChargeStrategyType {
	AdChargeStrategyDefault = 0;
	AdChargeStrategyGrowth = 1; // 来自于激励组, 用户IAP转IAA的剧;
	AdChargeStrategyGrant = 2; // 来自于特定策略免费场景, 用于IAP;
	AdChargeStrategyGrowthIAA = 3; // 来自于激励组, 用于IAA片库;
}

// 激励广告解锁相关配置
struct AdChargeConfig {
  1: optional bool HasPaid;// 是否已付费
  2: optional PreviewConfig PreviewConfig; // 试看配置
  3: optional i32 UnlockNum; // 一次广告结束视频数
  4: optional i32 AdditionalNum; // 再得策略（再看一个广告可以解锁几集视频）
  5: optional i64 CreatorID; // 透传给广告SDK，归因使用
  6: optional i32 Rit; // 此次写死28078
  7: optional string AdFrom; //短剧写死playlet
  8: optional string DetainmentText; //挽留文案
  9: optional UrlStruct CoverUrl; // 挽留文案对应的图片
  10: optional string TextAfterUnLock; // 解锁后的提示文案
  11: optional i64  timestamp; // 拉取视频的时间戳，ms级别
  12: optional string certificate; // 获取发奖配置的证书配置
  13: optional string sign; // 当前视频的发奖的签名sign
  14: optional string CreatorIDStr; // CreatorID的字符串类型
  15: optional string SendUniqId; // 发奖唯一标识（uid_skuID_time)
  16: optional bool IsDelivery;// 是否已履约(当HasPaid是true的时候来根据这个字段判断是否需要调用履约)
  17: optional string HasRightText; //当前视频有权限下发文案，因为可能之前是通过购买获得的权限 
  18: optional AdChargeStrategyType StrategyType; // 广告观看策略, 不太好兼容以前的，直接新定义字段
  19: optional i32 RequiredCount; 		// 需要观看广告的总次数
  20: optional i32 FinishedCount; 		// 已经观看广告的次数
  21: optional i32 FinishedProgress; 		// 已经观看广告的百分比
  22: optional i32 AfterFinishedCount; 	// 本次广告结束后，观看广告的次数
  23: optional i32 AfterFinishedProgress;  	// 本次广告结束后，观看广告的百分比
  24: optional i64 Cursor;  			// 下一个广告的游标
  25: optional string AdAwardKey;		// ad奖励key，该key存在则覆盖奖励
  26: optional bool HasMore;		  // 是否还有更多广告，决定是发请求 get_send_reward_config
}

// 激励广告被动解锁参数配置
struct AdChargePassiveUnlockConfig {
    1: optional PassiveUnlockBtnConfig TrialBtnConfig; // 当前视频需要IAA解锁，试看即将结束的被动解锁btn配置
    2: optional PassiveUnlockBtnConfig BroadcastBtnConfig; // 当前视频不需要iaa解锁，下一个视频需要IAA解锁，播放即将结束的被动解锁btn配置
}

// 被动解锁btn配置
struct PassiveUnlockBtnConfig {
    1: optional i32 BtnShowSecond; // 被动解锁btn展示配置的秒数
    2: optional string BtnText; // 试看即将结束，当前视频的强调btn的文案(X秒后解锁本集/下一集)
    3: optional i32  BtnShowFrequency; //  单次播放视频被动解锁btn的出现次数
	4: optional i32 ShowSecondType; // BtnShowSecond的秒数的配置类型1-正向的second配置 2-逆向的second配置
	5: optional string VipBuySchema; // VIP购买schema，当此字段有值时，btnText文案需要调整为 购买短剧卡
}

// 对齐 AdEpisodeAwardInfo@webcast/room/paid_product_biz_privillege.thrift 结构
struct AdEpisodeAwardInfo {
    1: optional i64 WatchDuration       // 看每次广告可解锁物理时长
    2: optional string SendUniqID       // 幂等ID
    3: optional i64 TimeStamp           // 时间戳，用于验签
    4: optional string Sign             // 签名信息
    5: optional i64 StartTime           // 有效期开始时间
    6: optional i64 EndTime             // 有效期结束时间
    7: optional i64 SpuId               // 商品SPU
    8: optional i64 SkuId               // 商品SKU
    9: optional i32 BizType             // 业务的BizType
    10: optional string SpuIdStr        // 商品SPU
    11: optional string SkuIdStr        // 商品SKU
}

// 长视频激励广告试看信息
struct LVideoAdPreviewConfig {
    1: optional bool IsPreview      // 是否支持试看
    2: optional i64 PreviewDuration // 试看时长
}

// 长视频激励广告信息
struct LVideoAdChargeInfo {
    1: optional LVideoAdPreviewConfig PreviewConfig // 试看配置
    2: optional i64 UnLockType                      // UnLockType
    3: optional i64 RemainedCanWatchDuration        // 剩余观看时长
    4: optional i64 TotalAdCount                    // 需要看多少次解锁本集
    5: optional i64 RemainedAdCount                 // 剩余广告个数
    6: optional i64 CreatorID                       // 透传给广告SDK，归因使用
    7: optional i32 Rit                             // 长视频Rit
    8: optional string AdFrom                       // 长视频AdFrom
    9: optional string CreatorIDStr                 // CreatorID 的字符串类型
    10: optional list<AdEpisodeAwardInfo> Awards    // 广告奖励
}

//付费心愿
struct CrowdPaycontrollerInfo{
	1:optional bool ShowDiagnoses; //是否展示评价
	2:optional string TaskId; //任务id
	3:optional i32 PlayFinishRate; //完播率展示控制
}

// Flow feed入口控制
struct FeedFlowControllerInfo{
	1: optional bool ShowFlow; // 是否展示Flow入口
	2: optional string FlowButtonIconUrl; // 按钮样式
	3: optional string FlowButtonExtra; // 入口信息
}

struct FastReplyData {
	1: optional enum_type.FastReplyBussinessType BusinessType;
	2: optional RelativeUserStruct User;
	3: optional FastReplyCommentStruct Comment;
}

struct FastReplyCommentStruct {
    1: required string CId,        // 评论的ID
    2: required string Text,       // 评论的文案
    3: required i32 DiggCount,  // 评论被点赞的数量
    4: required bool UserDigged,  // 评论是否被当前用户点赞
	5: required bool UserBuried,  // 评论是否被当前用户点踩
	6: optional string ReplyToUserName, // 评论回复的用户名
	7: optional string ReplyId,         // 回复ID，评论的parentID
	8: optional string ReplyToReplyId,  // 回复的ID，三级评论直接回复二级评论的二级评论ID
}

struct RecWordStructV2 {
	1: optional list<RecWord> WordList,
	2: optional i32 CardType, // 1=单词卡 2=多词卡
}

struct RecWord {
    1:optional string Text, //文本
	2:optional i64 CreateTime, //创建时间
    3:optional i32 Type, //1=正向 2=负向 3=中性 
    4:optional i32 Status, //0=生效,1=删除
    5:optional i32 UserReaction// 1=赞，2=踩
}

struct InteractCardStruct {
	1:optional i32 type, // 类型 0：多出/少出/看腻(文案+一个按钮+点击前后变化) 1: 反馈(文案+两个按钮+点击前后变化)
	2:optional string biz_info, // 业务信息，json 字符传
	3:optional string card_title; //卡片文案
	4:optional list<InteractCardWord> words,//多词卡按钮
}

struct InteractCardWord {
  1:optional string text;  // 文案部分
  2:optional string extra; // 透传部分，用户点击后客户端透传即可
  3:optional string rec_extra; //推荐透传extra
}

struct InteractBarStruct {
	1:optional i32 type, // 类型 0：多出/少出/看腻(文案+一个按钮+点击前后变化) 1: 反馈(文案+两个按钮+点击前后变化)
	2:optional string biz_info, // 业务信息，json 字符传
	3:optional list<InteractSubBar> bars,
}

struct InteractSubBar {
	1: optional list<InteractSubBarContent> contents,
	2: optional list<InteractSubBarBtn> btns,
}

struct InteractSubBarBtn {
	1:optional string text,
	2:optional string extra, // json 字符传
}

struct InteractSubBarContent {
	1:optional string text,
}

// new common label struct begin
struct GeneralLabelStruct {
  1: optional enum_type.LabelStrategy Strategy;          // 标签策略
  2: optional list<LabelCandidate> Candidates;           // 标签候选
  3: optional list<LabelCandidate> RightLabelCandidates; // 右侧标签候选 
}

struct WannaInterButtonStruct {
	1: optional string Desc; // button标识
	2: optional string ButtonSchema; // 跳转链接
}

struct LabelCandidate {
  1: required string BusinessId;                     // 唯一业务标识
  2: required i64 Priority;                          // 优先级
  3: required enum_type.LabelCandidateType Type;     // 标签类型
  4: optional StaticLabelInfo StaticLabel;           // 静态单标签
  5: optional DynamicLabelsInfo DynamicLabels;       // 动态多标签
  6: optional string LabelGroup; 					 //用于客户端绑定端上业务注入逻辑，优先级高于btn_name/business_id
  7: optional string LabelType;                     //标签类型
}

struct StaticLabelInfo {
  1: optional StaticLabelStyle Style;                  // 特定样式，覆盖预设模版
  2: optional list<LabelContainer> Containers;         // 容器列表
  3: optional list<LabelAction> Actions;               // 事件列表
  4: optional list<LabelData> Data;                    // deprecated list不符合规范，废弃，请使用datas
  5: optional string TrackingInfo;                     // 埋点信息 map<string, string>的json string
  6: optional list<LabelDataMap> DataMap;              // 数据map，新定义的数据和Action中的data_ref相关联
  7: optional list<LabelExternalEvent>  ExternalEvents // 外部监听事件，如拉黑等
}

struct LabelExternalEvent {
  1: required enum_type.LabelExternalEventType EventType;
}

struct DynamicLabelsInfo {
  1: optional list<StaticLabelInfo> Labels;       // 多标签的每个单独标签
  2: optional AnimationConfig Config;             // 动画配置相关
}

struct AnimationConfig {
  1: optional list<i32> PlayMillisecond;              // 每个标签播放时长
  2: optional enum_type.AnimationType animation_type; // 动画种类
}

struct StaticLabelStyle {
  1: optional i32 ContainerNumber;  // 容器个数
  2: optional list<i32> Padding;    // 容器间距
}

struct LabelContainer {
  1: optional string Id;                              // container的ID
  2: optional enum_type.ContainerTemplate Template;   // 预设内部结构
  3: optional ContainerStyle Style;                   // 样式
  4: optional list<LabelElement> Elements;            // 元素列表
  5: optional string EventId;                            // 绑定的事件ID
}

struct ContainerStyle {
  1: optional string Color;          // 背景颜色
  2: optional i32 Transparency;      // 背景透明度
  3: optional i32 BorderRadius;      // 圆角
  4: optional list<i32> Padding;     // 间距
  5: optional i32 Height;            // 高度
}

struct LabelElement {
  1: optional enum_type.LabelElementType Type;   // 元素的类型
  2: optional LabelTextInfo Text;                // 单文本结构
  3: optional LabelMultiTextsInfo MultiTexts;    // 多文本结构
  4: optional LabelMultiImagesInfo MultiImages;  // 多图结构
  5: optional string EventId;                    // 绑定action_id
  6: optional string DataRef;                    // 绑定数据
}

struct LabelTextInfo {
  1: optional string Content;           // 文本内容
  2: optional LabelTextStyle Style;     // 文本样式
}

struct LabelTextStyle {
  1: optional i32 Size;                                      // 字体大小
  2: optional bool Bold;                                     // 是否加粗
  3: optional enum_type.LabelTextOmitStrategy OmitStrategy;  // 省略策略
  4: optional i32 MaxCharacter;                              // 截断字符长度
  5: optional string FontColor;                              // 文本颜色
}

struct LabelMultiTextsInfo {
  1: optional list<LabelTextInfo> Texts;      // 多文本内容
  2: optional LabelMultiTextsStyle Style;     // 多文本样式
}

struct LabelMultiTextsStyle {
  1: optional enum_type.LabelTextsLayout Layout;  // 多文本布局
  2: optional list<i32> Padding;                  // 多文本间距
}

struct LabelImageInfo {
  1: optional UrlStruct Image;             // 图片url
  3: optional LabelImageStyle Style;       // 图片样式
}

struct LabelImageStyle {
  1: optional enum_type.LabelImageShape Shape;  // 图片形状
  2: optional i32 Size;                         // 图片尺寸
  3: optional string Color;                     // 图片颜色
  4: optional i32 Tansparency;                // 透明度
}

struct LabelMultiImagesInfo {
  1: optional list<LabelImageInfo> Images;          // 图片列表
  2: optional LabelMultiImagesStyle Style;          // 多图片样式
}

struct LabelMultiImagesStyle {
  1: optional enum_type.LabelMultiImageLayout Layout;   // 多图排布方式
  2: optional list<i32> Padding;                        // 图片间距
}

struct LabelAction {
  1: optional string EventId;                           // 事件ID
  2: optional enum_type.LabelActionEnum ActionType;     // 事件类型
  3: optional string Schema;                            // deprecated 后续用labelData中的schema
  4: optional list<string> Data;                        // deprecated 关联数据,后续采用data_ref
  5: optional string DataRef;                           // 数据索引，用于action和datas的绑定关系，通过索引找到LabelData map中的数据
}

struct LabelDataMap {              // 上层proto不支持map，通过list<k,v>实现map
	1: required string Key;
	2: required LabelData Data;
}

struct LabelData {
  1: optional CommentStruct Comment;             // depracated：评论，由于参数无法正常在api透传，废弃掉，请使用CommentList
  2: optional list<UserStruct> UserList;         // 关联User
  3: optional LabelCommentStruct RelatedComment; // depracated: 关联评论，请使用Commentist;
  4: optional string Schema;                     // 关联事件的schema
  5: optional list<CommentStruct> CommentList;   // 关联评论
  6: optional string RecommendReason;            // 推荐理由
  7: optional TabGuideLabelInfo TabGuideInfo;    // 频道引导 label 相关信息

  999: optional string Extra;                    // 其他
}

struct TabGuideLabelInfo {
	1: optional string ComponentID; // pizza 平台化组件 id
	2: optional string TargetTabID; // 要跳转的目标频道 id
	3: optional string ClientExtra; // 透传给客户端的 json 字符串
	4: optional string ReplaceLabelText;  // 含有占位符，用于替换label的文案，避免包含占位符的文案意外透出
}

struct MusicCardStruct {
  1: optional string SongID;                              
  2: optional MusicCardShareInfo ShareInfo;     // 分享信息
  3: optional string ArtistNames;   // 艺人名 
  4: optional list<LunaColorKV> LunaColor;   // 背景颜色                        
  5: optional string LyricID;   // 歌词id
  6: optional string SortLabelKey;   // 推荐原因标识
  7: optional string LabelText;   // 文案
  8: optional i32 Offset;   // clip偏移
  9: optional i32 TiggerDigg;   // 触发点赞 
  10: optional string FeData; // 前端数据                  
  11: optional string LabelSchema; // 文案跳转schema
  12: optional string LaterListenText; // 长按面板稍后听功能入口文案
  13: optional MusicCardUrlModel AlbumCover; // 音乐卡模版用专辑封面
  999: optional string Extra;                    // 其他
}

struct LunaColorKV {
    1: optional string Key;
    2: optional string Value;
}

struct MusicCardShareInfo {
    1: optional MusicCardUrlModel ShareCover; //分享封面
    2: optional string ShortShareLink; //分享短链
    3: optional string CommonDesc; //分享描述
	4: optional string OpenAnchorShareID;// 开屏锚点id
	5: optional string ShareLink; //分享长链
}

struct MusicCardUrlModel {
    1: optional string Uri;
    2: optional list<string> Urls;
    3: optional string TemplatePrefix;
}

struct FriendRecommendInfoStruct {
	1: optional double RecommendPredictScore; //推荐预估分
	2: optional double RecommendPredictRate;  //推荐预估分/当前刷Mean比值
	3: optional string IsFriendRecommend; // 社交传播内容埋点
}

// biz_server传递到risk
struct MusicCardTransStruct {
	// 统计数据
	1: optional i64 DiggCount;
	2: optional i64 CommentCount;
	3: optional i64 CollectCount;
	4: optional i64 ShareCount;
	// 状态数据
	5: optional bool IsDigged;
	6: optional bool IsCollected;
	// 原因
	7: optional string Reason;
}

struct ImageInsCreationInfo {
	1: optional string Title;
	2: optional string SubTitle;
	3: optional string Button;
	4: optional string Schema;
	5: optional i32  Type;
	6: optional UrlStruct Icon;
	7: optional string LogInfo;
	8: optional UrlStruct DarkIcon;
}

struct UserSubscribeStruct {
	1: optional bool IsSubscribeAuthor, // 当前用户是不是会员创作者
	2: optional bool IsSubscribeMember, // 请求用户是否订阅当前用户的会员
}

struct CommonBasicReasonStruct {
	1: required string ID;
	2: optional string ReasonText;
	3: optional ReasonIconStruct ReasonIcon;
	4: optional ReasonMetricsStruct ReasonMetrics;
}

struct ReasonMetricsStruct {
	1: optional string MetricsName;
}

struct ReasonIconStruct {
	1: optional string LiteUri;
	2: optional list<string> LiteUrls;
	3: optional string BlackUri;
	4: optional list<string> BlackUrls;
}

struct IMShortcutShareInfoStruct{
	1: optional i32 RecGroupType; // 是否是基于被分享去群召回的feed
	2: optional list<i64> RecGroupIdList; // 基于被分享群召回的feed，对应推荐的被分享群列表
}
// new common label struct end

// new common btn struct begin

struct CommonBtnStruct {
1:required list<CommonBtnInfoStruct> ButtonList
}
struct CommonBtnInfoStruct {
    1: required CommonBtnBasicInfoStruct BasicInfo //业务填充btn元数据
    2: required i64 Priority //优先级
   
} 

struct CommonBtnBasicInfoStruct {
    1: required string BtnName //业务唯一标识
    2: optional list<enum_type.BtnExemption> Exemptions // 1:频控，2：退场，3：反转实验
	3: required string BtnType // btn类型
	4: required enum_type.BtnUiStyleType BtnUiStyle //1:单btn样式 2: 双btn样式
    10: optional list<BtnUnit> Buttons
    11: optional list<BtnData> BtnDatas //业务数据透传
    12: optional string TracerInfo //业务埋点透传
    20: optional BtnTriggerStrategy TriggerStrategy // 触发时机
	21: optional string FreqExperimentKey // 频控实验策略key
	22: optional string ExitExperimentKey // 退场实验策略key
	23: optional string BtnGroup	      //用于客户端绑定端上业务注入逻辑，优先级高于btn_name/business_id
} 

struct BtnUnit {
    1: required BtnTextInfo Content //文案
    2: optional BtnIconInfo Icon // icon 
    3: optional enum_type.BtnPosition Position //icon 1：左 2:右
    4: optional BtnActionInfo  ClickAction //点击事件
    5: optional BtnContainerStyle ContainerStyle //btn单元样式
    6: optional enum_type.BtnExitType ExitType //btn单元退场 0:无退场动画 1:有退场 
    11:optional list<string> BtnDataKeys //需要用到btn组件的额外数据
      
}
struct BtnData{
    1:required string Key
    2:required string Value
}
struct BtnTriggerStrategy {
    1: optional list<enum_type.BtnTriggerAction> TriggerActions
    2: optional i32 PlayProgress
    3: optional enum_type.BtnAnimationType Animation//组件触发动画效果 0:默认动画 1:无动画
	4: optional i32 StayTime // 停留时长配置，单位：s，类型：int
    20:optional list<string> BtnDataKeys //需要用到btn组件的额外数据
}
struct BtnContainerStyle {
    1:optional string Color               // 背景颜色--使用
    2:optional i32 GradientType //背景渐变类型 0:不变 1:渐变默认红  
}
struct BtnTextInfo {
    1:required string Content          // 文本内容
}

 

struct BtnIconInfo {
    1:optional string IconId             // icon资源id
    2:optional UrlStruct IconUrl         //图片URI，
    3:optional enum_type.BtnPosition Position           // icon在btn单元中的位置 1:左 2:右
	
}


struct BtnActionInfo {
   1:  required enum_type.BtnClickAction ClickAction //点击行为
   2:  optional string Schema //相关schema
   3:  required enum_type.BtnBehaviorType  BehaviorType //点击行为类型 0:正常点击  1：负反馈点击行为
   20: optional list<string> BtnDataKeys //需要用到btn组件的额外数据
}
// btn end

// 锚点 begin
struct CommonAnchorStruct {
	1: required CommonAnchorBasicInfoStruct BasicInfo;
	100: optional list<AnchorSceneInfo> AnchorSceneInfoList, // 分场景锚点信息
}

struct CommonAnchorBasicInfoStruct {
    1: required string Name, //锚点名称跟anchor_type绑定
    2: required i32  Type, //锚点类型,标识同一类型的业务锚点
	3: optional string Id, //同一类型锚点下 不同的业务或者实体
	4: required AnchorIconInfo Icon,//锚点的icon
	5: optional AnchorTextInfo Title,//锚点 title
	6: optional AnchorTextInfo Desc,//锚点描述，描述锚点内容，服务的详细情况(一般不限字符数)
	7: optional AnchorTextInfo SubDesc,//附加描述，承载锚点内容本身更多的扩展信息，feed表示第二行描述
	8: optional AnchorTextInfo Suffix,//尾缀，对锚点类型的二级划分
	9: optional AnchorTextInfo FuncDesc,//行为区描述，可以进行 行为引导 的异化区域样式
	10: optional AnchorAnimation Animation ,//锚点动效 单变双动效，null表示无动效
	11: optional AnchorAction Action,//锚点 点击行为
	12: optional AnchorContainer Container,//容器背景
	30: optional string Extra,// 业务额外透传数据 json串，业务定义，业务解析
	31: optional string TracerInfo //业务埋点透传 json传，类型 map[]interface{}
} 

struct AnchorSceneInfo {
	1: required enum_type.AnchorSceneTypeEnum SceneType,	// 锚点展示场景
	2: required bool IsShow,								// 是否展示
	3: optional AnchorTextInfo SubDesc,						// 分场景异化的第二行附加描述
	4: optional AnchorTextInfo FuncDesc,					// 分场景异化的第二行行为区描述
	5: optional string LightIconUrl,						// 分场景异化的浅色模式锚点Icon
	6: optional string DarkIconUrl,							// 分场景异化的深色模式锚点Icon
	100: optional string TracerInfo,						// 分场景业务埋点透传 json串，类型 map[]interface{}
	101: optional string Extra,								// 分场景业务额外透传数据 json串，业务定义，业务解析
}

struct AnchorIconInfo {
    1:optional UrlStruct IconUrl, //图片URI，
  
}
struct AnchorAction {
    1:required string Schema,// 跳转shcema
	2:required enum_type.AnchorSchemaType SchemaType,//跳转方式 0:openUrl ，1:WebUrl 2:mpUrl
}

struct AnchorTextInfo {
    1:required string Content           // 文本内容 
	2:optional AnchorTextStyle TextStyle //文本样式
	3:optional AnchorTextBackGround  BackGround //背景样式，null 走端上兜底逻辑 （只有异化样式需要设置背景）
	4:optional AnchorPreSeparator PreSeparator //前置分隔符, null表示无前置分隔符， 如：desc前置分隔符 为“｜”,前缀的原因是分隔符跟随分隔符后面的文本样式一致
} 
struct AnchorTextStyle {
	1:optional i32 MaxLen,//最大字符数 （值 <= 0走端上默认）6
    2:optional i32 FontSize,//字体标准大小（后期大字模式端上统一乘以相应系数） 19,20 
    3:optional string FontColor, //"#AARRGGBB", //字体颜色,#AARRGGBB or #RRGGBB, AA为透明度，注意端上适配
	4:optional enum_type.AnchorTextBoldType Bold,//0:normal; 1 bold
	5:optional enum_type.AnchorEllipsisType Ellipsis,//截断方式，0 end, 1 middle, 2 start(默认0)
}
struct AnchorTextBackGround {
	1: optional i32 Radius ;//文本背景圆角
	2: optional string Color;//本本背景颜色,#AARRGGBB or #RRGGBB，AA为透明度，注意端上适配
}
struct AnchorPreSeparator {
  1: required enum_type.AnchorPreSeparatorType Type;//分隔符 0 无分隔符，1 竖杠 “｜” ， 2 圆点 “·”， 3 异化样式 从下面字段
  2: optional string DifferentialChar
}
struct AnchorContainer {
	1: optional i32 Radius ;//  容器背景圆角
	2: optional string Color;//容器背景颜色,#AARRGGBB or #RRGGBB，AA为透明度，注意端上适配
}
struct AnchorAnimation {
	1: required enum_type.AnchorAnimationType Type;//是否支持单变双动效,如果 type == Double && sub_desc != null 端上执行单变双
	2: optional i64 Delay;//Long  ms，delay毫秒后执行此动效
	3: optional i64 PlayProgress; // long ms 播放进度，毫秒（不受倍速影响）
}
// 锚点 end

struct LifeAnchorShowExtra  {
    1: optional i32 AnchorType, //锚点类型
    2: optional bool ShouldShow, //是否应该展示
    3: optional bool HasAnchorInfo, //锚点服务是否返回数据
    4: optional string AnchorNotShowReason, //无anchor返回的的原因
    5: optional string CommerceFilterReason, //commence过滤锚点的原因
    6: optional string Extra, //额外信息字段
}

// 小说评论区顶bar结构
struct NovelCommentBarStruct {
	1: optional string Type, // novel/fm/ ...
    2: optional string Icon, // 图标
	3: optional string Tag, // 左上标签
	4: optional string Title, // 标题文案(书名/别名)
	5: optional string Desc, // 描述
	6: optional string Extra, // 冗余信息
	7: optional i32 State, // 状态 0:可展 1:隐藏
	8: optional string DarkIcon, // 暗黑模式Icon
	9: optional string BookID, // 番茄内容id
	10: optional i32 Source, // 挂载来源
	11: optional string PopupData, // 弹窗数据
}

// 文娱UI配置  Iaa + 短剧会员 
struct EntertainmentUIConfig {
  1: optional list<EntertainmentButtonInfo>        FlowBottomButtons     // feed、内流底部按钮列表, 按照顺序展示
  2: optional list<EntertainmentButtonInfo>        BlockCardButtons      // 阻断卡底部按钮列表, 按照顺序展示
  3: optional EntertainmentItemLabel               ItemLabelInfo         // 视频标签
  4: optional PreviewConfig                        PreviewConfig          // 试看配置
  5: optional string                               MaskText               // 蒙层文案 
  6: optional EntertainmentItemLabel               UniversalCoverLabel   // 通用封面标签
  7: optional list<EntertainmentButtonInfo>        LandscapePreviewButtons  // 横屏试看按钮列表
  8: optional list<EntertainmentButtonInfo>        LandscapeBlockButtons    //  横屏阻断卡按钮列表
  9: optional EntertainmentBlockCardInfo           BlockCardInfo         // 阻断卡信息
} 
    
struct EntertainmentItemLabel {
    1: optional string                                    Text   // 标签文案
    2: optional enum_type.EntertainmentItemLabelType      Type   //  类型
}
     
struct EntertainmentButtonInfo {
    1: optional string                               Text      // 按钮文案
    2: optional enum_type.EntertainmentButtonType    Type      // 按钮类型
    3: optional string                               Schema    // 按钮链接     
}


struct EntVIPDataStruct {
  1: optional list<EntVIPConfig>        EntVIPConfigs       // 会员信息列表
  2: optional i32                       ChargeCount           // 付费集数量 
}

struct EntVIPConfig {
  1: optional enum_type.EntVIPType    VIPType           // 会员片库类型
  2: optional bool                    HasPaid           // 是否已开通
  3: optional i64                     ProductId         // 商品id
  4: optional string                  BuySchema         // 购买链接 
  5: optional string                  LibrarySchema     //  片库链接
}

struct ItemEntVIPChargeInfo {
  1: optional list<ItemEntVIPConfig>        EntVIPConfigs       // 会员信息列表
}

struct ItemEntVIPConfig {
  1: optional enum_type.EntVIPType    VIPType           // 会员片库类型
  2: optional bool                    HasPaid           // 是否已开通
}

struct ItemPreAccessChargeInfo {
  1: optional bool                    HasPaid           // 是否已开通
  2: optional string                  BrandId            // 广告主id
  3: optional string                  BrandName          // 广告主名
  4: optional i64                     StartTime          // 生效日期(时间戳，单位ms)
  5: optional i64                     EndTime            // 下线日期(时间戳，单位ms)
  6: optional list<string>            ShowReportLink     // 曝光上报链接
  7: optional list<string>            ClickReportLink    // 点击上报链接
}

struct FlameInteractiveStruct {
  1: optional i32 OrderStatus // 1 未领取 2已领取 3已过期
  2: optional string OrderStatusText,
  3: optional i32 OrderType,
  4: optional string OrderStatusSchema
}

// 文娱权益信息
struct ItemEntRightInfo {
  1: optional list<ItemEntRightDetail>        EntRrights       // 权益列表
}

struct ItemEntRightDetail {
  1: optional enum_type.ItemEntRightType      RightType           // 文娱权益类型
  2: optional enum_type.ItemEntRightStatus    RightStatus         // 文娱权益状态

}

struct EntertainmentBlockCardInfo{
    1: optional string                                    Title          // 主标题
    2: optional list<string>                              SubTitle       // 副标题
    3: optional list<string>                              TipText        // 提示信息
    4: optional UrlStruct                                 CoverUrl       // 封面图
    5: optional UrlStruct                                 TitleIconUrl   // 标题前的角标
}

struct PreAccessEpisodeInfo{
    1: optional EntButtonInfo                UnlockButtonInfo    // 解锁按钮信息
}

struct EntPreAccessDataStruct {
    1: optional i32                        ChargeCount        // 付费集数量 
    2: optional list<i32>                  ChargeEpisodes     // 哪些集付费
    3: optional string                     BrandId            // 广告主id
    4: optional string                     BrandName          // 广告主名
    5: optional i64                        StartTime          // 生效日期(时间戳，单位ms)
    6: optional i64                        EndTime            // 下线日期(时间戳，单位ms)
    7: optional list<string>               ShowReportLink     // 曝光上报链接
    8: optional list<string>               ClickReportLink    // 点击上报链接
    9: optional EntButtonInfo              UnlockButtonInfo   // 解锁按钮信息
    10:optional EntBlockCardInfo           BlockCardInfo      // 阻断卡信息
	11:optional i64                        PreviewDuration    // 试看时长，单位s
    12: optional map<i32,PreAccessEpisodeInfo>    EpisodeInfoMap     // 单集信息，key是集数
}

struct EntButtonInfo{
    1: optional string                      Text         // 按钮文案
    2: optional string                      Schema       // 按钮链接
}

struct EntBlockCardInfo {
    1: optional string                                    Title      // 主标题
    2: optional list<string>                              SubTitle   // 副标题
    3: optional list<string>                              TipText    // 提示信息
    4: optional UrlStruct                                 CoverUrl   // 封面图
}

struct SeriesUIConfig {
    1: optional EntButtonInfo              detail_page_buy_button,     // 详情页购买按钮
    2: optional EntButtonInfo              select_panel_buy_button,    // 选集面板购买按钮
} 

// 视频单集信息
struct ItemEpisodeInfo {
  1: optional i64         StartTimeMsec       // 播放开始时间
}

// new common btn struct end


// 音乐评论区顶bar强化数据
struct MusicCommentBarEnhanceTransData {
	1: optional i64         ObjID,
	2: optional enum_type.MusicObjType         ObjType,
	3: optional enum_type.MusicObjFrom         ObjFrom,
	// 
	4: optional string Name,
	5: optional string Author,
	6: optional list<string> CoverUrls,
	7: optional i64 CollectCount,
	8: optional bool IsSongFirstRelease
}

struct SelectBillboardExtraStruct {
	1: optional string RecText, // 推荐语
}
struct PoiKeyuserGuidTextConf {
  	1: optional string Text,
  	101: optional i32 FontSize,
	102: optional string TextColor,
}

struct PoiKeyuserFeedGuideStruct {
	1: optional i64 Times, //本次启动最多展示2次 如果为0则表示不展示
    2: optional string CardType, //卡片类型 支持扩展打点用,写死 "daren"
    3: optional PoiKeyuserGuidTextConf IconDesc, // 文案，你觉得这个地方怎么样
    4: optional UrlStruct Icon,
    5: optional string Title, // 标题
    6: optional PoiKeyuserGuidTextConf ButtonText, // 按钮文案
    7: optional string SchemaUrl, // 跳转schema
}

// 转发投稿相关信息
struct SharePostInfo {
	1: optional string ShareText, // 转发附言
	2: optional string ShareType, // 原发原始类型 video/image/live_room/music
	3: optional i32 IsOpenPlatform, // 是否来自开放平台
	4: optional string OpenPlatformKey, // 开放平台的client_key
}

// 创作者个人页内流视频诊断信息
struct CreatorDiagnoseSturct {
	1: optional i32     DiagnoseType,  // 诊断类型
	2: optional string  Icon,          // 图标
	3: optional string  Desc,          // 文案
	4: optional string  OutsideDesc,   // 外流页文案
	5: optional i32     DiagnoseStyle, // 实验样式
	6: optional string  Schema,        // 跳转链接
	7: optional string  TabDesc,       // Tab文案
	8: optional string  DisableExtra,  // 业务退场拓展字段
	9: optional string  TypeDesc,      // 仅埋点用，与type一一对应
	10: optional i32    Category       // 作品通知的六种类型 用于客户端做优先级判断
	11: optional i32    ResidentType   // 是否常驻 0-不常驻 1-常驻
	12: optional i32    PopupType      // 是否进入个人页自动弹起弹窗 0-否, 1-是
	13: optional string BizData  	   // 透传给创中面板的业务信息
	14: optional string BizLogExtra    // 用于携带埋点上报的业务信息
}

// 文娱节目使用的埋点信息
struct EntertainmentLogExtraStruct {
	1: optional string LogExtra, // 文娱埋点信息
	2: optional string FreeWatchFromChannels, // 免费看渠道埋点信息
}

// 精选榜单-用户信息
struct UserSelectExtraStruct {
	1: optional string RecText,	// 作者榜单-推荐语
}

struct SeriesHighlight {
	1: optional string ParentItemID,// 正片ItemID
	2: optional i64 ParentItemCreateTime,// 正片投稿时间
	3: optional i64 StartTimeMsec,// 起播点
	4: optional string AuthToken, // 高光参数加密token，基于正片item_id和高光item_id
}

struct GrantByStrategyConfig { 
  	1: optional string GrantStrategyType,//"iap_strategy_free"  "new_iaa_click_free_watch_btn" 
  	2: optional string Certificate,//鉴权信息
  	3: optional string Sign,//签名信息
  	4: optional i64 Timestamp,//当前时间戳
  	5: optional string SendUniqID,//发放权益的唯一标识 id类型+id
}

struct DouyinSelectRelatedStruct {
	1: optional string RelatedBarWord,  // 抖音精选相关推荐底bar入口词
}

struct GameTagSetStruct {
	1: optional bool IsGame,
	2: optional GameTagInfo GameNameTag,
	3: optional ContentTypeTagInfo ContentTypeTag,
}

struct GameTagInfo {
	1: optional i64 TagID,
	2: optional string TagName,
	3: optional list<string> GameIDList,
}

struct ContentTypeTagInfo {
	1: optional i64 TagID,
	2: optional string TagName,
}
struct ComponentControlInfo {
	1: required string DataSourceURL, //组件数据来源的页面，避免aweme覆盖后的非预期展示

}

struct AuthorAbStruct {
	1: optional list<i64> Vids, // 命中作者分流的实验组vid
	2: optional string Parameters, // AB参数
}
