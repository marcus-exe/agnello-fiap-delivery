<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="br.com.vinheiriaAgnello.classes.Categories"%>


<section class="categoriesContainer" >
  <h2 class="categoriesTitle">Vinhos para todos os momentos</h2>
  
  <% 
    
    Categories[] categories = {
        new Categories("Tintos", "assets/images/vinho-tinto.jpg"),
        new Categories("Brancos", "assets/images/vinho-branco.jpg"),
        new Categories("Rosés", "assets/images/vinho-rose.jpg"),
        new Categories("Espumantes", "assets/images/vinho-espumante.jpg"),
        new Categories("Licorosos", "assets/images/vinho-licoroso.jpg"),
        new Categories("Sobremesa", "assets/images/vinho-sobremesa.jpg"),
    };

    request.setAttribute("categories", categories);
  %>

  <div class="categoriesDiv">  
	  <c:forEach var="category" items="${categories}">
	        <div class="categoryDiv">
	            <img class="cardImage shadow-sm" src="${category.image}" alt="${category.name}" width="100" height="100" />
	            <h3 class="carTitle">${category.name}</h3>
	        </div>
	    </c:forEach>
  </div>
  
</section>