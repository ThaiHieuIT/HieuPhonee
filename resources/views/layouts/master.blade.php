<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{asset('frontend/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('/css/custom.css')}}">
    <link rel="stylesheet" href="{{asset('/css/login.css')}}">
    <link rel="stylesheet" href="{{asset('/css/productdetail.css')}}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<body>
    @include('layouts.inc.navbar')

        @yield('content')

    @include('layouts.inc.footer')



    <script src="{{asset('frontend/js/bootstrap.min.js')}}"></script> 
    <script src="{{asset('frontend/js/main.js')}}"></script>
</body>
</html>