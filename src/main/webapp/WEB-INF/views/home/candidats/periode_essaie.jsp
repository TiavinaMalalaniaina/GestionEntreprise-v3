<%@ page import="com.example.rh.Model.criteres.CategorieCritere" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.rh.Model.criteres.Critere" %>
<%@ page import="com.example.rh.Model.services.Besoin" %>
<%@ page import="com.example.rh.Model.candidats.Candidat" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/back_office/vendors/feather/feather.css">
    <link rel="stylesheet" href="/back_office/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/back_office/vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="/back_office/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
    <link rel="stylesheet" href="/back_office/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="/back_office/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" type="text/css" href="/back_office/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/back_office/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="/back_office/images/favicon.png" />

    <!-- pour le modal-->
    <link rel="stylesheet" href="/back_office/modal/cs/bootstrap.min.css">
    <style>
        .mt-auto {
            text-align: center;
        }
        .mt-auto span {
            font-size: 40px;
            color: rgb(243, 121, 126);
            letter-spacing: 11px;
            font-family: Georgia, 'Times New Roman', Times, serif;
            margin-top: -100px;
        }
        .font-weight-bold {
            color: rgb(243, 121, 126);
        }
        .font-weight-normal p {
            color: rgb(3, 43, 131);
            font-weight: lighter;
        }
        .button {
            padding-top: 30px;
        }

    </style>
</head>
<body>
<div class="container-scroller">

    <%@ include file="../header_et_nav/nav.jsp" %>

    <!-- partial -->
    <div class="main-panel">
        <div class="content-wrapper">
            <div class="row">
                <div class="col-md-12 grid-margin">
                    <div class="row">
                        <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                            <h3 class="font-weight-bold">BETIAM</h3>
                            <h6 class="font-weight-normal mb-0"><p>Ensemble, nous pouvons accomplir l'impossible. Unis par notre détermination et notre collaboration, nous atteindrons nos objectifs avec succès !</p><span class="text-primary"></span></h6>
                        </div>
                        <div class="col-12 col-xl-4">
                            <div class="justify-content-end d-flex">
                                <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                                    <div id="date-heures" style="background-color: white;padding: 15px 12px 12px 12px;border-radius: 20px;">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CONTENT -->
            <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Candidats en periode d'essaie</h4>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>profil</th>
                                    <th>Nom</th>
                                    <th>Prenom</th>
                                    <th>Date de naissance</th>
                                    <th>Reste periode essaie</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                <% for (Candidat candidat : (List<Candidat>)request.getAttribute("candidats")) { %>
                                    <tr>
                                        <td class="py-1">
                                            <img src="../../images/faces/face1.jpg" alt="image"/>
                                        </td>
                                        <td><%= candidat.getNom() %></td>
                                        <td><%= candidat.getPrenom() %></td>
                                        <td><%= candidat.getDtn() %></td>
                                        <td>22 jours</td>
                                        <td><button type="button" class="btn btn-inverse-info btn-fw">Valider</button></td>
                                        <td><button type="button" class="btn btn-inverse-danger btn-fw">Refuser</button></td>
                                    </tr>
                                <% } %>
                               </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT -->

        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->

        <!-- partial -->
    </div>
    <!-- main-panel ends -->
</div>



<!-- plugins:js -->
<script src="/back_office/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="/back_office/vendors/chart.js/Chart.min.js"></script>
<script src="/back_office/vendors/datatables.net/jquery.dataTables.js"></script>
<script src="/back_office/vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="/back_office/js/dataTables.select.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="/back_office/js/off-canvas.js"></script>
<script src="/back_office/js/hoverable-collapse.js"></script>
<script src="/back_office/js/template.js"></script>
<script src="/back_office/js/settings.js"></script>
<script src="/back_office/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="/back_office/js/dashboard.js"></script>
<script src="/back_office/js/Chart.roundedBarCharts.js"></script>
<!-- End custom js for this page-->
<script src="/back_office/js/date-heures.js" ></script>

<!--pour le modal -->
<script src="/back_office/modal/js/bootstrap.min.js"></script>

<!-- pour coefficient -->

<script src="/librairies/jquery.js"></script>

</body>

</html>

