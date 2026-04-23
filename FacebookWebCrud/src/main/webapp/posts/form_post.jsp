<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-icons.css">
	<title>Cadastro de Post</title>
</head>
<body>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-3"></div>
			
			<div class="col-md-6">
				<form action="${pageContext.request.contextPath}/posts/save" method="GET">
					<h1>${post eq null ? "Cadastro" : "Atualização"} de Post</h1>
					
					<div class="mb-3">
						<a class="bi bi-file-text" href="${pageContext.request.contextPath}/posts"> Voltar para Posts</a>
					</div>
					
					<input type="hidden" name="post_id" value="${post.getId()}"> 
					
					<div class="mb-3">
						<label for="post_content_id" class="form-label">
							Conteúdo da Postagem
						</label>
						<textarea 
						       id="post_content_id"
						       name="post_content"
						       class="form-control"
						       placeholder="O que você está pensando?"
						       rows="4"
						       required>${post.getContent()}</textarea>
					</div>
					
					<div class="mb-3">
						<label for="user_id_fk" class="form-label">Autor (Usuário)</label>
						<select id="user_id_fk" name="user_id_fk" class="form-select" required ${post ne null ? 'disabled' : ''}>
							<option value="">Selecione um autor...</option>
							<c:forEach var="u" items="${usuarios}">
								<option value="${u.getId()}" ${post.getUser().getId() == u.getId() ? 'selected' : ''}>
									${u.getName()}
								</option>
							</c:forEach>
						</select>
						
						<c:if test="${post ne null}">
							<input type="hidden" name="user_id_fk" value="${post.getUser().getId()}">
						</c:if>
					</div>
					
					<button type="submit" class="btn btn-primary mt-2">
						${post eq null ? "Cadastrar" : "Atualizar"}
					</button>
				</form>
			</div>
			
			<div class="col-md-3"></div>
		</div>	
	</div>
</body>
</html>