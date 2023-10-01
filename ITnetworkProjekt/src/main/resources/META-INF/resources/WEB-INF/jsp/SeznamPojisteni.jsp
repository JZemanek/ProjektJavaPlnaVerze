<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>

<html lang="cs-cz">
    <head>

        <!-- Navbar -->
        <%@include file="common/navbar.jspf" %>
        <!-- CSS styly -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/DetailyPojistenceStyle.css" rel="stylesheet" type="text/css"/>
        
        <!-- Meta -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Seznam pojištění</title>
    </head>
    <body>
        <div class="container col-9">
            <div class="table-responsive">
                <!-- Začátek tabulky -->
                <table class="table table-hover" id="tabulkaPojistencu" style="margin-top: 10%;"  modelAttribute = "pojistenec">
                    <thead>
                        <tr class="text-center">
                            <th>Číslo pojištění</th>
                            <th>Typ pojištění</th>
                            <th>Předmět</th>
                            <th>Částka</th>
                            <th>Pojištěnec</th>
                            <th>Platnost Od</th>
                            <th>Platnost Do</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${seznamVsechPojisteni}" var="pojisteni">
                            <tr class="text-center">
                                <td>${pojisteni.pojisteniId}</td>
                                <td>${pojisteni.typPojisteni}</td>
                                <td>${pojisteni.predmetPojisteni}</td>
                                <td>${pojisteni.castka}</td>
                                <td>${pojisteni.pojistenec.jmeno} ${pojisteni.pojistenec.prijmeni}</td>
                                <td>
                                    <!-- Naparsování data -->
                                    <fmt:parseDate  value="${pojisteni.platnostOd}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd.MM.yyyy"/>
                                </td>
                                <td>
                                    <!-- Naparování data -->
                                    <fmt:parseDate  value="${pojisteni.platnostDo}"  type="date" pattern="yyyy-MM-dd" var="parsedDate" />
                                    <fmt:formatDate value="${parsedDate}" pattern="dd.MM.yyyy"/>
                                </td>
                                <!-- Tlačítko pro přesměrování na stránku s detaily pojištěnce propojeného s aktuálním pojištění. -->
                                <td class="text-center">
                                    <a href="detaily-pojistence?idPojistence=${pojisteni.pojistenec.id}"
                                       class="btn btn-outline-primary btn-sm text-center"
                                       id="zobrazitTlacitko" style="padding-top: -30px">Zobrazit detaily pojištěnce</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <!-- Konec tabulky -->
                </table>
            </div>
        </div>

        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>

    </body>
</html>