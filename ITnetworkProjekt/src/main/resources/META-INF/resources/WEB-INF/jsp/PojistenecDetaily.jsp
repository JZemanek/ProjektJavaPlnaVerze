<%@page isELIgnored="false" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="cs-cz">
    <head>
        <!-- Navbar -->
        <%@include file="common/navbar.jspf" %>
        <!-- CSS styly -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/DetailyPojistenceStyle.css" rel="stylesheet" type="text/css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pojištěnec</title>
    </head>
    <body>
        <!-- Zobrazení zprávy v případě úpěšného přidání pojištěnce při přechodu ze stránky PridatPojistence -->
        <c:if test="${zobrazZpravu}">
            <div class="alert alert-success alert-dismissible fade show text-center" style="max-height: 50px">
                <button type="button" class="close" data-bs-dismiss="alert" aria-label="Close
                        style="border: none; background-color: transparent;">
                    <span aria-hidden="true">&times;</span>
                </button>
                <p>Přidání proběhlo úspěšně.</p>
            </div>
        </c:if>

        <!-- Foto pojištěnce -->
        <div class="container py-4 col-md-3 text-left">
            <img src="images/avatar.png" alt="avatar"
                 style="width: 19.5%; position: absolute; margin-top: 4.5%; margin-left: -25%"/>
        </div>
        
        <div class="container py-4 col-md-3">
            <h6>Informace o pojištěnci:</h6>
            <!-- Tabulka s informacemi o pojištěnci -->
            <table class="table table-bordered" border="2" modelAttribute="pojistenec">
                <tbody>
                    <tr>
                        <th>Jméno</th>
                        <td>${pojistenec.jmeno}</td>
                    </tr>
                    <tr>
                        <th>Píjmení</th>
                        <td>${pojistenec.prijmeni}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${pojistenec.email}</td>
                    </tr>
                    <tr>
                        <th>Telefonní číslo</th>
                        <td>${pojistenec.telCislo}</td>
                    </tr>
                    <tr>
                        <th>Adresa</th>
                        <td>${pojistenec.uliceACisloPopisne}</td>
                    </tr>
                    <tr>
                        <th>Město</th>
                        <td>${pojistenec.mesto}</td>
                    </tr>
                    <tr>
                        <th>PSČ</th>
                        <td>${pojistenec.psc}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="container col-md-7" style="margin-top: 4%">
            <div class="table-responsive">
                <!-- Tabulka se všemi pojištěními vztahujících se k aktuálnímu pojištěnci -->
                <table class="table table-hover col-6" id="tabulkaPojisteni" modelAttribute="pojistenec" modelAttribute="idPojistence">
                    <thead>
                        <tr class="text-center">
                            <th>Typ pojištění</th>
                            <th>Předmět pojištění</th>
                            <th>Částka</th>
                            <th>Platnost od</th>
                            <th>Platnost do</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <c:forEach items="${seznamPojisteniProPojistence}" var="pojisteni">
                            <tr>
                                <td>${pojisteni.typPojisteni}</td>
                                <td>${pojisteni.predmetPojisteni}</td>
                                <td>${pojisteni.castka}</td>
                                <td>
                                    <fmt:parseDate  value="${pojisteni.platnostOd}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd.MM.yyyy"/>
                                </td>
                                <td>
                                    <fmt:parseDate  value="${pojisteni.platnostDo}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd.MM.yyyy"/>
                                </td>
                                <td>
                                    <a href="odstranit-pojisteni/${pojisteni.pojisteniId}" type="button" class="btn btn-sm btn-outline-danger">
                                        Odstranit pojištění
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <!-- Tlačítko pro přidání pojištění k aktuálnímu pojištěnci -->
                <a href="pridat-pojisteni?idPojistence=${idPojistence}" type="button" class="btn btn-outline-primary">Přidat pojištění</a>
            </div>
        </div>

        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>