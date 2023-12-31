<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Book Detail</title>
<link rel="stylesheet" href="../../assets/css/main_page.css" />
<link rel="stylesheet" href="../../assets/css/book-request.css" />
<link rel="stylesheet" href="../../assets/css/admin_pages.css" />
<link rel="icon" href="../../assets/images/book-half.svg"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"
	integrity="sha512-42PE0rd+wZ2hNXftlM78BSehIGzezNeQuzihiBCvUEB3CVxHvsShF86wBWwQORNxNINlBPuq7rG4WWhNiTVHFg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tagify/4.17.8/tagify.min.js"
	integrity="sha512-7vyDVrzHbIl2MbbDj2lgeXUVSe4NSbY5jn030+QN321CTl8XEc3J5Qlq976YY5gs+Ifwff9Q2SrDXLPWxAp2oQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://upload-widget.cloudinary.com/global/all.js"
	type="text/javascript">
    
</script>
<script src="../../assets/js/script.js"></script>
<script src="../../assets/js/sidebar.js" defer></script>
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

		<form action="update?bookId=${book.bookId}" method="post"
			class="book-edit-container">
			<div class="book-edit-left-wrap">
				<div class="book-edit-image">
					<img src="${book.coverImage }" alt="" width="200px" /> <i
						class="bi bi-pencil-fill"></i> <input type="hidden"
						name="coverImage" id="ed-cover-image" value="${book.coverImage}" />
				</div>
				<div class="button-grp">
					<button class="book-edit submit" type="button">Edit Book</button>
					<button class="book-delete submit" type="button">Delete
						Book</button>
					<button class="book-save submit" type="submit"
						style="display: none">Save Changes</button>
					<button class="book-cancel submit" type="button"
						style="display: none">Cancel</button>
				</div>
			</div>
			<div class="book-edit-right-wrap">
				<div class="input-group">
					<label for="ed-book-title">Title : </label>
					<div class="input-field">
						<input type="text" name="title" id="ed-book-title"
							class="input ed-input" value="${book.title}" disabled />
					</div>
				</div>
				<div class="input-group">
					<label for="ed-book-author">Author :</label>
					<div class="input-field">
						<input type="text" name="author" id="ed-book-author"
							class="input ed-input" value="${book.author}" disabled />
					</div>
				</div>
				<div class="input-group">
					<label for="ed-book-publisher">Publisher :</label>
					<div class="input-field">
						<input type="text" name="publisher" id="ed-book-publisher"
							class="input ed-input" value="${book.publisher}" disabled />
					</div>
				</div>
				<div class="input-group">
					<label for="ed-book-tags">Genre : </label>
					<div class="input-field" style="height: unset">
						<input name="genre" class="custom-tag ed-input"
							placeholder="Enter a custom Tag and Press Enter to Add."
							id="ed-book-tags" style="min-height: 55px" disabled />
					</div>
				</div>

				<div class="input-flex">
					<div class="input-group">
						<label for="ed-language">Language :</label>
						<div class="input-field">
							<input type="text" name="language" id="ed-language"
								class="input ed-input" value="${book.language}" disabled />
						</div>
					</div>
					<div class="input-group">
						<label for="ed-pages">No of Pages :</label>
						<div class="input-field">
							<input type="number" name="pages" id="ed-pages"
								class="input ed-input" value="${book.pages}" disabled />
						</div>
					</div>
				</div>
				<div class="input-group">
					<label for="ed-totalCopies">Total Copies :</label>
					<div class="input-field">
						<input type="number" name="totalCopies" id="ed-totalCopies"
							class="input ed-input" value="${book.totalCopies}" disabled /> <input
							type="number" name="availableCopies" id="ed-availableCopies"
							class="input ed-input" value="${book.availableCopies}"
							hidden="true" disabled />
					</div>
				</div>


				<div class="input-group">
					<label for="ed-book-description">Description : </label>
					<div class="input-field">
						<textarea name="description" id="ed-book-description" cols="30"
							rows="7" class="input ed-input" disabled>${book.description}</textarea>
					</div>
				</div>
			</div>
		</form>
	</section>

	<script type="text/javascript">

	  const editBtn = document.querySelector(".book-edit.submit");
	  const deleteBtn = document.querySelector(".book-delete.submit");
	  const cancelBtn = document.querySelector(".book-cancel.submit");
	  const saveBtn = document.querySelector(".book-save.submit");
	  const imgEditBtn = document.querySelector(".bi-pencil-fill");
	  const genres = '${book.genre}'.split(/[ ,]+/);
	  const str = genres.join(", ");
	  const customInput = document.querySelector('.custom-tag');
	  customInput.value = str;



	  // Add event listener to Edit button to enable form fields for editing
	  editBtn.addEventListener("click", function (e) {
	    e.preventDefault();
	    imgEditBtn.style.display = "block";
	    const editable = document.querySelectorAll(".ed-input");
	    editable.forEach((inp) => {
	      inp.removeAttribute("disabled");
	    });
	    editBtn.style.display = "none";
	    deleteBtn.style.display = "none";
	    cancelBtn.style.display = "block";
	    saveBtn.style.display = "block";
	    const tagify = new Tagify(customInput, {
	      maxTags: 5,
	      dropdown: {
	        maxItems: 20,
	        classname: "tags-look",
	        enabled: 0,
	        closeOnSelect: false,
	      },
	      originalInputValueFormat: valuesArr => {
	            return valuesArr.map(item => item.value).join(', ');
	        },
	        callbacks: {
	            add: () => {
	                customInput.value = tagify.value.map(tag => tag.value).join(', ');
	            },
	            remove: () => {
	                customInput.value = tagify.value.map(tag => tag.value).join(', ');
	            }
	        }
	    });
	    tagify.whitelist = genres;
	  });
	  
	  cancelBtn.addEventListener("click", function () {
	    location.reload();
	  });
	  deleteBtn.addEventListener("click", function () {
	      if (window.confirm("Are you sure you want to delete this book?")) {
		        window.location.href = "../delete-book?bookId="+ ${book.bookId};
		  }
	  });
	  </script>
</body>
</html>
