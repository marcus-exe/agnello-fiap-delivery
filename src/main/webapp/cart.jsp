<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="icon" type="image" href="./assets/images/logo.png" />
      <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="index.css">
      <title>Carrinho</title>
    </head>

    <body>
      <jsp:include page="components/header/header.jsp"></jsp:include>

      <main>
        <h1 class="title">Produtos no Carrinho</h1>

        <c:if test="${not empty cart}">
          <form action="finalCart" method="post">
            <div class="product-container">
              <c:forEach var="cartItem" items="${cart}">
                <div class="product" id="product-${cartItem.id}">
                  <div class="product-image">
                    <img src="${cartItem.image}" alt="${cartItem.title} image">
                  </div>
                  <div class="product-details">
                    <h1>${cartItem.title}</h1>
                    <h2 class="price">R$ ${cartItem.price}</h2>

                    <!-- Star rating -->
                    <div class="stars">
                      <span>★ ★ ★ ★ ☆</span>
                    </div>

                    <p class="description">${cartItem.tag}</p>

                    <!-- Controlador de quantidade -->
                    <div class="quantityControl">
                      <button class="quantityControlButton" type="button" onclick="decrease(${cartItem.id})">-</button>
                      <input type="text" id="quantity-${cartItem.id}" name="quantity-${cartItem.id}"
                        value="${cartItem.quantity}" readonly>
                      <button class="quantityControlButton" type="button" onclick="increase(${cartItem.id})">+</button>
                    </div>

                    <!-- Campos ocultos para passar os dados do produto -->
                    <input type="hidden" name="productId-${cartItem.id}" value="${cartItem.id}" />
                    <input type="hidden" name="title-${cartItem.id}" value="${cartItem.title}" />
                    <input type="hidden" name="image-${cartItem.id}" value="${cartItem.image}" />
                    <input type="hidden" name="tag-${cartItem.id}" value="${cartItem.tag}" />
                    <input type="hidden" name="price-${cartItem.id}" value="${cartItem.price}" />
                  </div>
                </div>
              </c:forEach>
            </div>
            <button class="add-to-cart" type="submit">Fechar Pedido</button>
          </form>
        </c:if>

        <c:if test="${empty cart}">
          <p>O carrinho está vazio.</p>
        </c:if>

      </main>

      <footer>
        <jsp:include page="components/footer/footer.jsp"></jsp:include>
      </footer>

      <script>
        // Função para aumentar a quantidade
        function increase(productId) {
          let quantityInput = document.getElementById("quantity-" + productId);
          if (quantityInput) {
            quantityInput.value = parseInt(quantityInput.value) + 1;
          } else {
            console.error("Input de quantidade não encontrado para o produto com ID: " + productId);
          }
        }

        // Função para diminuir a quantidade e remover o produto se a quantidade for 1
        function decrease(productId) {
          let quantityInput = document.getElementById("quantity-" + productId);
          if (quantityInput) {
            let current = parseInt(quantityInput.value);
            if (current > 1) {
              quantityInput.value = current - 1;
            } else {
              // Remover o produto do carrinho quando a quantidade for 1
              removeProduct(productId);
            }
          } else {
            console.error("Input de quantidade não encontrado para o produto com ID: " + productId);
          }
        }

        // Função para remover o produto do carrinho
        function removeProduct(productId) {
          // Encontrar o produto no DOM e removê-lo
          let productElement = document.getElementById("product-" + productId);
          if (productElement) {
            productElement.remove(); // Remove o item do carrinho na página
          }
        }
      </script>

      <script src="./resources/js/bootstrap.bundle.min.js"></script>
    </body>


    </html>