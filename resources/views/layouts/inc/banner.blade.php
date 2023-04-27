<div class="container my-5">
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
                                <img src="../uploads/{{ $banner->img }}" alt="" style="width:100%;">
                            </div>
                        </div>
                    @endforeach
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </div>
</div>


