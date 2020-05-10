<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barty</title>
    <link rel="icon" type="image/png" href=""/><!--TODO-->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
</head>


<body style="min-height: 100vh; max-width: 100%; background-color: black">
<!--Vue lorsqu'on arrive sur la page -->
<div style="height: 100vh">
    <!-- Navbar -->
    <div style="background-color: black; height: 100vh; width: 100%; opacity: 0.5; z-index: -1;"></div>
    <?php
    include 'tools/navbar_index.php';
    ?>
    <!-- Background image -->
    <img  class="backgroung_image imgpc" src="images/backgrounds/computer/index2.png">
    <img  class="backgroung_image imgsmart" src="images/backgrounds/smartphone/index2.png">


    <!-- text on image -->
    <div style="height: 0; position: absolute; top: 39vh" class="container-fluid">
        <div class="row">
            <div style=" padding-top: 10px; padding-bottom: 10px;" class="col-12 text-center">
                <h1 style="color: white;"><span style="font-size: 50px;"><b>Trouve le bar qui te correspond.</b></span>
                </h1>
            </div>
        </div>
        <div class="get_the_app_image_banner">
            <div class="row">
                <div class="col-lg-2 col-6 text-center ">
                    <img class="get_the_app_image" src="images/apple_get_the_app.png">
                </div>
                <div class="col-lg-2 col-6 text-center get_the_app_image">
                    <img class="get_the_app_image" src="images/google_get_the_app.png">
                </div>

            </div>
        </div>
    </div>
</div>


<div style="background-color: black;" class="container-fluid">
    <div class="pc_margin_100 smartphone_margin_50"> </div>
    <!-- premier bandeau -->
    <div class="row">
        <div class="col-lg-4 offset-lg-1">
            <div class="pc_margin_100"></div>
            <p style="color: white;">Lorem ipsum dolor sit amet, consectetur adipiscing elit.

                Curabitur bibendum pretium
                tortor. In facilisis erat tortor, vel posuere libero finibus vel. Vestibulum accumsan et mi sit amet
                gravida. Aliquam nibh mauris, scelerisque at congue sit amet, consectetur pulvinar magna. Curabitur sed
                lectus quis augue volutpat molestie. Aliquam mi lacus, sagittis a diam ac, dapibus dictum risus.
                Suspendisse eu tristique ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
                posuere cubilia Curae; Morbi non nulla hendrerit, convallis leo sit amet, consectetur lectus. Praesent
                fermentum, metus in iaculis porttitor, ligula magna ullamcorper tortor, id iaculis elit libero et nisi.
                Vestibulum semper urna at bibendum tristique. Ut non nulla eget neque pretium commodo in sit amet risus.
                Maecenas non quam libero. Sed efficitur tortor non velit iaculis, vel egestas est malesuada. Phasellus
                et enim vehicula, vulputate dolor in, ultricies est.</p>
            <div class="smartphone_margin_50"></div>
        </div>
        <div class=" col-lg-4 offset-lg-2 text-center">
            <img  style="max-width: 100%" src="images/pages/index/beer.jpg">
        </div>
    </div>
    <!-- bouton -->
    <div class="row get_the_app_wave">
        <div class="text-center col-lg-2 offset-lg-5 col-10 offset-1">
            <div style="display: block">
                <a style="border-radius: 10px" class="wave_link " href="#"><span>get the app</span>
                    <div class="wave"></div>
                </a>
            </div>
        </div>
    </div>
    <!-- second bandeau -->
    <div style="margin-top: 10px;" class="row">
        <div class="col-lg-4 offset-lg-1 text-center d-none d-lg-block">
            <img  style="max-width: 100%" src="images/pages/index/beer.jpg">
        </div>
        <div class=" col-lg-4 offset-lg-2">
            <div class="pc_margin_100"></div>
            <p style="color: white;">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Curabitur bibendum pretium
                tortor. In facilisis erat tortor, vel posuere libero finibus vel. Vestibulum accumsan et mi sit amet
                gravida. Aliquam nibh mauris, scelerisque at congue sit amet, consectetur pulvinar magna. Curabitur
                sed
                lectus quis augue volutpat molestie. Aliquam mi lacus, sagittis a diam ac, dapibus dictum risus.
                Suspendisse eu tristique ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices
                posuere cubilia Curae; Morbi non nulla hendrerit, convallis leo sit amet, consectetur lectus.
                Praesent
                fermentum, metus in iaculis porttitor, ligula magna ullamcorper tortor, id iaculis elit libero et
                nisi.
                Vestibulum semper urna at bibendum tristique. Ut non nulla eget neque pretium commodo in sit amet
                risus.
                Maecenas non quam libero. Sed efficitur tortor non velit iaculis, vel egestas est malesuada.
                Phasellus
                et enim vehicula, vulputate dolor in, ultricies est.</p>
        </div>
        <div class="col-lg-4 offset-lg-1 text-center d-block d-lg-none">
            <div class="smartphone_margin_50"></div>
            <img  style="max-width: 100%" src="images/pages/index/beer.jpg">
        </div>
    </div>
</div>
<!--FOOTER-->
<?php
include 'tools/footer_index.php';
?>
</body>
<!-- Boostrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js "
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49 "
        crossorigin="anonymous "></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js "
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy "
        crossorigin="anonymous "></script>
</html>