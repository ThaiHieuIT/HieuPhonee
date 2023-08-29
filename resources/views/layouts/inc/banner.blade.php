<div class="container all-padding">
    <div class="row">
        <div class="col-12 banner">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    @php
                        $index = 0;
                    @endphp
                    @foreach ($banners as $banner)
                        @php
                            $index++;
                        @endphp
                        <div class="carousel-item  @if ($index == 1) {{ 'active' }} @endif">
                            <div class="banner-item">
                                <img src="../uploads/{{ $banner->img }}" alt="" style="width:100%; height:400px;border: 1px solid #000;border-radius: 10px;">
                            </div>
                        </div>
                    @endforeach
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"><i class="fa-solid fa-caret-left"></i></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"><i class="fa-solid fa-caret-right"></i></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
</div>


