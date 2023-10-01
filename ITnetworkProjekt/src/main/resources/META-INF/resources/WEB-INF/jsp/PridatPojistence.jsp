<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<head>
    <!-- navbar -->
    <%@include file="common/navbar.jspf" %>
    
    <!-- CSS styly -->
    <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
    <link href="/css/PridatPojistenceStyle.css" rel="stylesheet" type="text/css"/>
    <!-- Mwta -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Přidání pojištěnce</title>
</head>
<body>
<div class="container col-lg-5 col-md-8 col-sm-10 col-12 p-5" style="margin-top: 7%; background-color: #2873b5; border-radius: 5%;">
    <!-- Začátek formuláře -->
    <form:form class="row g-3" action="pridat-pojistence" method="post" modelAttribute="pojistenec">
        <h2 class="text-center text-white" style="font-family: serif">Nový pojištěnec</h2>
                <!-- První sloupec formuláře -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-white">
            <!-- První buňka -->
            <div class="form-group">
                <label for="jmenoRegistrace" class="form-label" id="jmenoRegLabel">Jméno</label>
                <input type="text" class="form-control" id="jmenoRegistrace" name="jmeno" placeholder="Jan" required="">
            </div>
            <!-- Druhá buňka -->
            <div class="form-group">
                <label for="prijmeniRegistrace" class="form-label" id="prijmeniRegLabel">Příjmení</label>
                <input type="text" class="form-control" id="prijmeniRegistrace" name="prijmeni" placeholder="Novák" required="">
            </div>
            <!-- třetí buňka -->
            <div class="form-group">
                <label for="telefonRegistrace" class="form-label" id="telefonRegLabel">Telefonní číslo</label>
                <form:input path="telCislo" type="text" class="form-control" id="telefonRegistrace" name="telCislo" placeholder="123456789" required="" bind="${false}"/>
                <!-- Vytvoří chybovou hlášku v případě neplatného formátu -->
                <form:errors path="telCislo" cssClass="text-danger font-weight-bold"/>
            </div>
            <!-- Čtvrtá buňka -->
            <div class="form-group">
                <label for="emailRegistrace" class="form-label" id="emailRegLabel">E-mail</label>
                <form:input path="email" type="text" class="form-control" id="emailRegistrace" name="email" placeholder="jan.novak@aquapojistovna.cz" required=""/>
                <!-- Vytvoří chybovou hlášku v případě neplatného formátu -->
                <form:errors path="email" cssClass="text-danger font-weight-bold" />
            </div>
        </div>
            <!-- Druhý sloupec formuláře -->
        <div class="col-lg-6 col-md-6 col-sm-12 col-12 text-white">
            <!-- První buňka -->
            <div class="form-group">
                <label for="adresaRegistrace" class="form-label" id="adresaRegLabel">Adresa</label>
                <input type="text" class="form-control" id="adresaRegistrace" name="uliceACisloPopisne" placeholder="Pražská 1" required="">
            </div>
            <!-- Druhá buňka -->
            <div class="form-group">
                <label for="mestoRegistrace" class="form-label" id="mestoRegLabel">Město</label>
                <input type="text" class="form-control" id="mestoRegistrace" name="mesto" placeholder="Praha" required="">
            </div>
            <!-- Třetí buňka -->
            <div class="form-group">
                <label for="pscRegistrace" class="form-label" id="pscRegistraceLabel">PSČ</label>
                <form:input path="psc" type="text" class="form-control" id="pscRegistrace" name="psc" placeholder="12345" required="" bind="${false}"/>
                <!-- Vytvoří chybovou hlášku v případě neplatného formátu -->
                <form:errors path="psc" cssClass="text-danger"/>
            </div>
            <!-- Submit tlačítko pro přidání pojištěnce -->
            <div class="form-group" id="submitBtn">
                <button type="submit" class="btn btn-lg btn-outline-light" id="registraceBtn">
                    Přidat pojištěnce
                </button>
            </div>
        </div>
            <!-- Konec formuláře -->
    </form:form>
</div>

    <!-- Scripty -->
    <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</body>
</html>