<%@ page import="com.example.rh.Model.services.ServiceAction" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.rh.Model.questionnaire.Questionnaire" %>
<%@ page import="com.example.rh.Model.questionnaire.Reponse" %>
<%@ page import="com.example.rh.Model.questionnaire.Question" %>
<% Questionnaire questionnaire = (Questionnaire) request.getAttribute("questionnaire"); %>
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
    <link rel="stylesheet" type="text/css" href="/back_office/js/select.dataTables.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/back_office/css/vertical-layout-light/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="/back_office/images/favicon.png" />

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

            <input type="hidden" name="id_questionnaire" id="id-question" value="1">
            <div id="question">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Création de formulaire</h4>
                        <p class="card-description">
                            Veuillez remplir tous les champs
                        </p>
                    </div>
                </div>
            </div>
            </div>
                    <center>
                        <button id="add-question" class="btn btn-primary">Ajouter une question</button>
                        <button class="btn btn-success">Valider le questionnaire</button>
                    </center>
            <!-- END CONTENT -->

        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->

        <!-- partial -->
    </div>
    <!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

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
</body>

</html>
<script>
    function writeQuestion(id_question, question, coeff) {
        let box_question = document.getElementById("question");
        let question_component = createQuestionComponent(id_question, question, coeff);
        box_question.innerHTML += question_component;
    }

    function writeReponse(id_question, id_reponse, reponse) {
        let box_reponse = document.getElementById("reponse-"+id_question);
        let reponse_component = createResponseComponent(id_question, id_reponse, reponse);
        box_reponse.innerHTML += reponse_component;
    }

    function InitializeQuestion(id_question) {
        let box = document.getElementById("question");
        let question_component = createQuestionComponent(id_question);
        box.innerHTML += question_component;
    }

    // create a component for response
    function createResponseComponent(id_question, id_response, reponse) {
        let component =
            "<div class='form-group'>" +
                "<input class='form-control col-8' value='"+ reponse +"' type='text' data-id-question='"+id_question+"' data-id-response='"+id_response+"' onblur='updateReponseValeur(this)' data-active='true'>"+
                "<select class='form-control col-3' id='exampleSelectGender' name='type' data-id-question='"+id_question+"' data-id-response='"+id_response+"' onchange='updateReponseVrai(this)'>"+
                    "<option value='true'>Vrai</option> " +
                    "<option value='false'>Faux</option> " +
                "</select>" +
            "</div>";
        return component;
    }

    // create a select component for type of question
    function createTypeComponent(id_question) {
        let component = "" +
            "<div class='form-group'>"+
            "<label for='type-"+id_question+"'>Type</label>" +
            "<select class='form-control' name='type-"+id_question+"' data-id-question='"+id_question+"' onchange='updateQuestionType(this)' id='type-"+id_question+"'>" +
            "<option value='checkbox'>Choix multiple</option>" +
            "<option value='radio'>Choix unique</option>" +
            "<option value='boolean'>Vrai ou faux</option>" +
            "<option value='text'>Champ libre</option>" +
            "</select>" +
            "</div>";
        return component;
    }

    // create a component for question
    function createQuestionComponent(id_question, question, coeff) {
        let type_component = createTypeComponent(id_question);
        let component = ""+
            "<div class='col-12 grid-margin stretch-card'>" +
                "<div class='card'>" +
                   "<div class='card-body'>" +
                        "<div data-id-question='"+id_question+"' id='question-"+id_question+"'>" +
                            "<div class='form-group'>"+
                                "<label for='exampleInputCity1'>Question</label>" +
                                "<input data-id-question='"+id_question+"' value='"+question+"' type='text' onblur='updateQuestionValeur(this)' class='form-control question' id='question exampleInputCity1' placeholder='Location'>" +
                            "</div>" + type_component +
                            "<div class='form-group'>" +
                                "<label for='exampleInputCity1'>Coefficient</label>"+
                                "<input  value='"+coeff+"' type='number' data-id-question='"+id_question+"' onblur='updateQuestionCoefficient(this)' class='form-control question' id='exampleInputCity1' placeholder='Location'>" +
                            "</div>" +
                            "<div id='reponse-"+ id_question +"'>" +
                                "<label>Réponse</label>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</div>" +
            "</div>";

        return component;
    }

</script>
<script src="/back_office/js/jquery.js"></script>

<script !src="">
    <% for (Question question : questionnaire.getQuestions()) { %>
    writeQuestion(<%=question.getId()%>, "<%=question.getValeur()%>", <%=question.getCoefficient()%>);
    <% for(Reponse reponse : question.getReponses()) { %>
        writeReponse(<%=question.getId()%>, <%=reponse.getId()%>, "<%=reponse.getValeur()%>");
        <% } %>
    <% } %>

    function updateReponseValeur(input) {
        let id = input.getAttribute("data-id-response");
        let question_id = input.getAttribute("data-id-question");
        let active = input.getAttribute("data-active");
        let value = input.value;
        if (active != 'true') {
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/update-reponse-valeur",
                data: {
                    id : id,
                    valeur : value
                },
                success: function() {
                    input.value = value;
                },
                error: function() {
                    $("#result").text("Erreur lors de la sauvegarde.");
                }
            });
        } else {
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/add-reponse",
                data: {
                    id: id,
                    valeur: value,
                    question_id: question_id
                },
                success: function(reponse) {
                    input.setAttribute("data-active", "false");
                    input.value = reponse.valeur;
                    writeReponse(reponse.questionId, reponse.id, reponse.valeur);
                },
                error: function() {
                    $("#result").text("Erreur lors de la sauvegarde.");
                }
            });
        }
    }

    function addQuestion() {
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/create-question",
            data: {
                questionnaire_id: <%= questionnaire.getId() %>
            },
            success: function(result) {
                writeQuestion(result.id, result.valeur, result.coefficient);
                writeReponse(result.id, result.reponses[0].id, result.reponses[0].valeur);

            },
            error: function() {
                $("#result").text("Erreur lors de la sauvegarde.");
            }
        });
    }
    function updateQuestionType(input) {
        let id = input.getAttribute("data-id-question");
        let value = input.value;
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/update-question-type",
            data: {
                id : id,
                type : value
            },
            success: function() {
                console.log("updated");
            },
            error: function() {
                $("#result").text("Erreur lors de la sauvegarde.");
            }
        });
    }
    function updateReponseVrai(input) {
        let id = input.getAttribute("data-id-reponse");
        let value = input.value;
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/update-reponse-vrai",
            data: {
                id : id,
                vrai : value
            },
            success: function() {
                console.log("updated");
            },
            error: function() {
                $("#result").text("Erreur lors de la sauvegarde.");
            }
        });
    }

    function updateQuestionValeur(input) {
        let id = input.getAttribute("data-id-question");
        let value = input.value;
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/update-question-valeur",
            data: {
                id : id,
                valeur : value
            },
            success: function() {
                console.log("updated");
            },
            error: function() {
                $("#result").text("Erreur lors de la sauvegarde.");
            }
        });
    }
    function updateQuestionCoefficient(input) {
        let id = input.getAttribute("data-id-question");
        let value = input.value;
        $.ajax({
            type: "POST",
            url: "http://localhost:8080/update-question-coefficient",
            data: {
                id : id,
                coefficient : value
            },
            success: function() {
                console.log("updated");
            },
            error: function() {
                $("#result").text("Erreur lors de la sauvegarde.");
            }
        });
    }

    $(document).ready(function() {
        $("#add-question").click(function() {
            addQuestion();
        });
    });

</script>
