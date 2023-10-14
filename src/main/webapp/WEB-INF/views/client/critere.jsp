<%@ page import="com.example.rh.Model.criteres.Critere" %>
<%@ page import="java.util.Vector" %>
<%@
        page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<%
    Vector<Critere> diplome = (Vector<Critere>) request.getAttribute("listDiplome");
    Vector<Critere> experience = (Vector<Critere>) request.getAttribute("listExperience");
    Vector<Critere> situation = (Vector<Critere>) request.getAttribute("listSituation");
    Vector<Critere> sexe = (Vector<Critere>) request.getAttribute("listSexe");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta Tags -->
    <meta name="description" content="Your description">
    <meta name="author" content="Your name">

    <!-- OG Meta Tags to improve the way the post looks when you share the page on Facebook, Twitter, LinkedIn -->
    <meta property="og:site_name" content="" /> <!-- website name -->
    <meta property="og:site" content="" /> <!-- website link -->
    <meta property="og:title" content=""/> <!-- title shown in the actual shared post -->
    <meta property="og:description" content="" /> <!-- description shown in the actual shared post -->
    <meta property="og:image" content="" /> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content="" /> <!-- where do you want your post to link to -->
    <meta name="twitter:card" content="summary_large_image"> <!-- to have large image post format in Twitter -->

    <!-- Webpage Title -->
    <title>Critere</title>

    <!-- Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,400;0,600;1,400&display=swap" rel="stylesheet">
    <link href="/assets_client/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets_client/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="/assets_client/css/swiper.css" rel="stylesheet">
    <link href="/assets_client/css/styles.css" rel="stylesheet">

    <!-- Favicon  -->
    <link rel="icon" href="/assets_client/images/favicon.png">
</head>
<body>

<!-- Navigation -->
<nav id="navbarExample" class="navbar navbar-expand-lg fixed-top navbar-light" aria-label="Main navigation">
    <div class="container">

        <!-- Image Logo -->
        <a class="navbar-brand logo-image" href="index.html"><img src="/assets_client/images/logo.svg" alt="alternative"></a>

        <!-- Text Logo - Use this if you don't have a graphic logo -->
        <!-- <a class="navbar-brand logo-text" href="index.html">Ioniq</a> -->

        <button class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav ms-auto navbar-nav-scroll">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.html#features">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.html#details">Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.html#pricing">Pricing</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-bs-toggle="dropdown" aria-expanded="false">Drop</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown01">
                        <li><a class="dropdown-item" href="article.html">Article Details</a></li>
                        <li><div class="dropdown-divider"></div></li>
                        <li><a class="dropdown-item" href="terms.html">Terms Conditions</a></li>
                        <li><div class="dropdown-divider"></div></li>
                        <li><a class="dropdown-item" href="privacy.html">Privacy Policy</a></li>
                    </ul>
                </li>
            </ul>
        </div> end of navbar-collapse -->
    </div> <!-- end of container -->
</nav> <!-- end of navbar -->
<!-- end of navigation -->


<!-- Header -->
<header class="ex-header">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 offset-xl-1">
                <h1 class="text-center">Page de critère</h1>
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->
</header> <!-- end of ex-header -->
<!-- end of header -->

