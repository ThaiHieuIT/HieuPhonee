@extends('layouts.master')

@section('content')
<div class="container all-padding" style="height: 600px;padding: 200px 0;">
    <div class="row justify-content-center">
        <div class="col-md-3 login-img">
            <img src="../uploads/files/login.svg" alt="">
        </div>
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">{{ __('Login') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">{{ __('Email Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="text" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="password" class="col-md-4 col-form-label text-md-end">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6 offset-md-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="row mb-0">
                            <div class="col-md-8 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Login') }}
                                </button>

                                @if (Route::has('password.request'))
                                <a class="btn btn-link" href="{{ route('password.request') }}">
                                    {{ __('Forgot Your Password?') }}
                                </a>
                                @endif
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- <div class="box">
    <div class="container box-login">
        <div class="top">
            <span class="text-login">Have an account?</span>
            <h1 class="title-login">Login</h1>
        </div>
        <form method="POST" action="{{ route('login') }}">
            <div class="input-field">
                <i class="icons-login fa-solid fa-user"></i>
                <input type="text" class=" col-md-10 input-login" placeholder="Username" id="">
            </div>
            <div class="input-field">
                <i class="icons-login fa-solid fa-lock"></i>
                <input type="Password" class="input-login" placeholder="Password" id="">
            </div>
            <div class="input-field">
                <input type="submit" class="submit-login" value="Login" id="">
            </div>
        </form>
        <div class="two-col">
            <div class="one">
                <input type="checkbox" name="" id="check">
                <label for="check"> Remember Me</label>
            </div>
            <div class="two">
                <label><a href="#">Forgot password?</a></label>
            </div>
        </div>
    </div>
</div> -->
@endsection