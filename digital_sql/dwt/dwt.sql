-- dwt层
--访客主题
DROP TABLE IF EXISTS dwt_visitor_topic;
CREATE EXTERNAL TABLE dwt_visitor_topic
(
    `mid_id` STRING COMMENT '设备id',
    `brand` STRING COMMENT '手机品牌',
    `model` STRING COMMENT '手机型号',
    `channel` ARRAY<STRING> COMMENT '渠道',
    `os` ARRAY<STRING> COMMENT '操作系统',
    `area_code` ARRAY<STRING> COMMENT '地区ID',
    `version_code` ARRAY<STRING> COMMENT '应用版本',
    `visit_date_first` STRING  COMMENT '首次访问时间',
    `visit_date_last` STRING  COMMENT '末次访问时间',
    `visit_last_1d_count` BIGINT COMMENT '最近1日访问次数',
    `visit_last_1d_day_count` BIGINT COMMENT '最近1日访问天数',
    `visit_last_7d_count` BIGINT COMMENT '最近7日访问次数',
    `visit_last_7d_day_count` BIGINT COMMENT '最近7日访问天数',
    `visit_last_30d_count` BIGINT COMMENT '最近30日访问次数',
    `visit_last_30d_day_count` BIGINT COMMENT '最近30日访问天数',
    `visit_count` BIGINT COMMENT '累积访问次数',
    `visit_day_count` BIGINT COMMENT '累积访问天数'
) COMMENT '设备主题宽表'
PARTITIONED BY (`dt` STRING)
STORED AS PARQUET
LOCATION '/warehouse/gmall/dwt/dwt_visitor_topic'
TBLPROPERTIES ("parquet.compression"="lzo");
--用户主题
DROP TABLE IF EXISTS dwt_user_topic;
CREATE EXTERNAL TABLE dwt_user_topic
(
    `user_id` STRING  COMMENT '用户id',
    `login_date_first` STRING COMMENT '首次活跃日期',
    `login_date_last` STRING COMMENT '末次活跃日期',
    `login_date_1d_count` STRING COMMENT '最近1日登录次数',
    `login_last_1d_day_count` BIGINT COMMENT '最近1日登录天数',
    `login_last_7d_count` BIGINT COMMENT '最近7日登录次数',
    `login_last_7d_day_count` BIGINT COMMENT '最近7日登录天数',
    `login_last_30d_count` BIGINT COMMENT '最近30日登录次数',
    `login_last_30d_day_count` BIGINT COMMENT '最近30日登录天数',
    `login_count` BIGINT COMMENT '累积登录次数',
    `login_day_count` BIGINT COMMENT '累积登录天数',
    `order_date_first` STRING COMMENT '首次下单时间',
    `order_date_last` STRING COMMENT '末次下单时间',
    `order_last_1d_count` BIGINT COMMENT '最近1日下单次数',
    `order_activity_last_1d_count` BIGINT COMMENT '最近1日订单参与活动次数',
    `order_activity_reduce_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日订单减免金额(活动)',
    `order_coupon_last_1d_count` BIGINT COMMENT '最近1日下单用券次数',
    `order_coupon_reduce_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日订单减免金额(优惠券)',
    `order_last_1d_original_amount` DECIMAL(16,2) COMMENT '最近1日原始下单金额',
    `order_last_1d_final_amount` DECIMAL(16,2) COMMENT '最近1日最终下单金额',
    `order_last_7d_count` BIGINT COMMENT '最近7日下单次数',
    `order_activity_last_7d_count` BIGINT COMMENT '最近7日订单参与活动次数',
    `order_activity_reduce_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日订单减免金额(活动)',
    `order_coupon_last_7d_count` BIGINT COMMENT '最近7日下单用券次数',
    `order_coupon_reduce_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日订单减免金额(优惠券)',
    `order_last_7d_original_amount` DECIMAL(16,2) COMMENT '最近7日原始下单金额',
    `order_last_7d_final_amount` DECIMAL(16,2) COMMENT '最近7日最终下单金额',
    `order_last_30d_count` BIGINT COMMENT '最近30日下单次数',
    `order_activity_last_30d_count` BIGINT COMMENT '最近30日订单参与活动次数',
    `order_activity_reduce_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日订单减免金额(活动)',
    `order_coupon_last_30d_count` BIGINT COMMENT '最近30日下单用券次数',
    `order_coupon_reduce_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日订单减免金额(优惠券)',
    `order_last_30d_original_amount` DECIMAL(16,2) COMMENT '最近30日原始下单金额',
    `order_last_30d_final_amount` DECIMAL(16,2) COMMENT '最近30日最终下单金额',
    `order_count` BIGINT COMMENT '累积下单次数',
    `order_activity_count` BIGINT COMMENT '累积订单参与活动次数',
    `order_activity_reduce_amount` DECIMAL(16,2) COMMENT '累积订单减免金额(活动)',
    `order_coupon_count` BIGINT COMMENT '累积下单用券次数',
    `order_coupon_reduce_amount` DECIMAL(16,2) COMMENT '累积订单减免金额(优惠券)',
    `order_original_amount` DECIMAL(16,2) COMMENT '累积原始下单金额',
    `order_final_amount` DECIMAL(16,2) COMMENT '累积最终下单金额',
    `payment_date_first` STRING COMMENT '首次支付时间',
    `payment_date_last` STRING COMMENT '末次支付时间',
    `payment_last_1d_count` BIGINT COMMENT '最近1日支付次数',
    `payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日支付金额',
    `payment_last_7d_count` BIGINT COMMENT '最近7日支付次数',
    `payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日支付金额',
    `payment_last_30d_count` BIGINT COMMENT '最近30日支付次数',
    `payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日支付金额',
    `payment_count` BIGINT COMMENT '累积支付次数',
    `payment_amount` DECIMAL(16,2) COMMENT '累积支付金额',
    `refund_order_last_1d_count` BIGINT COMMENT '最近1日退单次数',
    `refund_order_last_1d_num` BIGINT COMMENT '最近1日退单件数',
    `refund_order_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日退单金额',
    `refund_order_last_7d_count` BIGINT COMMENT '最近7日退单次数',
    `refund_order_last_7d_num` BIGINT COMMENT '最近7日退单件数',
    `refund_order_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日退单金额',
    `refund_order_last_30d_count` BIGINT COMMENT '最近30日退单次数',
    `refund_order_last_30d_num` BIGINT COMMENT '最近30日退单件数',
    `refund_order_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日退单金额',
    `refund_order_count` BIGINT COMMENT '累积退单次数',
    `refund_order_num` BIGINT COMMENT '累积退单件数',
    `refund_order_amount` DECIMAL(16,2) COMMENT '累积退单金额',
    `refund_payment_last_1d_count` BIGINT COMMENT '最近1日退款次数',
    `refund_payment_last_1d_num` BIGINT COMMENT '最近1日退款件数',
    `refund_payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日退款金额',
    `refund_payment_last_7d_count` BIGINT COMMENT '最近7日退款次数',
    `refund_payment_last_7d_num` BIGINT COMMENT '最近7日退款件数',
    `refund_payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日退款金额',
    `refund_payment_last_30d_count` BIGINT COMMENT '最近30日退款次数',
    `refund_payment_last_30d_num` BIGINT COMMENT '最近30日退款件数',
    `refund_payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日退款金额',
    `refund_payment_count` BIGINT COMMENT '累积退款次数',
    `refund_payment_num` BIGINT COMMENT '累积退款件数',
    `refund_payment_amount` DECIMAL(16,2) COMMENT '累积退款金额',
    `cart_last_1d_count` BIGINT COMMENT '最近1日加入购物车次数',
    `cart_last_7d_count` BIGINT COMMENT '最近7日加入购物车次数',
    `cart_last_30d_count` BIGINT COMMENT '最近30日加入购物车次数',
    `cart_count` BIGINT COMMENT '累积加入购物车次数',
    `favor_last_1d_count` BIGINT COMMENT '最近1日收藏次数',
    `favor_last_7d_count` BIGINT COMMENT '最近7日收藏次数',
    `favor_last_30d_count` BIGINT COMMENT '最近30日收藏次数',
    `favor_count` BIGINT COMMENT '累积收藏次数',
    `coupon_last_1d_get_count` BIGINT COMMENT '最近1日领券次数',
    `coupon_last_1d_using_count` BIGINT COMMENT '最近1日用券(下单)次数',
    `coupon_last_1d_used_count` BIGINT COMMENT '最近1日用券(支付)次数',
    `coupon_last_7d_get_count` BIGINT COMMENT '最近7日领券次数',
    `coupon_last_7d_using_count` BIGINT COMMENT '最近7日用券(下单)次数',
    `coupon_last_7d_used_count` BIGINT COMMENT '最近7日用券(支付)次数',
    `coupon_last_30d_get_count` BIGINT COMMENT '最近30日领券次数',
    `coupon_last_30d_using_count` BIGINT COMMENT '最近30日用券(下单)次数',
    `coupon_last_30d_used_count` BIGINT COMMENT '最近30日用券(支付)次数',
    `coupon_get_count` BIGINT COMMENT '累积领券次数',
    `coupon_using_count` BIGINT COMMENT '累积用券(下单)次数',
    `coupon_used_count` BIGINT COMMENT '累积用券(支付)次数',
    `appraise_last_1d_good_count` BIGINT COMMENT '最近1日好评次数',
    `appraise_last_1d_mid_count` BIGINT COMMENT '最近1日中评次数',
    `appraise_last_1d_bad_count` BIGINT COMMENT '最近1日差评次数',
    `appraise_last_1d_default_count` BIGINT COMMENT '最近1日默认评价次数',
    `appraise_last_7d_good_count` BIGINT COMMENT '最近7日好评次数',
    `appraise_last_7d_mid_count` BIGINT COMMENT '最近7日中评次数',
    `appraise_last_7d_bad_count` BIGINT COMMENT '最近7日差评次数',
    `appraise_last_7d_default_count` BIGINT COMMENT '最近7日默认评价次数',
    `appraise_last_30d_good_count` BIGINT COMMENT '最近30日好评次数',
    `appraise_last_30d_mid_count` BIGINT COMMENT '最近30日中评次数',
    `appraise_last_30d_bad_count` BIGINT COMMENT '最近30日差评次数',
    `appraise_last_30d_default_count` BIGINT COMMENT '最近30日默认评价次数',
    `appraise_good_count` BIGINT COMMENT '累积好评次数',
    `appraise_mid_count` BIGINT COMMENT '累积中评次数',
    `appraise_bad_count` BIGINT COMMENT '累积差评次数',
    `appraise_default_count` BIGINT COMMENT '累积默认评价次数'
)COMMENT '会员主题宽表'
PARTITIONED BY (`dt` STRING)
STORED AS PARQUET
LOCATION '/warehouse/gmall/dwt/dwt_user_topic/'
TBLPROPERTIES ("parquet.compression"="lzo");
--商品主题
DROP TABLE IF EXISTS dwt_sku_topic;
CREATE EXTERNAL TABLE dwt_sku_topic
(
    `sku_id` STRING COMMENT 'sku_id',
    `order_last_1d_count` BIGINT COMMENT '最近1日被下单次数',
    `order_last_1d_num` BIGINT COMMENT '最近1日被下单件数',
    `order_activity_last_1d_count` BIGINT COMMENT '最近1日参与活动被下单次数',
    `order_coupon_last_1d_count` BIGINT COMMENT '最近1日使用优惠券被下单次数',
    `order_activity_reduce_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日优惠金额(活动)',
    `order_coupon_reduce_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日优惠金额(优惠券)',
    `order_last_1d_original_amount` DECIMAL(16,2) COMMENT '最近1日被下单原始金额',
    `order_last_1d_final_amount` DECIMAL(16,2) COMMENT '最近1日被下单最终金额',
    `order_last_7d_count` BIGINT COMMENT '最近7日被下单次数',
    `order_last_7d_num` BIGINT COMMENT '最近7日被下单件数',
    `order_activity_last_7d_count` BIGINT COMMENT '最近7日参与活动被下单次数',
    `order_coupon_last_7d_count` BIGINT COMMENT '最近7日使用优惠券被下单次数',
    `order_activity_reduce_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日优惠金额(活动)',
    `order_coupon_reduce_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日优惠金额(优惠券)',
    `order_last_7d_original_amount` DECIMAL(16,2) COMMENT '最近7日被下单原始金额',
    `order_last_7d_final_amount` DECIMAL(16,2) COMMENT '最近7日被下单最终金额',
    `order_last_30d_count` BIGINT COMMENT '最近30日被下单次数',
    `order_last_30d_num` BIGINT COMMENT '最近30日被下单件数',
    `order_activity_last_30d_count` BIGINT COMMENT '最近30日参与活动被下单次数',
    `order_coupon_last_30d_count` BIGINT COMMENT '最近30日使用优惠券被下单次数',
    `order_activity_reduce_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日优惠金额(活动)',
    `order_coupon_reduce_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日优惠金额(优惠券)',
    `order_last_30d_original_amount` DECIMAL(16,2) COMMENT '最近30日被下单原始金额',
    `order_last_30d_final_amount` DECIMAL(16,2) COMMENT '最近30日被下单最终金额',
    `order_count` BIGINT COMMENT '累积被下单次数',
    `order_num` BIGINT COMMENT '累积被下单件数',
    `order_activity_count` BIGINT COMMENT '累积参与活动被下单次数',
    `order_coupon_count` BIGINT COMMENT '累积使用优惠券被下单次数',
    `order_activity_reduce_amount` DECIMAL(16,2) COMMENT '累积优惠金额(活动)',
    `order_coupon_reduce_amount` DECIMAL(16,2) COMMENT '累积优惠金额(优惠券)',
    `order_original_amount` DECIMAL(16,2) COMMENT '累积被下单原始金额',
    `order_final_amount` DECIMAL(16,2) COMMENT '累积被下单最终金额',
    `payment_last_1d_count` BIGINT COMMENT '最近1日被支付次数',
    `payment_last_1d_num` BIGINT COMMENT '最近1日被支付件数',
    `payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日被支付金额',
    `payment_last_7d_count` BIGINT COMMENT '最近7日被支付次数',
    `payment_last_7d_num` BIGINT COMMENT '最近7日被支付件数',
    `payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日被支付金额',
    `payment_last_30d_count` BIGINT COMMENT '最近30日被支付次数',
    `payment_last_30d_num` BIGINT COMMENT '最近30日被支付件数',
    `payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日被支付金额',
    `payment_count` BIGINT COMMENT '累积被支付次数',
    `payment_num` BIGINT COMMENT '累积被支付件数',
    `payment_amount` DECIMAL(16,2) COMMENT '累积被支付金额',
    `refund_order_last_1d_count` BIGINT COMMENT '最近1日退单次数',
    `refund_order_last_1d_num` BIGINT COMMENT '最近1日退单件数',
    `refund_order_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日退单金额',
    `refund_order_last_7d_count` BIGINT COMMENT '最近7日退单次数',
    `refund_order_last_7d_num` BIGINT COMMENT '最近7日退单件数',
    `refund_order_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日退单金额',
    `refund_order_last_30d_count` BIGINT COMMENT '最近30日退单次数',
    `refund_order_last_30d_num` BIGINT COMMENT '最近30日退单件数',
    `refund_order_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日退单金额',
    `refund_order_count` BIGINT COMMENT '累积退单次数',
    `refund_order_num` BIGINT COMMENT '累积退单件数',
    `refund_order_amount` DECIMAL(16,2) COMMENT '累积退单金额',
    `refund_payment_last_1d_count` BIGINT COMMENT '最近1日退款次数',
    `refund_payment_last_1d_num` BIGINT COMMENT '最近1日退款件数',
    `refund_payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日退款金额',
    `refund_payment_last_7d_count` BIGINT COMMENT '最近7日退款次数',
    `refund_payment_last_7d_num` BIGINT COMMENT '最近7日退款件数',
    `refund_payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日退款金额',
    `refund_payment_last_30d_count` BIGINT COMMENT '最近30日退款次数',
    `refund_payment_last_30d_num` BIGINT COMMENT '最近30日退款件数',
    `refund_payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日退款金额',
    `refund_payment_count` BIGINT COMMENT '累积退款次数',
    `refund_payment_num` BIGINT COMMENT '累积退款件数',
    `refund_payment_amount` DECIMAL(16,2) COMMENT '累积退款金额',
    `cart_last_1d_count` BIGINT COMMENT '最近1日被加入购物车次数',
    `cart_last_7d_count` BIGINT COMMENT '最近7日被加入购物车次数',
    `cart_last_30d_count` BIGINT COMMENT '最近30日被加入购物车次数',
    `cart_count` BIGINT COMMENT '累积被加入购物车次数',
    `favor_last_1d_count` BIGINT COMMENT '最近1日被收藏次数',
    `favor_last_7d_count` BIGINT COMMENT '最近7日被收藏次数',
    `favor_last_30d_count` BIGINT COMMENT '最近30日被收藏次数',
    `favor_count` BIGINT COMMENT '累积被收藏次数',
    `appraise_last_1d_good_count` BIGINT COMMENT '最近1日好评数',
    `appraise_last_1d_mid_count` BIGINT COMMENT '最近1日中评数',
    `appraise_last_1d_bad_count` BIGINT COMMENT '最近1日差评数',
    `appraise_last_1d_default_count` BIGINT COMMENT '最近1日默认评价数',
    `appraise_last_7d_good_count` BIGINT COMMENT '最近7日好评数',
    `appraise_last_7d_mid_count` BIGINT COMMENT '最近7日中评数',
    `appraise_last_7d_bad_count` BIGINT COMMENT '最近7日差评数',
    `appraise_last_7d_default_count` BIGINT COMMENT '最近7日默认评价数',
    `appraise_last_30d_good_count` BIGINT COMMENT '最近30日好评数',
    `appraise_last_30d_mid_count` BIGINT COMMENT '最近30日中评数',
    `appraise_last_30d_bad_count` BIGINT COMMENT '最近30日差评数',
    `appraise_last_30d_default_count` BIGINT COMMENT '最近30日默认评价数',
    `appraise_good_count` BIGINT COMMENT '累积好评数',
    `appraise_mid_count` BIGINT COMMENT '累积中评数',
    `appraise_bad_count` BIGINT COMMENT '累积差评数',
    `appraise_default_count` BIGINT COMMENT '累积默认评价数'
 )COMMENT '商品主题宽表'