<!-- Basic -->
<div class="ex-form-1 pt-5 pb-5">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 offset-xl-3">
                <div class="text-box mt-5 mb-5">
                    <!-- <p class="mb-4">Fill out the form below to sign up for the service. Already signed up? Then just <a class="blue" href="log-in.html">Log In</a></p> -->

                    <!-- Sign Up Form -->
                    <form method="Get" action="test">
                        <div class="mb-4 form-floating">
                            <div class="field tinted">
                                <label>Sélectionné votre Diplome</label>
                            </div>

                            <select name="diplome" value="Diplome" class="form-control">
                                <option disabled selected value="">-</option>
                                <% for(Critere diplomes : diplome) { %>
                                <option value="<%= diplomes.getElement() %>"><%= diplomes.getElement() %></option>
                                <% } %>
                            </select>

                        </div>

                        <div class="mb-4 form-floating">
                            <div class="field tinted">
                                <label>Année d'experience</label>
                            </div>
                            <select name="experience" value="Experience" class="form-control">
                                <option disabled selected value="">-</option>
                                <% for(Critere experiences : experience) { %>
                                <option value="<%= experiences.getElement() %>"><%= experiences.getElement() %></option>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-4 form-floating">
                            <div class="field tinted">
                                <label>Situation matrimoniale</label>
                            </div>
                            <select name="situation" value="Situation" class="form-control">
                                <option disabled selected value="">-</option>
                                <% for(Critere situations : situation) { %>
                                <option value="<%= situations.getElement() %>"><%= situations.getElement() %></option>
                                <% } %>
                            </select>
                        </div>


                        <div class="mb-4 form-floating">
                            <div class="field tinted">
                                <label>Choix de sêxe</label>
                                </br>
                                <% for (Critere sexes : sexe) { %>
                                <input type="radio" id="demo-priority-low" name="demo-priority" class="color2" value="<%= sexes.getElement() %>" />
                                <label for="demo-priority-low" ><%= sexes.getElement() %></label>
                                </br>
                                <% } %>
                            </div>
                        </div>


                        <div class="mb-4 form-floating">
                            <div class="field tinted">
                                <label for="demo-file"> Téléchargez votre CV (format PDF ou Word) :</label>
                            </div>
                            <br>
                            <input type="file" id="demo-file" name="demo-file" accept=".pdf, .doc, .docx" />
                        </div>

                        <br>

                        <button type="submit" class="form-control-submit-button">Envoyer</button>
                    </form>
                    <!-- end of sign up form -->

                </div> <!-- end of text-box -->
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div> <!-- end of ex-basic-1 -->
<!-- end of basic -->


<!-- Footer -->
<div class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="footer-col first">
                    <h6>About Website</h6>
                    <p class="p-small">Proin ut felis purus vestibulum in orci molestie, efficitur lacus ac pellentesque elit. Fusce mollis laoreet lobortis nulla ac efficitur lacus ac </p>
                </div> <!-- end of footer-col -->
                <div class="footer-col second">
                    <h6>Links</h6>
                    <ul class="list-unstyled li-space-lg p-small">
                        <li>Important: <a href="terms.html">Terms & Conditions</a>, <a href="privacy.html">Privacy Policy</a></li>
                        <li>Useful: <a href="#">Colorpicker</a>, <a href="#">Icon Library</a>, <a href="#">Illustrations</a></li>
                        <li>Menu: <a href="#header">Home</a>, <a href="#features">Features</a>, <a href="#details">Details</a>, <a href="#pricing">Pricing</a></li>
                    </ul>
                </div> <!-- end of footer-col -->
                <div class="footer-col third">
                            <span class="fa-stack">
                                <a href="#your-link">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-facebook-f fa-stack-1x"></i>
                                </a>
                            </span>
                    <span class="fa-stack">
                                <a href="#your-link">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-twitter fa-stack-1x"></i>
                                </a>
                            </span>
                    <span class="fa-stack">
                                <a href="#your-link">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-pinterest-p fa-stack-1x"></i>
                                </a>
                            </span>
                    <span class="fa-stack">
                                <a href="#your-link">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-instagram fa-stack-1x"></i>
                                </a>
                            </span>
                    <p class="p-small">Quam posuerei pellent esque vam <a href="mailto:contact@site.com"><strong>contact@site.com</strong></a></p>
                </div> <!-- end of footer-col -->
            </div> <!-- end of col -->
        </div> <!-- end of row -->
    </div> <!-- end of container -->
</div> <!-- end of footer -->
<!-- end of footer -->


<!-- Copyright -->
<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <p class="p-small">Copyright © <a href="#your-link">Your name</a></p>
            </div> <!-- end of col -->
            <div class="col-lg-6">
                <p class="p-small">Distributed By<a href="https://themewagon.com/"> Themewagon</a></p>
            </div> <!-- end of col -->
        </div> <!-- enf of row -->
    </div> <!-- end of container -->
</div> <!-- end of copyright -->
<!-- end of copyright -->


<!-- Back To Top Button -->
<button onclick="topFunction()" id="myBtn">
    <img src="/assets_client/images/up-arrow.png" alt="alternative">
</button>
<!-- end of back to top button -->

<!-- Scripts -->
<script src="/assets_client/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
<script src="/assets_client/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
<script src="/assets_client/js/purecounter.min.js"></script> <!-- Purecounter counter for statistics numbers -->
<script src="/assets_client/js/replaceme.min.js"></script> <!-- ReplaceMe for rotating text -->
<script src="/assets_client/js/scripts.js"></script> <!-- Custom scripts -->
</body>
</html>