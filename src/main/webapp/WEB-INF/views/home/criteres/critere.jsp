<%@ page import="com.example.rh.Model.criteres.CategorieCritere" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.rh.Model.criteres.Critere" %>
<%@ page import="com.example.rh.Model.services.Besoin" %>
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
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Critere</h4>
                        <p class="card-description">
                            Veuillez caucher les criteres que vous souhaiter ajouter a votre besoin

                        </p>
                        <form class="forms-sample" action="creer-critere-besoin" method="get">
                            <div class="form-group">
                                <label for="exampleSelectGender">Numero de besoin</label>
                                <select class="form-control" id="exampleSelectGender" name="besoin_id">
                                    <% for(Besoin besoin : (List<Besoin>) request.getAttribute("besoins")) { %>
                                        <option value="<% out.print(besoin.getId()); %>" >Numero : <% out.print(besoin.getId()); %></option>
                                    <% } %>
                                </select>
                            </div>
                            <style>
                                .form-group .form-check {
                                    float: left;
                                    margin-left: 20px;
                                    width: 250px;
                                }
                            </style>
                            <div style="color: #3c763d;font-size: 35px;padding-left: 20px" class="row action-btn " data-bs-toggle="modal" data-bs-target="#fullscreenModal">
                                <i class="mdi mdi-plus-circle-outline"></i>
                            </div>
                            <div class="row">

                                <div class="form-group">
                                    <% for(Critere critere : (List<Critere>) request.getAttribute("criteres")) { %>
                                        <div class="form-check form-check-success">
                                            <label class="form-check-label">
                                                <input value="<% out.print(critere.getId()); %>" name="criteres" type="checkbox" class="form-check-input">
                                                <% out.print(critere.getCategorie().getNom()); %> : <% out.print(critere.getElement()); %>
                                            </label>
                                        </div>
                                    <% } %>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary mr-2">Ajouter</button>
                            <button class="btn btn-light">Annuler</button>
                        </form>
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
<!-- page-body-wrapper ends -->

<!-- container-scroller -->
<div class="modal fade" id="fullscreenModal" tabindex="-1" aria-labelledby="fullscreenModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fullscreenModalLabel">Creer le critere avec categorie et element </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
            </div>
            <div class="modal-body">
                <!-- Contenu du modal -->
                <div class="card">
                    <div class="card-body">
                        <form class="forms-sample">
                            <div class="row">
                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label for="cat">Categorie de criteres</label>
                                        <select class="form-control" id="cat">
                                            <option>Male</option>
                                            <option>Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div style="color: #3c763d;font-size: 35px;padding-left: 20px;padding-top: 35px" class="row action-btn " data-bs-toggle="modal" data-bs-target="#fullscreenModal2">
                                        <i class="mdi mdi-plus-circle-outline"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail3">Element de categorie</label>
                                <input type="text" class="form-control" id="exampleInputEmail3" name="date">
                            </div>

                            <button type="submit" class="btn btn-primary mr-2">Creer</button>
                            <button class="btn btn-light">Effacer</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
        </div>
    </div>
</div>


<div class="modal fade" id="fullscreenModal2" tabindex="-1" aria-labelledby="fullscreenModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fullscreenModalLabel2">Creer la categorie de critere </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fermer"></button>
            </div>
            <div class="modal-body">
                <!-- Contenu du modal -->
                <div class="card">
                    <div class="card-body">
                        <form class="forms-sample">
                            <div class="form-group">
                                <label for="exampleInputEmail3">Nom de categorie du critere</label>
                                <input type="text" class="form-control" id="exampleInputEmail2" name="date">
                            </div>
                            <button type="submit" class="btn btn-primary mr-2">Creer</button>
                            <button class="btn btn-light">Effacer</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
        </div>
    </div>
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
</body>

</html>

