<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <link rel="icon" type="image" href="./assets/images/logo.png" />
          <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
          <link rel="stylesheet" href="index.css">
          <title>Check-out</title>
        </head>

        <body>
          <jsp:include page="components/header/header.jsp"></jsp:include>


          <main>
            <h2 class="title">Resumo do Pedido</h2>

            <!-- Verifica se a lista de produtos não está vazia -->
            <c:if test="${not empty products}">
              <div class="finalproductsContainer">
                <c:forEach var="product" items="${products}">
                  <div class="product-summary">

                    <img src="${product.image}" alt="Produto: ${product.title}" />

                    <p><strong>Produto:</strong> ${product.title}</p>
                    <p><strong>Tag:</strong> ${product.tag}</p>
                    <p><strong>Preço Unitário:</strong> R$ ${product.price}</p>
                    <p><strong>Quantidade:</strong> ${product.quantity}</p>
                    <!-- Cálculo do preço total por produto -->
                    <c:set var="rawPrice" value="${product.price}" />
                    <c:set var="rawQuantity" value="${product.quantity}" />
                    <c:set var="priceWithoutSymbol" value="${fn:replace(rawPrice, 'R$', '')}" />
                    <c:set var="priceFormatted" value="${fn:replace(priceWithoutSymbol, ',', '.')}" />
                    <c:set var="unitPrice" value="${priceFormatted != null ? priceFormatted : '0'}" />
                    <c:set var="quantity" value="${rawQuantity != null ? rawQuantity : '0'}" />
                    <c:set var="totalPrice" value="${unitPrice * quantity}" />
                    <fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0.00" var="formattedTotal" />
                    <p><strong>Total:</strong> R$ ${fn:replace(formattedTotal, '.', ',')}</p>

                  </div>
                </c:forEach>
              </div>
            </c:if>

            <c:if test="${empty products}">
              <p>O carrinho está vazio.</p>
            </c:if>
          </main>

          <footer>
            <jsp:include page="components/footer/footer.jsp"></jsp:include>
          </footer>
          <script src="./resources/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>