PARTITIONED BY (`dt` STRING)
STORED AS PARQUET
LOCATION '/warehouse/gmall/dwt/dwt_sku_topic/'
TBLPROPERTIES ("parquet.compression"="lzo");
--优惠券主题
DROP TABLE IF EXISTS dwt_coupon_topic;
CREATE EXTERNAL TABLE dwt_coupon_topic(
    `coupon_id` STRING COMMENT '优惠券ID',
    `get_last_1d_count` BIGINT COMMENT '最近1日领取次数',
    `get_last_7d_count` BIGINT COMMENT '最近7日领取次数',
    `get_last_30d_count` BIGINT COMMENT '最近30日领取次数',
    `get_count` BIGINT COMMENT '累积领取次数',
    `order_last_1d_count` BIGINT COMMENT '最近1日使用某券下单次数',
    `order_last_1d_reduce_amount` DECIMAL(16,2) COMMENT '最近1日使用某券下单优惠金额',
    `order_last_1d_original_amount` DECIMAL(16,2) COMMENT '最近1日使用某券下单原始金额',
    `order_last_1d_final_amount` DECIMAL(16,2) COMMENT '最近1日使用某券下单最终金额',
    `order_last_7d_count` BIGINT COMMENT '最近7日使用某券下单次数',
    `order_last_7d_reduce_amount` DECIMAL(16,2) COMMENT '最近7日使用某券下单优惠金额',
    `order_last_7d_original_amount` DECIMAL(16,2) COMMENT '最近7日使用某券下单原始金额',
    `order_last_7d_final_amount` DECIMAL(16,2) COMMENT '最近7日使用某券下单最终金额',
    `order_last_30d_count` BIGINT COMMENT '最近30日使用某券下单次数',
    `order_last_30d_reduce_amount` DECIMAL(16,2) COMMENT '最近30日使用某券下单优惠金额',
    `order_last_30d_original_amount` DECIMAL(16,2) COMMENT '最近30日使用某券下单原始金额',
    `order_last_30d_final_amount` DECIMAL(16,2) COMMENT '最近30日使用某券下单最终金额',
    `order_count` BIGINT COMMENT '累积使用(下单)次数',
    `order_reduce_amount` DECIMAL(16,2) COMMENT '使用某券累积下单优惠金额',
    `order_original_amount` DECIMAL(16,2) COMMENT '使用某券累积下单原始金额',
    `order_final_amount` DECIMAL(16,2) COMMENT '使用某券累积下单最终金额',
    `payment_last_1d_count` BIGINT COMMENT '最近1日使用某券支付次数',
    `payment_last_1d_reduce_amount` DECIMAL(16,2) COMMENT '最近1日使用某券优惠金额',
    `payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日使用某券支付金额',
    `payment_last_7d_count` BIGINT COMMENT '最近7日使用某券支付次数',
    `payment_last_7d_reduce_amount` DECIMAL(16,2) COMMENT '最近7日使用某券优惠金额',
    `payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7日使用某券支付金额',
    `payment_last_30d_count` BIGINT COMMENT '最近30日使用某券支付次数',
    `payment_last_30d_reduce_amount` DECIMAL(16,2) COMMENT '最近30日使用某券优惠金额',
    `payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30日使用某券支付金额',
    `payment_count` BIGINT COMMENT '累积使用(支付)次数',
    `payment_reduce_amount` DECIMAL(16,2) COMMENT '使用某券累积优惠金额',
    `payment_amount` DECIMAL(16,2) COMMENT '使用某券累积支付金额',
    `expire_last_1d_count` BIGINT COMMENT '最近1日过期次数',
    `expire_last_7d_count` BIGINT COMMENT '最近7日过期次数',
    `expire_last_30d_count` BIGINT COMMENT '最近30日过期次数',
    `expire_count` BIGINT COMMENT '累积过期次数'
)comment '优惠券主题表'
PARTITIONED BY (`dt` STRING)
STORED AS PARQUET
LOCATION '/warehouse/gmall/dwt/dwt_coupon_topic/'
TBLPROPERTIES ("parquet.compression"="lzo");
--活动主题
DROP TABLE IF EXISTS dwt_activity_topic;
CREATE EXTERNAL TABLE dwt_activity_topic(
    `activity_rule_id` STRING COMMENT '活动规则ID',
    `activity_id` STRING  COMMENT '活动ID',
    `order_last_1d_count` BIGINT COMMENT '最近1日参与某活动某规则下单次数',
    `order_last_1d_reduce_amount` DECIMAL(16,2) COMMENT '最近1日参与某活动某规则下单优惠金额',
    `order_last_1d_original_amount` DECIMAL(16,2) COMMENT '最近1日参与某活动某规则下单原始金额',
    `order_last_1d_final_amount` DECIMAL(16,2) COMMENT '最近1日参与某活动某规则下单最终金额',
    `order_count` BIGINT COMMENT '参与某活动某规则累积下单次数',
    `order_reduce_amount` DECIMAL(16,2) COMMENT '参与某活动某规则累积下单优惠金额',
    `order_original_amount` DECIMAL(16,2) COMMENT '参与某活动某规则累积下单原始金额',
    `order_final_amount` DECIMAL(16,2) COMMENT '参与某活动某规则累积下单最终金额',
    `payment_last_1d_count` BIGINT COMMENT '最近1日参与某活动某规则支付次数',
    `payment_last_1d_reduce_amount` DECIMAL(16,2) COMMENT '最近1日参与某活动某规则支付优惠金额',
    `payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1日参与某活动某规则支付金额',
    `payment_count` BIGINT COMMENT '参与某活动某规则累积支付次数',
    `payment_reduce_amount` DECIMAL(16,2) COMMENT '参与某活动某规则累积支付优惠金额',
    `payment_amount` DECIMAL(16,2) COMMENT '参与某活动某规则累积支付金额'
) COMMENT '活动主题宽表'
PARTITIONED BY (`dt` STRING)
STORED AS PARQUET
LOCATION '/warehouse/gmall/dwt/dwt_activity_topic/'
TBLPROPERTIES ("parquet.compression"="lzo");
--地区主题
DROP TABLE IF EXISTS dwt_area_topic;
CREATE EXTERNAL TABLE dwt_area_topic(
    `province_id` STRING COMMENT '编号',
    `visit_last_1d_count` BIGINT COMMENT '最近1日访客访问次数',
    `login_last_1d_count` BIGINT COMMENT '最近1日用户访问次数',
    `visit_last_7d_count` BIGINT COMMENT '最近7访客访问次数',
    `login_last_7d_count` BIGINT COMMENT '最近7日用户访问次数',
    `visit_last_30d_count` BIGINT COMMENT '最近30日访客访问次数',
    `login_last_30d_count` BIGINT COMMENT '最近30日用户访问次数',
    `visit_count` BIGINT COMMENT '累积访客访问次数',
    `login_count` BIGINT COMMENT '累积用户访问次数',
    `order_last_1d_count` BIGINT COMMENT '最近1天下单次数',
    `order_last_1d_original_amount` DECIMAL(16,2) COMMENT '最近1天下单原始金额',
    `order_last_1d_final_amount` DECIMAL(16,2) COMMENT '最近1天下单最终金额',
    `order_last_7d_count` BIGINT COMMENT '最近7天下单次数',
    `order_last_7d_original_amount` DECIMAL(16,2) COMMENT '最近7天下单原始金额',
    `order_last_7d_final_amount` DECIMAL(16,2) COMMENT '最近7天下单最终金额',
    `order_last_30d_count` BIGINT COMMENT '最近30天下单次数',
    `order_last_30d_original_amount` DECIMAL(16,2) COMMENT '最近30天下单原始金额',
    `order_last_30d_final_amount` DECIMAL(16,2) COMMENT '最近30天下单最终金额',
    `order_count` BIGINT COMMENT '累积下单次数',
    `order_original_amount` DECIMAL(16,2) COMMENT '累积下单原始金额',
    `order_final_amount` DECIMAL(16,2) COMMENT '累积下单最终金额',
    `payment_last_1d_count` BIGINT COMMENT '最近1天支付次数',
    `payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1天支付金额',
    `payment_last_7d_count` BIGINT COMMENT '最近7天支付次数',
    `payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7天支付金额',
    `payment_last_30d_count` BIGINT COMMENT '最近30天支付次数',
    `payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30天支付金额',
    `payment_count` BIGINT COMMENT '累积支付次数',
    `payment_amount` DECIMAL(16,2) COMMENT '累积支付金额',
    `refund_order_last_1d_count` BIGINT COMMENT '最近1天退单次数',
    `refund_order_last_1d_amount` DECIMAL(16,2) COMMENT '最近1天退单金额',
    `refund_order_last_7d_count` BIGINT COMMENT '最近7天退单次数',
    `refund_order_last_7d_amount` DECIMAL(16,2) COMMENT '最近7天退单金额',
    `refund_order_last_30d_count` BIGINT COMMENT '最近30天退单次数',
    `refund_order_last_30d_amount` DECIMAL(16,2) COMMENT '最近30天退单金额',
    `refund_order_count` BIGINT COMMENT '累积退单次数',
    `refund_order_amount` DECIMAL(16,2) COMMENT '累积退单金额',
    `refund_payment_last_1d_count` BIGINT COMMENT '最近1天退款次数',
    `refund_payment_last_1d_amount` DECIMAL(16,2) COMMENT '最近1天退款金额',
    `refund_payment_last_7d_count` BIGINT COMMENT '最近7天退款次数',
    `refund_payment_last_7d_amount` DECIMAL(16,2) COMMENT '最近7天退款金额',
    `refund_payment_last_30d_count` BIGINT COMMENT '最近30天退款次数',
    `refund_payment_last_30d_amount` DECIMAL(16,2) COMMENT '最近30天退款金额',
    `refund_payment_count` BIGINT COMMENT '累积退款次数',
    `refund_payment_amount` DECIMAL(16,2) COMMENT '累积退款金额'
) COMMENT '地区主题宽表'
PARTITIONED BY (`dt` STRING)
STORED AS PARQUET
LOCATION '/warehouse/gmall/dwt/dwt_area_topic/'
TBLPROPERTIES ("parquet.compression"="lzo");