@extends('layouts.master')

@section('content')
    {{-- @foreach ($products as $product) --}}
        {{-- @if () --}}
        <section>
            <div class="containerr flexx">
                <div class="left">
                    <div class="main_image">
                        <img src="../uploads/{{$product->image}}" class="slide">
                    </div>
                </div>
                <div class="right">
                    <h3>{{$product->name}}</h3>
                    <h4> {{number_format($product->price)}} <small>VNĐ</small></h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                        et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                        aliquip ex ea commodo consequat. </p>
                    <h5>Color-Rose Gold</h5>
                    <div class="color flex1">
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>
                    <h5>Number</h5>
                    <div class="add flex1">
                        <span>-</span>
                        <span>1</span>
                        <span>+</span>
                    </div>
                    <a href="../product/{{$product->id}}}" class="btn btn-primary addtocart">Add to cart</a>

                </div>
            </div>
        </section>
        {{-- @endif --}}
    {{-- @endforeach --}}
@endsection
