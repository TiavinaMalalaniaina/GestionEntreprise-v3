<%@ page import="com.example.rh.Model.criteres.CritereBesoin" %>
<%@ page import="java.util.Vector" %>
<%@ page import="com.example.rh.Model.criteres.CategorieCritere" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>

<%
    Vector<CritereBesoin> besoin = (Vector<CritereBesoin>) request.getAttribute("listBesoin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Bino html5 free Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">

    <!--Google Fonts link-->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,400i,600,600i,700,700i" rel="stylesheet">


    <link rel="stylesheet" href="/assets_annonce/assets/css/iconfont.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/slick/slick.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/slick/slick-theme.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/jquery.fancybox.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/bootstrap.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets_annonce/assets/css/magnific-popup.css">
    <!--        <link rel="stylesheet" href="assets/css/bootstrap-theme.min.css">-->


    <!--For Plugins external css-->
    <link rel="stylesheet" href="/assets_annonce/assets/css/plugins.css" />

    <!--Theme custom css -->
    <link rel="stylesheet" href="/assets_annonce/assets/css/style.css">

    <!--Theme Responsive css-->
    <link rel="stylesheet" href="/assets_annonce/assets/css/responsive.css" />

    <script src="/assets_annonce/assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body>
<section id="history" class="history sections">
    <div class="container">
        <div class="row">
            <div class="main_history">
                <div class="col-sm-6">
                    <div class="single_history_img">
                        <img src="/assets_annonce/assets/images/stab1.png" alt="" />
                    </div>
                </div>

                <div class="col-sm-6">
                    <div class="single_history_content">
                        <div class="head_title">
                            <h2>Vous souhaitez integrer une entreprise industrielle multiculturelle et dynamique?</h2>
                        </div>

                        <p>AMBATOVY RECRUTE</p>
                        <% for(int i=0; i< besoin.size(); i++) { %>
                            <p><%= besoin.get(i).getBesoin().getTache() %></p>

                        <% } %>
                        <p>Lieu Moramanga</p>

                        <a href="info-client" class="btn btn-lg"> Site & Different offres </a>

                    </div>
                </div>
            </div>
        </div><!--End of row -->
    </div><!--End of container -->
</section><!--End of history -->


<!-- service Section -->
<section id="service" class="service">
    <div class="container-fluid">
        <div class="row">
            <div class="main_service">
                <div class="col-md-6 col-sm-12 no-padding">

                    <div class="single_service single_service_text ">
                        <div class="head_title">
                            <h2>Profil rechercher</h2>
                        </div>

                        <div class="row">
                            <div class="col-md-12 col-sm-10 col-xs-10 margin-bottom-60">
                                <div class="row">

                                    <div class="col-sm-10 col-sm-offset-1 col-xs-9 col-xs-offset-1">
                                        <article class="single_service_right_text">
                                            <h4>Votre mission:</h4>
                                            <p>Executer les procedures et les instructions techniques existantes sous la direction du superviseur.
                                                </br>
                                                Assurer la gestion directe de l'equipement de forage ainsi que le traitement et la collection des echantillons de qualite de forage.
                                                </br>
                                                Suivi du traitement, de la preparation des echantillons et de la production au sein du service "geologie" de la Mine.</p>
                                        </article>
                                    </div>
                                    <div class="col-sm-1 col-xs-1">
                                        <figure class="single_service_icon">
                                            <i class="fa fa-heart"></i>
                                        </figure><!-- End of figure -->
                                    </div>
                                </div>
                            </div><!-- End of col-sm-12 -->

                            <div class="col-md-12 col-sm-10 col-xs-10 margin-bottom-60">
                                <div class="row">

                                    <div class="col-sm-10 col-sm-offset-1 col-xs-9 col-xs-offset-1">
                                        <article class="single_service_right_text">
                                            <h4>Votre profil:</h4>
                                            <p>
                                                <% for( CritereBesoin besoin1 : besoin ) { %>
                                                        <%= besoin1.getCritere().getCategorie().getNom() %> : <%= besoin1.getCritere().getElement() %>
                                                </br>
                                                <% } %>
                                            </p>
                                        </article>
                                    </div>
                                    <div class="col-sm-1 col-xs-1">
                                        <figure class="single_service_icon">
                                            <i class="fa fa-heart"></i>
                                        </figure><!-- End of figure -->
                                    </div>
                                </div>

                                <a href="critere" class="btn btn-lg">Cliquer ici pour s'inscrire</a>
                            </div><!-- End of col-sm-12 -->

                        </div>
                    </div>
                </div><!-- End of col-sm-6 -->


                <div class="col-md-6 col-sm-12 no-padding">
                    <figure class="single_service single_service_img">
                        <div class="overlay-img"></div>
                        <img src="/assets_annonce/assets/images/servicerightimg.jpg" alt="" />
                    </figure><!-- End of figure -->
                </div><!-- End of col-sm-6 -->

            </div>
        </div><!-- End of row -->
    </div><!-- End of Container-fluid -->
</section><!-- End of service Section -->
</body>
</html>