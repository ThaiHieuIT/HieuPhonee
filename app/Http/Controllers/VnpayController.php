<?php

namespace App\Http\Controllers;


use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Vnpay;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;


class VnpayController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    public function vnpay_payment(Request $request)
    {
        $data = $request->all();
        $randomCode = Str::random(11);
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = "http://127.0.0.1:8000/thank-you";
        $vnp_TmnCode = "ZGEXVAHU"; //Mã website tại VNPAY 
        $vnp_HashSecret = "BHNPJCBZDOSMGZULIWFKXSKYEWSBSJQH"; //Chuỗi bí mật

        $vnp_TxnRef = $randomCode; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = "Thanh toán hóa đơn";
        $vnp_OrderType = "HieuPhone";
        $vnp_Amount = $data['total'] * 100;
        $vnp_Locale = "VN";
        $vnp_BankCode = "NCB";
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];

        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,

        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
            $inputData['vnp_Bill_State'] = $vnp_Bill_State;
        }

        //var_dump($inputData);
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret); //  
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        $returnData = array(
            'code' => '00'
            ,
            'message' => 'success'
            ,
            'data' => $vnp_Url
        );
        if (isset($_POST['redirect'])) {
            header('Location: ' . $vnp_Url);
            die();
        } else {
            echo json_encode($returnData);

        }
        // vui lòng tham khảo thêm tại code demo
    }
    public function thank_you(Request $request)
    {
        $cart = session()->get('cart');


        if (empty($cart) && !isset($_GET['vnp_ResponseCode'])) {
            return redirect('/');
        }

        $vnpay = new Vnpay();
        $vnpay->vnp_Amount = $_GET['vnp_Amount'];
        $vnpay->vnp_BankCode = $_GET['vnp_BankCode'];
        $vnpay->vnp_CardType = $_GET['vnp_CardType'];
        $vnpay->vnp_OrderInfo = $_GET['vnp_OrderInfo'];
        $vnpay->vnp_PayDate = $_GET['vnp_PayDate'];
        $vnpay->vnp_ResponseCode = $_GET['vnp_ResponseCode'];
        $vnpay->vnp_TmnCode = $_GET['vnp_TmnCode'];
        $vnpay->vnp_TransactionStatus = $_GET['vnp_TransactionStatus'];
        $vnpay->vnp_TxnRef = $_GET['vnp_TxnRef'];
        $vnpay->vnp_SecureHash = $_GET['vnp_SecureHash'];

        $vnpay->save();

        $order = new Order();
        $order->code = $_GET['vnp_TxnRef'];
        $order->user_id = Auth::user()->id;
        $order->status = 1;
        $order->payment_method = "ATM vnpay";
        $order->address = Auth::user()->phone;
        $order->save();

        
        foreach ($cart as $item) {
            OrderDetail::create([
                'order_id' => $order->id,
                'product_id' => $item['prid'],
                'price' => $item['price'],
                'quantity' => $item['quantity'],
            ]);
        }
        $cart= session()->forget('cart');



        return view('frontend.thankyou');

    }

}
