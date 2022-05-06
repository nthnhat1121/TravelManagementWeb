<%--
  Created by IntelliJ IDEA.
  User: hongn
  Date: 4/18/2022
  Time: 12:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/tours/${categoryId}" var="action"/>
<div class="container-fluid mt-md-3">
    <%--Form tìm kiếm--%>
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <form method="get" action="${action}">
                <div class="row my-3">
                    <%--                    &lt;%&ndash;Ngày khởi hành&ndash;%&gt;--%>
                    <%--                    <div class="col-md-2">--%>
                    <%--                        <div class="form-floating mt-2 px-lg-2 py-lg-2">--%>
                    <%--                            <label for="inputDepartureDate">Ngày khởi hành</label>--%>
                    <%--                            <input class="form-control" id="inputDepartureDate" name="departureDate" type="date"--%>
                    <%--                                   placeholder="Ngày khởi hành" autofocus/>--%>
                    <%--                            <script>--%>
                    <%--                                const departureDate = document.getElementById("inputDepartureDate");--%>
                    <%--                                departureDate.valueAsDate = new Date();--%>
                    <%--                                departureDate.min = departureDate.value;--%>
                    <%--                            </script>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--                    &lt;%&ndash;Nơi đến&ndash;%&gt;--%>
                    <%--                    <div class="col-md-2">--%>
                    <%--                        <div class="form-floating mt-2 px-lg-2 py-lg-2">--%>
                    <%--                            <label for="selectDestinationProvince">Nơi đến</label>--%>
                    <%--                            <select class="form-control" id="selectDestinationProvince" name="destinationProvince">--%>
                    <%--                                <c:forEach var="province" items="${provinces}">--%>
                    <%--                                    <option value="${province.id}">${province.name}</option>--%>
                    <%--                                </c:forEach>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <%--Thời gian đi--%>
                    <div class="col-md-2">
                        <div class="form-floating mt-2 px-lg-2 py-lg-2">
                            <label for="selectDuration">Thời gian đi</label>
                            <select class="form-control" type="checkbox" id="selectDuration" name="durationId">
                                <c:forEach var="duration" items="${durations}">
                                    <option value="${duration.id}">${duration}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <%--                    &lt;%&ndash; Khoảng giá&ndash;%&gt;--%>
                    <%--                    <div class="col-md-2">--%>
                    <%--                        <div class="form-floating mt-2 px-lg-2 py-lg-2">--%>
                    <%--                            <label for="selectRangePrice">Khoảng giá</label>--%>
                    <%--                            <select class="form-control" type="checkbox" id="selectRangePrice" name="rangePrice">--%>
                    <%--                                <option value="1">Dưới 2 triệu</option>--%>
                    <%--                                <option value="2">Từ 2-4 triệu</option>--%>
                    <%--                                <option value="3">Từ 4-6 triệu</option>--%>
                    <%--                                <option value="4">Từ 6-10 triệu</option>--%>
                    <%--                                <option value="5">Trên 10 triệu</option>--%>
                    <%--                            </select>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <div class="col-md-2 col-sm-12 m-auto">
                        <div class="form-floating mt-3 px-lg-2 py-lg-2">
                            <button class="btn btn-primary btn-block" type="submit">
                                Tìm kiếm
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%--Danh sách chuyến du lịch--%>
    <div class="px-4 px-lg-5">
        <h3 class="mb-3">${categoryName}</h3>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <jsp:useBean id="toursByKeyword" scope="request" type="java.util.List"/>
            <c:forEach var="tour" items="${toursByCategoryId}">
                <div class="col mb-5">
                    <div class="card w-100 h-100">
                        <img class="card-img-top" src="${tour.image}" alt="${tour.name}">
                        <div class="card-body">
                            <h5 class="card-title">${tour.name}</h5>
                            <p class="card-text">${tour.description}</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">${tour.trip}</li>
                            <li class="list-group-item">${tour.duration}</li>
                            <li class="list-group-item text-danger">
                                <i class="fa-solid fa-wallet"></i>
                                <fmt:formatNumber value="${tour.price}" type="number" pattern="###,###,###"/> VNĐ
                            </li>
                        </ul>
                        <div class="card-body">
                            <a href="<c:url value="/tour/${tour.id}"/>"
                               class="btn btn-outline-primary justify-content-center">Chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>