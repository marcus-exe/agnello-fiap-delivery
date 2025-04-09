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
      <title>Produtos</title>
      
      <script type="text/javascript">
        <c:if test="${productAdded}">
            alert("Produto adicionado ao carrinho com sucesso!");
        </c:if>
    </script>
    </head>

    <body>
      <jsp:include page="components/header/header.jsp"></jsp:include>
      <main>
        <div class="productsTitleDiv">
          <img src="./assets/images/products.jpg" alt="products banner image">
          <h1>Produtos</h1>
        </div>

        <div class="productsContainer">
          <div class="productsDiv">
            <c:forEach var="product" items="${products}">
              <form action="products" method="post">
                <div class="productDiv">
                  <img src="${product.image}" alt="${product.title} image">
                  <div class="productInfoDiv">  
                    <h2>${product.title}</h2>
                      <p>${product.tag}</p>
                    <h2>R$ ${product.price}</h2>
                  </div>
                  <input type="hidden" name="title" value="${product.title}" />
        		  <input type="hidden" name="image" value="${product.image}" />
        		  <input type="hidden" name="tag" value="${product.tag}" />
                  <input type="hidden" name="price" value="${product.price}" />
                  <input type="hidden" name="id" value="${product.id}" />
                  <button class="submitbutton" type="submit">Adicionar</button>
                </div>
              </form>
            </c:forEach>
          </div>
          <div class="productsDiv">
            <c:forEach var="product" items="${products}">
              <form action="products" method="post">
                <div class="productDiv">
                  <img src="${product.image}" alt="${product.title} image">
                  <div class="productInfoDiv">  
                    <h2>${product.title}</h2>
                      <p>${product.tag}</p>
                    <h2>R$ ${product.price}</h2>
                  </div>
                  <input type="hidden" name="title" value="${product.title}" />
        		  <input type="hidden" name="image" value="${product.image}" />
        		  <input type="hidden" name="tag" value="${product.tag}" />
                  <input type="hidden" name="price" value="${product.price}" />
                  <input type="hidden" name="id" value="${product.id}" />
                  <button class="submitbutton" type="submit">Adicionar</button>
                </div>
              </form>
            </c:forEach>
          </div>
		  <div class="productsDiv">
            <c:forEach var="product" items="${products}">
              <form action="products" method="post">
                <div class="productDiv">
                  <img src="${product.image}" alt="${product.title} image">
                  <div class="productInfoDiv">  
                    <h2>${product.title}</h2>
                      <p>${product.tag}</p>
                    <h2>R$ ${product.price}</h2>
                  </div>
                  <input type="hidden" name="title" value="${product.title}" />
        		  <input type="hidden" name="image" value="${product.image}" />
        		  <input type="hidden" name="tag" value="${product.tag}" />
                  <input type="hidden" name="price" value="${product.price}" />
                  <input type="hidden" name="id" value="${product.id}" />
                  <button class="submitbutton" type="submit">Adicionar</button>
                </div>
              </form>
            </c:forEach>
          </div>
        </div>
      </main>
      <footer>
        <jsp:include page="components/footer/footer.jsp"></jsp:include>
      </footer>
      
      <script src="./resources/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>