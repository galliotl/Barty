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
</head>

<body style="min-height: 100vh">
<!--Vue lorsqu'on arrive sur la page -->
<div style="height: 100vh">
    <!-- Navbar -->
    <div style="background-color: black; height: 100px; width: 100%; opacity: 0.5; z-index: -1;"></div>
    <nav style="background-color: transparent!important; height: 100px; top: -100px"
         class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#"><span style="font-size: 40px; color: white; margin-left: 50px">Barty</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li style="margin-left: 50px" class="nav-item active">
                    <a class="nav-link" href="#"><span style="font-size: 32px; color: white">Pour les bars</span></a>
                </li>
                <li style="margin-left: 50px" class="nav-item active">
                    <a class="nav-link" href="#"><span style="font-size: 32px; color: white">FAQ</span></a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Background image -->
    <img class="backgroung_image imgpc" src="images/backgrounds/computer/bar_etagere_2.jpg">

    <!-- text on image -->
    <div class="container-fluid">
        <div style="height: 0;" class="row">
            <div style="background-color: black; padding-top: 10px; padding-bottom: 10px;" class="col-12 text-center">
                <h1 style="color: white;"><span style="font-size: 50px;"><i>Bienvenue chez Barty</i></span></h1>
            </div>
        </div>
        <div style="height: 0; margin-top: 350px" class="row">
            <div style="padding-top: 10px; padding-bottom: 10px;" class="col-12">
                <button style="height: 80px; width: 10em; margin-left: 100px; border-radius: 30px" type="button" class="btn btn-primary">GET
                    THE
                    APP
                </button>
            </div>
        </div>
    </div>
</div>


<div style=" background-color: black; padding-top: 100px" class="container-fluid">
    <!-- premier bandeau -->
    <div class="row">
        <div class="col-lg-4 offset-lg-1">
            <p style="color: white; margin-top: 100px">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
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
        </div>
        <div class="col-lg-4 offset-lg-2 text-center">
            <img style="max-width: 100%" src="images/pages/index/beer.jpg">
        </div>
    </div>
    <!-- bouton -->
    <div style="margin-top: 100px;" class="row">
        <a href="#" style="margin-left: 50%; text-decoration: none" class="multicolor_button">get the app</a>
    </div>
    <!-- second bandeau -->
    <div style="margin-top: 10px" class="row">
        <div class="col-lg-4 offset-lg-1 text-center">
            <img style="max-width: 100%" src="images/pages/index/beer.jpg">
        </div>
        <div class="col-lg-4 offset-lg-2">
            <p style="color: white; margin-top: 100px">Lorem ipsum dolor sit amet, consectetur adipiscing elit.
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
        </div>
    </div>
</div>
<div style="background-color: black; padding-top: 50px; padding-bottom: 20px" class="container-fluid">
    <hr style="background-color: white">

    <div class="row">
        <div class="col-6 text-center">
            <a style="padding: 5px" href="#">
                <h5 style="color: white">Nous contacter</h5>
            </a>
            <a style="padding: 5px" href="#">
                <h5 style="color: white">Conditions Générales d'Utilisation</h5>
            </a>
            <a style="padding: 5px" href="#">
                <h5 style="color: white">Conditions Générales de Vente</h5>
            </a>
            <a style="padding: 5px" href="#">
                <h5 style="color: white">Crédits</h5>
            </a>
        </div>
        <div class="col-6 text-center">
            <div class="col-12">
                <button style="height: 50px; width: 10em; margin-top: 50px" type="button" class="btn btn-primary">
                    Google
                </button>
            </div>
            <div class="col-12">
                <button style="height: 50px; width: 10em; margin-top: 50px" type="button" class="btn btn-primary">
                    Apple
                </button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 text-center">
            <a style="padding: 5px" href="#">
                <h5 style="color: white">Copyright</h5>
            </a>
        </div>
    </div>
</div>

</body>
<!-- Boostrap JS -->
<script src=" https://code.jquery.com/jquery-3.3.1.slim.min.js "
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo "
        crossorigin="anonymous "></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js "
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49 "
        crossorigin="anonymous "></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js "
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy "
        crossorigin="anonymous "></script>
</html>