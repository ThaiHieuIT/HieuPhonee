@extends('layouts.master')
@section('content')
<div class="all-padding">
  <section class="h-100 gradient-custom">
    <div class="container py-5">
      <div class="row d-flex justify-content-center my-4">
        <div class="col-md-8">
          <div class="card mb-4">
            <div class="card-header py-3">
              <h5 class="mb-0">Cart</h5>
            </div>
            <div class="card-body">
              @php $total = 0 @endphp
              @if(session('cart'))
              @foreach(session('cart') as $id=> $details)
              @php $total += $details['price'] * $details['quantity']; @endphp

              <div class="row" data-id="{{$id}}">
                <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                  <!-- Image -->
                  <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                    <img src="../uploads/{{ $details['image'] }}" class="w-100" alt="Blue Jeans Jacket" />
                    <a href="#!">
                      <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                    </a>
                  </div>
                  <!-- Image -->
                </div>

                <div class="col-lg-5 col-md-6 mb-4 mb-lg-0" data-id="{{$id}}">
                  <!-- Data -->
                  <p><strong>{{ $details['name'] }}</strong></p>

                  <button type="button" class="btn btn-primary cart_remove btn-sm me-1 mb-2" data-mdb-toggle="tooltip"
                    title="Remove item">
                    <i class="fas fa-trash"></i>
                  </button>
                  <button type="button" class="btn btn-danger btn-sm mb-2" data-mdb-toggle="tooltip"
                    title="Move to the wish list">
                    <i class="fas fa-heart"></i>
                  </button>
                  <!-- Data -->
                </div>

                <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                  <!-- Quantity -->
                  <div class="d-flex mb-4" style="max-width: 300px">
                    <button class="btn btn-primary px-3 me-2" id="sub">
                      <i class="fas fa-minus"></i>
                    </button>

                    <div class="form-outline" data-id="{{$id}}">
                      <input id="qtyBox" min="1" name="quantity" value="{{ $details['quantity'] }}" type="number"
                        class="form-control cart_update quantity" />
                      <label class="form-label" id="sub" for="form1">Quantity</label>
                    </div>

                    <button class="btn btn-primary px-3 ms-2" id="add">
                      <i class="fas fa-plus"></i>
                    </button>
                  </div>
                  <!-- Quantity -->

                  <!-- Price -->
                  <p class="text-start text-md-center">
                    <strong>{{ number_format( $details['price'] * $details['quantity']) }} VNĐ</strong>
                  </p>
                  <!-- Price -->
                </div>
              </div>
              <!-- Single item -->

              <hr class="my-4" />
              @endforeach
              @endif


              <!-- Single item -->
            </div>
          </div>
          <div class="card mb-4">
            <div class="card-body">
              <p><strong>Expected shipping delivery</strong></p>
              <p class="mb-0">12.10.2020 - 14.10.2020</p>
            </div>
          </div>
          <div class="card mb-4 mb-lg-0">
            <div class="card-body">
              <p><strong>We accept</strong></p>
              <img class="me-2" width="45px"
                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                alt="Visa" />
              <img class="me-2" width="45px"
                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                alt="American Express" />
              <img class="me-2" width="45px"
                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                alt="Mastercard" />
              <img class="me-2" width="45px"
                src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.webp"
                alt="PayPal acceptance mark" />
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-header py-3">
              <h5 class="mb-0">Summary</h5>
            </div>
            <div class="card-body">
              <ul class="list-group list-group-flush">
                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                  Products
                  <span>{{ number_format($total) }} VNĐ</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                  Shipping
                  <span>Gratis</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                  <div>
                    <strong>Total amount</strong>
                    <strong>
                      <p class="mb-0">(including VAT)</p>
                    </strong>
                  </div>
                  <span><strong>{{ number_format($total) }} VNĐ</strong></span>
                </li>
              </ul>

              <form action="" method="post">
                <input type="hidden" name="_token" value="{{csrf_token()}}">
                <button type="submit" class="btn btn-primary btn-lg btn-block">
                  Go to checkout
                </button>
              </form>
              <form action="{{route('vnpay')}}" method="post" class="mt-2">
                @csrf
                <input type="hidden" name="total" value="{{$total}}">
                <button type="submit" name="redirect" class="btn btn-primary btn-lg btn-block">
                Thanh toán bằng VnPay
                </button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
@endsection
@section('scripts')
<script>
  let addBtn = document.querySelector('#add');
  let subBtn = document.querySelector('#sub');
  let qty = document.querySelector('#qtyBox');

  addBtn.addEventListener('click', () => {
    qty.value = parseInt(qty.value) + 1;
  });

  subBtn.addEventListener('click', () => {
    if (qty.value <= 0) {
      qty.value = 0;
    }
    else {
      qty.value = parseInt(qty.value) - 1;
    }
  });

</script>
<script type="text/javascript">
  $(document).ready(function () {
    $(".cart_update").change(function (e) {
      console.log("ok");
      e.preventDefault();

      var ele = $(this);

      $.ajax({
        url: '{{ route('update_cart') }}',
        method: "patch",
        data: {
          _token: '{{ csrf_token() }}',
          id: ele.parents("div").attr("data-id"),
          quantity: ele.parents("div").find(".quantity").val()
        },
        success: function (response) {
          window.location.reload();
        }
      });
    });

    $(".cart_remove").click(function (e) {

      e.preventDefault();

      var ele = $(this);

      if (confirm("Do you really want to remove?")) {
        $.ajax({
          url: '{{ route('remove_from_cart') }}',
          method: "DELETE",
          data: {
            _token: '{{ csrf_token() }}',
            id: ele.parents("div").attr("data-id")
          },
          success: function (response) {
            window.location.reload();
          }
        });
      }
    });
  });

</script>
@endsection