<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Borrow List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<%@ include file="header.jsp"%>
</head>
<body>
	<div class="container mt-5">
		<h1>Borrow List</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>User Name</th>
					<th>Book Name</th>
					<th>Borrow Date</th>
					<th>Due Date</th>
					<th>Return Date</th>
					<th>Fine</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<!-- Add rows dynamically here using a loop -->
				<c:forEach items="${borrowList}" var="borrow">
					<tr>
						<td>${borrow.user.name}</td>
						<td>${borrow.book.title}</td>
						<td>${borrow.borrowDate}</td>
						<td>${borrow.dueDate}</td>
						<c:choose>
							<c:when test="${empty borrow.returnDate}">
								<td>-</td>
							</c:when>
							<c:otherwise>
								<td>${borrow.returnDate}</td>
							</c:otherwise>
						</c:choose>
						<td>${borrow.fine}</td>
						<td><c:choose>
								<c:when test="${borrow.returned}">
                                    Returned
                                </c:when>
								<c:otherwise>
									<a href="return-borrow?borrowId=${borrow.borrowId}"
										class="btn btn-info">Return</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>

</body>
</html>