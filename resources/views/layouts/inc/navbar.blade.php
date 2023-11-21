<div class="container-fluid header mb-3">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="row container-fluid">
                        <div class="col-md-2 navbar-logo">
                            {{-- Logo --}}
                            <a class="navbar-brand" href="/">
                                <img src="{{ asset('/frontend/icon/logo.png') }}" alt="">
                            </a>
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            {{-- End Logo --}}
                        </div>

                        <div class="collapse navbar-collapse col-md-10 row" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto navbar-right mb-md-12">

                                <!-- Danh Mục -->
                                <li class="nav-item dropdown navbar-link col-md-2">
                                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="far fa-list-alt"></i> Danh Mục
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="padding: 10px;">
                                        @foreach ($categorys as $category)
                                        <li style="display: flex; margin:10px 0">
                                            <img src="../uploads/{{ $category->images }}" alt="" style="width:35px; height:35px;">
                                            <a class="dropdown-item" href="../category/{{ $category->id }}">{{ $category->name }}</a>
                                        </li>
                                        @endforeach
                                    </ul>
                                </li>

                                <!-- Search -->
                                <form class="d-flex a col-md-5" action="{{ route('search') }}" method="GET">
                                    <input class="form-control me-2" type="text" placeholder="Search" aria-label="Search" name="search">
                                    <button class="btn btn-outline-success" style="border: 1px solid #fff; color:#fff;" type="submit">Search</button>
                                </form>

                                <!-- Cửa Hàng -->
                                <li class="nav-item dropdown navbar-link col-md-2 ">
                                    <a class="nav-link dropdown" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="fa-solid fa-location-dot"></i> Cửa hàng
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <a class="dropdown-item" href="#">Hà Nội</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">Huế</a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="#">HCM</a>
                                        </li>
                                    </ul>
                                </li>




                                <!-- Cart -->
                                <li class="nav-item col-md-1">
                                    <a href="/cart" class="nav-link">
                                        <i class="fa-solid fa-bag-shopping cart" value="
                                        @php
                                            if(Session::has('cart')){
                                                $cart = session('cart');
                                                echo count($cart);
                                            }else {
                                                echo '0';
                                            } 
                                        @endphp
                                        " style="color: #ffffff;"></i>
                                    </a>
                                </li>



                                <!-- Login -->
                                <ul class="navbar-nav ms-auto col-md-2">
                                    @guest
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown navbar-link" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="fas fa-user"></i>
                                            <p style="margin: 0; color:#ffffff;">Đăng Nhập</p>
                                        </a>
                                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            @if (Route::has('login'))
                                            <li class="nav-item">
                                                <a class="nav-link navbar-link my-2" href="{{ route('login') }}">{{ __('Login') }}</a>
                                            </li>
                                            @endif

                                            @if (Route::has('register'))
                                            <li class="nav-item">
                                                <a class="nav-link navbar-link my-2" href="{{ route('register') }}">{{ __('Register') }}</a>
                                            </li>
                                            @endif
                                        </ul>
                                    </li>
                                    @else
                                    <li class="nav-item dropdown" style="justify-content: center;">
                                        <a id="navbarDropdown" class="nav-link dropdown-toggle navbar-link" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                            {{ Auth::user()->name }}
                                        </a>
                                    <div class="dropdown-menu dropdown-menu-end " aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item navbar-link nav-logout" href="{{ route('logout') }}" onclick="event.preventDefault();
                                                                 document.getElementById('logout-form').submit();">
                                            {{ __('Logout') }}
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                            @csrf
                                        </form>
                                    </div>
                                    </li>
                                    @if (Auth::user()->id == 1) 
                                            <li style="display: flex; margin:10px 0" class="nav-item dropdown">
                                                <a class="nav-link dropdown navbar-link" href="/admin">Admin</a>
                                            </li>
                                    @endif
                                    @endguest
                                </ul>
                            </ul>
                        </div>
                    </div>
                    <!-- end -->
                </nav>
            </div>
        </div>
    </div>
</div>