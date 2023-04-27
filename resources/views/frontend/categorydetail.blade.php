{{-- @extends('layouts.master')
@section('title', 'Home')
@section('content')

    <!-- Products -->
    <div class="container">
        <div class="row">
            <section>
                <div class="container my-5">
                    <header class="mb-4">
                        <h3>{{ $category->name }}</h3>
                    </header>

                    <div class="row">
                        @foreach ($products as $product)
                            @if ($product->category_id == $category->id)
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <div class="card my-2 shadow-0">
                                        <a href="#" class="img-wrap">
                                            <div class="mask" style="height: 50px;">
                                                <div class="d-flex justify-content-start align-items-start h-100 m-2">
                                                    <h6><span class="badge bg-success pt-2">Offer</span></h6>
                                                </div>
                                            </div>
                                            <img src="../uploads/{{ $product->image }}" class="card-img-top"
                                                style="aspect-ratio: 1 / 1; width: 100%; height:100%;">
                                        </a>
                                        <div class="card-body p-0 pt-3">
                                            <h5 class="card-text mb-0">{{ $product->name }}</h5>
                                            <h5 class="card-title">{{ number_format($product->price) }} VNĐ</h5>
                                            <p class="text-muted">
                                                @if ($product->status == true)
                                                    <h6>Hàng Mới</h6>
                                                @else
                                                    <h6>Hàng Cũ</h6>
                                                @endif
                                            </p>
                                            <div class="cart-product">
                                                <a href="#!" class="btn btn-primary shadow-0 me-1">Add To Cart</a>
                                                <a href="#!"
                                                    class="btn btn-light border px-2 pt-2 float-end icon-hover"><i
                                                        class="fas fa-heart fa-lg px-1 text-secondary"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif
                    @endforeach
                </div>
            </section>
        </div>
    </div>
    <!-- Products -->
    @include('layouts.inc.footer')

@endsection --}}
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
                                            class="fas fa-heart fa-lg px-1 text-secondary"></i></a>
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
