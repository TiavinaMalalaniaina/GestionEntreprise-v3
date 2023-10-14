<!DOCTYPE html>
<html>
<head>
    <title>
        page de login de services et RH
    </title>
    <meta charset="utf-8">
    <!--CSS-->

    <link rel="stylesheet" type="text/css" href="/assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/animate.css">

    <!--Google Fonts-->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">

</head>
<body>
<header class="header" id="HOME">
    <div class="header-overlay">
        <div class="container">
            <div class="row">

                <div class="col-md-offset-2 col-md-8 col-md-offset-2">
                    <div class="header-col">

                        <form action="traitement-de-login" role="form" class="header-form" method="post">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6"><marquee><h2>SERVICE ET RH</h2></marquee></div>
                                <div class="col-md-3"></div>

                            </div>

                            <div class="form-group" class="ex">
                                <input style="padding: 20px;"  name="email" type="email" placeholder="${email}" class="form-control input-3x">
                            </div>
                            <div class="form-group" class="ex">
                                <input style="padding: 20px;"  name="mot_de_passe" type="password" placeholder="${mot_de_passe}" class="form-control input-3x">
                            </div>

                            <div class="form-group button">
                                <button  type="submit" class="btn btn-primary btn-3x">SE CONNECTER<span> <i class="fa fa-angle-double-right"></i> </span></button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
</header>
</body>
</html>
