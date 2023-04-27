<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function index(){
        return view('frontend.home');
    }

    public function categoryDetaill($id) {
        $category = Category::find($id);
        return view('frontend.categorydetail', compact('category'));
    }
    public function productdetail($id){
        $product = Product::find($id);
        return view('frontend.productdetail' ,compact('product'));
    }
    
    public function search(Request $request)
    {
        $query = $request->input('search');
        $productss = Product::where('name', 'like', '%'.$query.'%')->get();
        return view('search', compact('productss'));
    }
}
