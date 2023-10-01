<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="cs-cz">
    <head>
        <!-- Navbar -->
        <%@include file="common/navbar.jspf" %>

        <!-- CSS styly -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/SeznamPojistencuStyle.css" rel="stylesheet" type="text/css"/>

        <!-- Meta -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nové pojištění</title>
    </head>
    <body>
        <div class="container col-md-6 mt-5">
            <!-- Formulář pro přidání pojištění -->
            <form class="row g-3" action="pridat-pojisteni" method="POST" modelAttribute="pojisteni" 
                  modelAttribute="pojistenec" modelAttribute="idPojistence">
                <!-- Buňka pro výběr typu pojištění -->
                <div class="col-md-12">
                    <label class="form-label" for="typPojisteni">Pojištění</label>
                    <select class="form-select" id="typPojisteni" name="typPojisteni">
                        <option value="Pojištění nemovitost">Pojištění nemovitost</option>
                        <option value="Pojištění majetku">Pojištění majetku</option>
                        <option value="Pojištění odpovědnosti">Pojištění odpovědnosti</option>
                        <option value="Úrazové pojištění">Úrazové pojištění</option>
                    </select>
                </div>

                <!-- První sloupec -->
                <div class="col-md-6">
                    <!-- Buňka 1 - částka pojištění -->
                    <div class="mb-3">
                        <label for="castkaPojisteni" class="form-label">Částka</label>
                        <input type="text" class="form-control" name="castka" id="castkaPojisteni" placeholder="1000000" required>
                    </div>
                    <!-- Buňka 2 - začátek platnosti pojištění -->
                    <div class="mb-3">
                        <label for="platnostOd" class="form-label">Platnost od</label>
                        <input type="date" class="form-control" name="platnostOd" id="platnostOd" placeholder="1.1.2024" required>
                    </div>
                </div>

                <!-- Druhý sloupec -->
                <div class="col-md-6">
                    <!-- Buňka 1 - předmět pojištění -->
                    <div class="mb-3">
                        <label for="predmetPojisteni" class="form-label">Předmět pojištění</label>
                        <input type="text" class="form-control" name="predmetPojisteni" id="predmetPojisteni" placeholder="Byt" required>
                    </div>
                    <!-- Buňka 2 - konec platnosti pojištění -->
                    <div class="mb-3">
                        <label for="platnostDo" class="form-label">Platnost do</label>
                        <input type="date" class="form-control" name="platnostDo" id="platnostDo" placeholder="1.1.2025" required>
                    </div>
                </div>

                <!-- Skrytá buňka pro id pojištěnce -->
                <input type="text" name="pojistenec" hidden value="${pojistenec.id}">

                <!-- Tlačítko pro potvrzení -->
                <div class="col-md-12">
                    <button type="submit" class="btn btn-primary">Přidat pojištění</button>
                </div
                <!-- Konec formuláře -->
            </form>
        </div>

        <!-- Scripty -->
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
    </body>
</html>

