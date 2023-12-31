
@extends('layouts.master')

@section('content')
    @include('layouts.inc.banner')

    <!-- Products -->
    <div class="container">


            <header class="mb-4">
                <h3 class="title-category">{{ $category->name }}</h3>
            </header>

            <div class="row justify-content-around">
                @foreach ($products as $product)
                    @if ($product->category_id == $category->id)
                        <div id="product-item" class="col-lg-2 col-md-5 col-sm-5 col-9">
                            <div class="item">
                                <div class="image">
                                    <a href="" class="link-product-detail">
                                        <img src="../uploads/{{ $product->image }}" alt="">
                                    </a>
                                </div>
                                <div class="content">
                                    <div class="name-product">
                                        <a class="product-link-detail" href="">
                                            <h5 class="card-text mb-2">{{ $product->name }}</h5>
                                        </a>
                                    </div>
                                    <div class="price-product">
                                        <h5 class="card-title mb-2 text-center">{{ number_format($product->price) }} VNĐ
                                        </h5>
                                    </div>
                                </div>
                                <div class="addcart">
                                    <a href="../product/{{ $product->id }}" class="btn btn-primary shadow-0 me-1">Add To
                                        Cart</a>
                                    <a href="#!" class="btn btn-light border px-2 pt-2 float-end icon-hover"><i
                                            class="fas fa-heart fa-lg px-1 tym"></i></a>
                                </div>
                            </div>
                        </div>
                    @endif
                @endforeach
            </div>
            <hr>

    </div>
    <!-- Products -->
@endsection
