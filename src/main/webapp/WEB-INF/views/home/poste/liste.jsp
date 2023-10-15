<%@ page import="com.example.rh.Model.criteres.Critere" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.rh.Model.criteres.CategorieCritere" %>
<% List<CategorieCritere> criteres = (List<CategorieCritere>) request.getAttribute("criteres"); %>
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

    <link rel="stylesheet" href="/back_office/vendors/select2/select2.min.css">
    <link rel="stylesheet" href="/back_office/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
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

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">Filter</p>
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="critere-filter">Critères</label>
                                        <select class="js-example-basic-multiple w-100" multiple="multiple" id="critere-filter" onchange="critereFilter()">
                                            <% for (CategorieCritere categorie : criteres) { %>
                                            <optgroup label="<%=categorie.getNom()%>">
                                                <% for (Critere critere : categorie.getCriteres()) { %>
                                                <option value="<%=critere.getId()%>"><%=critere.getElement()%></option>
                                                <% } %>
                                            </optgroup>
                                            <% } %>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="salaire-min-filter">Salaire min</label>
                                        <input type="number" class="form-control" id="salaire-min-filter" onchange="critereFilter()">
                                    </div>
                                    <div class="form-group">
                                        <label for="salaire-max-filter">Salaire max</label>
                                        <input type="number" class="form-control" id="salaire-max-filter" onchange="critereFilter()">
                                    </div>
                                    <div class="form-group">
                                        <label for="salaire-max-filter">Poste recherché</label>
                                        <input type="text" class="form-control" id="poste-filter" onchange="critereFilter()">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <p class="card-title">Advanced Table</p>
                            <div class="row">
                                <div class="col-12">
                                    <div class="table-responsive">
                                        <table id="example" class="display expandable-table" style="width:100%">
                                            <thead>
                                            <tr>
                                                <th>Nom & prénom</th>
                                                <th>Email</th>
                                                <th>Poste</th>
                                                <th>Salaire</th>
                                                <th>Département</th>
                                            </tr>
                                            </thead>
                                            <tbody id="table-item">

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
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

<script src="/back_office/vendors/typeahead.js/typeahead.bundle.min.js"></script>
<script src="/back_office/vendors/select2/select2.min.js"></script>
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
<script src="/back_office/js/select2.js"></script>
<script src="/back_office/js/typehead.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="/back_office/js/dashboard.js"></script>
<script src="/back_office/js/Chart.roundedBarCharts.js"></script>
<!-- End custom js for this page-->
<script src="/back_office/js/date-heures.js" ></script>

<!--pour le modal -->
<script src="/back_office/modal/js/bootstrap.min.js"></script>


<script src="/back_office/vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->


<script src="/librairies/jquery.js"></script>
<script !src="">


    var data_all = ${models};
    var data = data_all;

    updateTable(data);

    function updateTable(data) {
        console.log(data_all);
        console.log(data);
        let tbody = document.getElementById("table-item");
        tbody.innerHTML = "";
        for (let i=0; i<data.length; i++) {
            const tr = document.createElement('tr');
            const td1 = document.createElement('td'); td1.innerHTML = data[i].nom + " " + data[i].prenom;
            const td2 = document.createElement('td'); td2.innerHTML = data[i].email;
            const td3 = document.createElement('td'); td3.innerHTML = data[i].posteNom;
            const td4 = document.createElement('td'); td4.innerHTML = data[i].salaire;
            const td5 = document.createElement('td'); td5.innerHTML = data[i].serviceNom;

            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td4);
            tr.appendChild(td5);
            tbody.appendChild(tr);
        }
    }


    function critereFilter() {
        const select = document.getElementById('critere-filter');
        const min = document.getElementById('salaire-min-filter');
        const max = document.getElementById('salaire-max-filter');
        const poste = document.getElementById('poste-filter');
        const selectedOptions = Array.from(select.selectedOptions);
        const selectedValues = selectedOptions.map(option => option.value);
        let data = [];
        for (let i=0; i<data_all.length; i++) {
            let add = true;
            for (let j=0; j<selectedValues.length; j++) {
                let entry = false;
                for (let k=0; k<data_all[i].criteres.length; k++) {
                    if (data_all[i].criteres[k].id == selectedValues[j]) {
                        entry = true;
                        break;
                    }
                }
                if (!entry) {
                    add = false;
                    break;
                }
            }
            if (add) {
                data.push(data_all[i]);
            }
        }
        let removing_index = []
        for (let i=0; i<data.length; i++) {
            if ((data[i].salaire < min.value && min.value!="") || (data[i].salaire > max.value && max.value!="")) {
                removing_index.push(i);
            }
        }

        for (const x in removing_index) {
            data.splice(x, 1);
        }

        removing_index = [];
        for (let i=0; i<data.length; i++) {
            if (data[i].posteNom.toLowerCase().indexOf(poste.value.toLowerCase()) == -1) {
                removing_index.push(i);
            }
        }

        for (const x in removing_index) {
            data.splice(x, 1);
        }
        updateTable(data);
    }
</script>
</body>

</html>

