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
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Critere</h4>
                        <p class="card-description">
                            Veuillez caucher les criteres que vous souhaiter ajouter a votre besoin

                        </p>
                            <div class="form-group">
                                <label for="exampleSelectGender">Numero de besoin</label>
                                <select class="form-control" id="exampleSelectGender" name="besoin_id">
                                    <option></option>
                                    <% for(Besoin besoin : (List<Besoin>) request.getAttribute("besoins")) { %>
                                        <option value="<% out.print(besoin.getId()); %>" >Numero : <% out.print(besoin.getId()); %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div id="div">
<%--                                <% for(int i = 0;i < 3;i++ ) { %>--%>
<%--                                    <div class="form-group">--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="col-md-10">--%>
<%--                                                <label for="exampleInputPassword4">Critere<% out.print(i); %></label>--%>
<%--                                                <input type="number" class="form-control" id="exampleInputPassword4" name="valeur">--%>
<%--                                            </div>--%>
<%--                                            <style>--%>
<%--                                                .button {--%>
<%--                                                    padding-top: 30px;--%>
<%--                                                }--%>
<%--                                            </style>--%>
<%--                                            <div class="col-md-2 button">--%>
<%--                                                <button type="button" class="btn btn-inverse-info btn-fw">Ajouter</button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                <% } %>--%>
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
<script>
    function critereWithCoefficient(critere, critereBesoinId, indice) {
        var container = document.getElementById("div");

        // var form = document.createElement("form");
        // form.action = "creer-coefficient-critere";
        // form.method = "get";

        var formGroupDiv = document.createElement("div");
        formGroupDiv.className = "form-group";

        var rowDiv = document.createElement("div");
        rowDiv.className = "row";

        var colMd10Div = document.createElement("div");
        colMd10Div.className = "col-md-10";

        var labelElement = document.createElement("label");
        labelElement.textContent = critere;

        var inputElement = document.createElement("input");
        inputElement.type = "number";
        inputElement.className = "form-control";
        inputElement.id = "number"+indice;
        inputElement.name = "number";

        var critereBesoin = document.createElement("input");
        critereBesoin.type = "hidden";
        critereBesoin.value = critereBesoinId;
        critereBesoin.name = "besoin_id";


        var colMd2ButtonDiv = document.createElement("div");
        colMd2ButtonDiv.className = "col-md-2 button";

        var buttonElement = document.createElement("button");
        buttonElement.type = "submit";
        buttonElement.onclick = function (){ creerCoefficient(indice, critereBesoinId) };
        buttonElement.className = "btn btn-inverse-info btn-fw";
        buttonElement.textContent = "Ajouter";

        colMd10Div.appendChild(labelElement);
        colMd10Div.appendChild(inputElement);
        colMd10Div.appendChild(critereBesoin);

        colMd2ButtonDiv.appendChild(buttonElement);

        rowDiv.appendChild(colMd10Div);
        rowDiv.appendChild(colMd2ButtonDiv);

        formGroupDiv.appendChild(rowDiv);

        //form.appendChild(formGroupDiv);

        container.appendChild(formGroupDiv);

    }

    function onSelectionChange() {
        var selectValue = document.querySelector("#exampleSelectGender").value;
        $.ajax({
            url: 'http://localhost:8080/list-criteres-by-besoin',
            type: 'GET',
            data: {
                besoinId : selectValue
            },
            success: function (data) {
                var container = document.getElementById("div");
                container.innerHTML = "";
                for (let i = 0; i < data.length ; i++) {

                    critereWithCoefficient(data[i]['critere']['categorie']['nom']+" : "+data[i]['critere']['element'], data[i]['id'], i);
                }
                buttonSuivant(data.length, selectValue);
                console.log(data);
            },
            error: function () {
                alert('Erreur lors de la récupération de la liste.');
            }
        });
    }

    function creerCoefficient(indice, critereBesoinId) {
        var number = document.querySelector("#number"+indice);
        var numberValue = 0;
        if (number != null) numberValue =  number.value;
        $.ajax({
            url: 'http://localhost:8080/creer-coefficient-critere',
            type: 'GET',
            data: {
                critereBesoinId : critereBesoinId ,
                number : numberValue
            },
            success: function () {
                //window.location.reload();
                onSelectionChange();
            },
            error: function () {
                alert('Erreur lors de la récupération de la liste.');
            }
        });
    }
    function buttonSuivant(size, besoinId) {
        var container = document.getElementById("div");
        var buttonElement = document.createElement("button");

        var lien = document.createElement("a");
        lien.href = "create-test?besoin_id="+besoinId;
        buttonElement.type = "button";
        buttonElement.className = "btn btn-primary mr-2";
        buttonElement.textContent = "Suivant";

        lien.appendChild(buttonElement);

        if (size == 0) {
            container.appendChild(lien);
        }
    }
    var selectElement = document.querySelector("#exampleSelectGender");
    selectElement.addEventListener("change", onSelectionChange);

</script>

<script src="/librairies/jquery.js"></script>

</body>

</html>

