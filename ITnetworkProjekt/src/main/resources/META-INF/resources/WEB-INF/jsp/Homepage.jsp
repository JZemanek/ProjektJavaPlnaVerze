<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<html lang="cs-cz">
    <head>
        <!-- Navbar -->
        <%@include file="common/navbar.jspf" %>
        
        <!-- CSS -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/HomePageStyle.css" rel="stylesheet" type="text/css"/>

        <!-- Meta -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Hlavní Strana</title>
    </head>
    
    <body>
        <!-- Carousely -->
        <div class="container py-4">   
            <div id="carouselIndikator" class="carousel slide" data-bs-ride="carousel">
                
                <ol class="carousel-indicators">
                    <li data-bs-target="#prvniCarouselSlide" data-bs-slide-to="0" class="active"></li>
                    <li data-bs-target="#druhyCarouselSlide" data-bs-slide-to="1"></li>
                    <li data-bs-target="#tretiCarouselSlide" data-bs-slide-to="2"></li>
                </ol>
                <!-- První carousel -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="https://img.freepik.com/free-photo/top-view-paper-cut-family-concept_23-2148488152.jpg?w=1380&t=st=1695749050~exp=1695749650~hmac=6783ea39d88fff3e1db792cbcc6801b575bfa57a9a183aab57bf0434741b67d4" alt="First slide">
                        <div class="carousel-caption d-none d-md-block text-dark" style="margin-bottom: 5%">
                            <h5>Label pro první slide</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <!-- Druhý carousel -->
                    <div class="carousel-item ">
                        <img class="d-block w-100" src="https://img.freepik.com/free-photo/japanese-family-playing-with-toys-floor-design-space-banner_53876-132138.jpg?w=1380&t=st=1695749098~exp=1695749698~hmac=7dc0713a92bbae6ee40dddc83dc7273576c0b2c4463d11db414f0a374b143da7" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block text-dark" style="margin-bottom: 1%">
                            <h5>Label pro druhý slide</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                    <!-- Třetí carousel -->
                    <div class="carousel-item">
                        <img class="d-block w-100" src="https://img.freepik.com/free-photo/real-estate-concept-young-smiling-woman-with-red-hair-showing-paper-house-model-standing-blue-b_1258-146548.jpg?w=1380&t=st=1695800735~exp=1695801335~hmac=490688371500498c9176bc8d30b5211e38c26a149fe960f13d7a69c8989b5aae" alt="Third slide">
                        <div class="carousel-caption d-none d-md-block text-dark" style="margin-bottom: 4%">
                            <h5>Label pro třetí slide</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                    </div>
                </div>
                <!-- Šipka "vlevo - předchozí" pro ruční posun carouselů. -->
                <a class="carousel-control-prev" href="#carouselIndikator" role="button" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <!-- Šipka "vpravo - další" pro ruční posun carouselů. -->
                <a class="carousel-control-next" href="#carouselIndikator" role="button" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                
            </div>
        </div>
        <!-- Karty -->
        <div class="container">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                
                <div class="col">
                    <div class="card" style="margin-left: 5%">
                        
                        <div class="card-header" style="background-color: #2873b5">
                            <h6>Nadpis</h6>
                        </div>
                        
                        <div class="card-body">
                            <h5 class="card-tittle">Nadpis k textu</h5>
                            <p class="card-text">Nějaký ten text</p>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        
                        <div class="card-footer">
                            <small class="text-muted">
                                A nakonec footer
                            </small>
                        </div>
                        
                    </div>
                </div>

                <div class="col">
                    <div class="card" style="margin-left: 3%">
                        
                        <div class="card-header" style="background-color: #2873b5">
                            <h6>Nadpis</h6>
                        </div>
                        
                        <div class="card-body">
                            <h5 class="card-tittle">Nadpis k textu</h5>
                            <p class="card-text">Nějaký ten text</p>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        
                        <div class="card-footer">
                            <small class="text-muted">
                                A nakonec footer
                            </small>
                        </div>
                        
                    </div>
                </div>

                <div class="col">
                    <div class="card" style=" margin-left: 3%">
                        <div class="card-header"style="background-color: #2873b5">
                            <h6>Nadpis</h6>
                        </div>
                        
                        <div class="card-body">
                            <h5 class="card-tittle">Nadpis k textu</h5>
                            <p class="card-text">Nějaký ten text</p>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        
                        <div class="card-footer">
                            <small class="text-muted">
                                A nakonec footer
                            </small>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col">
                    <div class="card mb-3" style="margin-left: 5%">
                        
                        <div class="card-header" style="background-color: #2873b5">
                            <h6>Nadpis</h6>
                        </div>
                        
                        <div class="card-body">
                            <h5 class="card-tittle">Nadpis k textu</h5>
                            <p class="card-text">Nějaký ten text</p>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Případně odkaz.</p>
                        </div>
                        
                        <div class="card-footer">
                            <small class="text-muted">
                                A nakonec footer
                            </small>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col">
                    <div class="card mb-3" style="margin-left: 5%">
                        
                        <div class="card-header" style="background-color: #2873b5">
                            <h6>Nadpis</h6>
                        </div>
                        
                        <div class="card-body">
                            <h5 class="card-tittle">Nadpis k textu</h5>
                            <p class="card-text">Nějaký ten text</p>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        
                        <div class="card-footer">
                            <small class="text-muted">
                                A nakonec footer
                            </small>
                        </div>
                        
                    </div>
                </div>
                
                <div class="col">
                    <div class="card mb-3" style="margin-left: 5%">
                        
                        <div class="card-header" style="background-color: #2873b5">
                            <h6>Nadpis</h6>
                        </div>
                        
                        <div class="card-body">
                            <h5 class="card-tittle">Nadpis k textu</h5>
                            <p class="card-text">Nějaký ten text</p>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                        </div>
                        
                        <div class="card-footer">
                            <small class="text-muted">
                                A nakonec footer
                            </small>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>