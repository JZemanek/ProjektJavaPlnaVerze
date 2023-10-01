<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html lang="cs-cz">
    <head>

        <%@include file="common/navbar.jspf" %>
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pojištěnci</title>
    </head>

    <!-- Zobrazení zprávy v případě úspěšného přidání pojištěnce -->
    <c:if test="${zobrazZprávu}">
        <div class="alert alert-success text-center" style="max-height: 50px">
            <p>Přidání pojištěnce proběhlo úspěšně.</p>
        </div>
    </c:if>

    <body>
        <div class="container col-8">
            <div class="table-responsive">
                <!-- Začátek tabulky -->
                <table class="table table-hover" id="tabulkaPojistencu" style="margin-top: 10%;">
                    <thead>
                        <tr class="text-center">
                            <th>Jméno</th>
                            <th>Příjmení</th>
                            <th>e-mail</th>
                            <th>Tel. číslo</th>
                            <th>Město</th>
                            <th>Adresa</th>
                            <th>PSČ</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    
                    <tbody>
                        <c:forEach items="${seznamPojistencu}" var="pojistenec">
                            <tr class="text-center">
                                <td>${pojistenec.jmeno}</td>
                                <td>${pojistenec.prijmeni}</td>
                                <td>${pojistenec.email}</td>
                                <td>${pojistenec.telCislo}</td>
                                <td>${pojistenec.mesto}</td>
                                <td>${pojistenec.uliceACisloPopisne}</td>
                                <td>${pojistenec.psc}</td>
                                <!-- Tlačítko pro přesměrování na detaily pojištěnce -->
                                <td class="text-center">
                                    <a href="detaily-pojistence?idPojistence=${pojistenec.id}" class="btn btn-outline-primary btn-sm text-center"
                                       id="zobrazitTlacitko" style="padding-top: -30px">Zobrazit</a>
                                </td>
                                <!-- Tlačítko pro odstranění pojištěnce včetně všech jeho pojištění -->
                                <td><a href="odstranit-pojistence?idPojistence=${pojistenec.id}" class="btn btn-outline-danger btn-sm text-center"
                                       id="tlacitkoSmazat" style="padding-top: -30px">Smazat</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <!-- Konec tabulky -->
                </table>
                <!-- Tlačítko pro přesměrování na pro přidání nového pojištěnce -->
                <div>
                    <a type="button" class="btn btn-outline-primary" id="pridatPojistenceBtn" href="pridat-pojistence">
                        Přidat pojištěnce
                    </a>
                </div>
            </div>
        </div>

        <!-- Scripty -->
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
    </body>
</html>