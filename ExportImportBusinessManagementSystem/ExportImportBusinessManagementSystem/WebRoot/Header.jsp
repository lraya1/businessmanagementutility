<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


	<body>
		<c:if test="${sessionScope.role!='null'}">

			<c:choose>
				<c:when test="${sessionScope.role=='Admin'}">
					<jsp:include page="./Adminoptions.jsp" />
				</c:when>


				<c:when test="${sessionScope.role=='employee'}">
					<jsp:include page="./EmployeeOptions.jsp" />
				</c:when>


				<c:when test="${sessionScope.role=='user'}">
					<jsp:include page="./UserOptions.jsp" />
				</c:when>

				<c:otherwise>
					<jsp:include page="./generalOptions.jsp" />
				</c:otherwise>
			</c:choose>
		</c:if>

	</body>
</html>
