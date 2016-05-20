<?php
/**
 * User: 李鹏飞 <523260513@qq.com>
 * Date: 2016/4/1
 * Time: 16:25
 */

use EasyWeChat\Foundation\Application;
use EasyWeChat\Payment\Order;

/* @var $app Application */
$app = require __DIR__ . '/../php/app.php';
$payment = $app->payment;

$result = ['status' => -1, 'message' => '参数错误'];

if(isset($_POST['detail'])){
    $detail = $_POST['detail'];
    $fee = $_POST['fee'];
    $attributes = [
        'body'             => $detail,
        'out_trade_no'     => date('YmdHis') . rand(1000, 9999),
        'total_fee'        => $fee,
        'trade_type'       => 'JSAPI',
    ];

    $order = new Order($attributes);

    $res = $payment->prepare($order);
    var_dump($res);die();
    $prepayId = $res->prepay_id;

    $result['status'] = 0;
    $result['message'] = '下单成功';
    $result['data'] = $prepayId;
}

header('Content-type: text/json');
echo json_encode($result);