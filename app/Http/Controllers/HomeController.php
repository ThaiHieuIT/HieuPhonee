<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use App\Models\Product;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    
    public function addCart($id){
        $product = Product::find($id);
        $product -> quantity = 1;
        $kt = 0;
        if (Session::has('products')) {
            $products = session('products');
            foreach ($products as $p) {
                if ($p->id == $id) {
                    $p->quantity++; $kt=1;
                }
            }
        }else {
            $products = [];
        }
        if ($kt == 0) {
            $products[] = $product; 
        }
        Session::forget('products');
        Session::put('products', $products);
        return redirect('/')->with('status', 'Profile updated!');
    }
    public function cart()
    {
        return view('cart');
    }

    public function deleteCart($id)
    {
        $products = session('products');
        $arr = [];
        foreach ($products as $p) {
            if ($p->id != $id) {
                $arr[]=$p;
            }
        }
        Session::forget('products');
        Session::put('products', $arr);
        return redirect('/cart');
    }

}
