<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>History</title>
<link rel="icon" href="../../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet" href="../../assets/css/main_page.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="../../assets/js/script.js"></script>
<script src="../../assets/js/sidebar.js" defer></script>
<link
	href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"
	rel="stylesheet">
<style type="text/css">
.dataTables_wrapper .dataTables_filter {
	text-align: center;
}

#borrowTable a {
	text-decoration: underline;
	color: var(--primary-color);
}
</style>
</head>
<body>

	<nav class="sidebar" id="sidebar">
		<div class="side-header">
			<div class="logo">
				<i class="bi bi-book-half"></i>
				<p>Bookly</p>
			</div>
			<div class="divider-line"></div>
			<div class="nav-list">
				<a href="../book-list" class="nav-items"><i
					class="bi bi-building"></i>
					<p>Library</p>
					<div class="tooltip" role="tooltip" style="top: 140px"
						data-popper-placement="right">
						Library
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="../borrow-list" class="nav-items"><i
					class="bi bi-inboxes"></i>
					<p>Borrow List</p>
					<div class="tooltip" role="tooltip" style="top: 195px"
						data-popper-placement="right">
						Borrow List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="../create-book" class="nav-items"><i
					class="bi bi-file-plus"></i>
					<p>Create Book</p>
					<div class="tooltip" role="tooltip" style="top: 255px"
						data-popper-placement="right">
						Create Book
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="../user-list" class="nav-items "><i
					class="bi bi-person-fill"></i>
					<p>User List</p>
					<div class="tooltip" role="tooltip" style="top: 310px"
						data-popper-placement="right">
						User List
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="../book-request" class="nav-items "><i
					class="bi bi-hdd-stack"></i>
					<p>Book Request List</p>
					<div class="tooltip" role="tooltip" style="top: 370px;"
						data-popper-placement="right">
						Book Request List
						<div class="arrow" data-popper-arrow></div>
					</div> </a>
			</div>
		</div>
		<div class="side-footer">
			<div class="dark-toggle">
				<a href="#" onclick="darkMode()" class="nav-items"><i
					class="bi bi-moon-stars-fill dark-light"></i>
					<p class="da-li-text">Dark mode</p>
					<div class="tooltip" role="tooltip"
						style="bottom: 115px; top: unset" data-popper-placement="right">
						Theme
						<div class="arrow" data-popper-arrow></div>
					</div> </a> <a href="#" class="nav-items" id="sign-out"><i
					class="bi bi-box-arrow-left"></i>
					<p>Log Out</p>
					<div class="tooltip" role="tooltip"
						style="bottom: 55px; top: unset" data-popper-placement="right">
						Log-Out
						<div class="arrow" data-popper-arrow></div>
					</div> </a>
			</div>
		</div>
	</nav>



	<section class="main-container">
		<jsp:include page="header.jsp"></jsp:include>
		<main class="history-container">
			<h3 id="history-table-heading">Borrow History of
				${borrowList[0].user.name}</h3>
			<div class="history-table-wrapper">

				<table id="borrowTable" class="display">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Book Title</th>
							<th>Borrow Date</th>
							<th>Due Date</th>
							<th>Return Date</th>
							<th>Status</th>
							<th>Fine</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="borrow" items="${borrowList}" varStatus="loop">
							<tr>
								<td>${loop.index + 1}</td>
								<td>${borrow.book.title}</td>
								<td><script>
				    document.write(moment(
					    "${borrow.borrowDate}").format(
					    "MMMM Do, YYYY"));
				</script></td>
								<td><script>
				    document.write(moment("${borrow.dueDate}")
					    .format("MMMM Do, YYYY"));
				</script></td>
								<td><script>
				    document
					    .write((moment("${borrow.returnDate}")
						    .isValid()) ? moment(
						    "${borrow.returnDate}")
						    .format("MMMM Do, YYYY")
						    : "-");
				</script></td>
								<td><span
									class="${borrow.returned ? 'borrow-status status completed' : 'borrow-status status'}">
										${borrow.returned ? 'Returned' : 'Pending'} </span></td>

								<td>₹ ${borrow.fine}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
	</section>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/v/dt/dt-1.13.6/datatables.min.js"></script>
	<script>
	$(document).ready(function() {
	    $('#borrowTable').DataTable();
	});
    </script>
</body>
</html>
