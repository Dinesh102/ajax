<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>
        <head>
            <title>Books Store Application</title>
            <script src="http://code.jquery.com/jquery-latest.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $("#insertbutton").click(function () {
                        $.get('insert', function (responseJson) {
                            alert(responseJson);
                            if (responseJson != null) {
                                $("#countrytable").find("tr:gt(0)").remove();
                                var table1 = $("#countrytable");
                                $.each(responseJson, function (key, value) {
                                    var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                    rowNew.children().eq(0).text(value['id']);
                                    rowNew.children().eq(1).text(value['title']);
                                    rowNew.children().eq(2).text(value['author']);
                                    rowNew.children().eq(3).text(value['price']);
                                    rowNew.children().eq(4).append('<a href="/update?code=' + value['id'] + '" >edit</a>');
                                    rowNew.children().eq(5).append('<a href="/delete?code=' + value['id'] + '" id="edit">delete</a>');
                                    rowNew.appendTo(table1);
                                });
                            }
                        });
                    });
                    $("#tablediv").show();

                    $.get('list', function (responseJson) {
                        if (responseJson != null) {
                            $("#countrytable").find("tr:gt(0)").remove();
                            var table1 = $("#countrytable");
                            $.each(responseJson, function (key, value) {
                                var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                                rowNew.children().eq(0).text(value['id']);
                                rowNew.children().eq(1).text(value['title']);
                                rowNew.children().eq(2).text(value['author']);
                                rowNew.children().eq(3).text(value['price']);
                                rowNew.children().eq(4).append('<a href="/update1?code=' + value['id'] + '" >edit</a>');
                                rowNew.children().eq(5).append('<a href="/delete?code=' + value['id'] + '" >delete</a>');
                                rowNew.appendTo(table1);
                            });
                        }
                    });                                         
                    $("#tablediv").show();
                    $("#updatebutton").click(function () {
                        var title=$("#title").val();
                        var author=$("#author").val();
                        var price=$("#price").val();
                        var id=$("#myid").val();                    
                        $.get('update2',{id:id,title:title,author:author,price:price},function(responseJson) {                           
                          
                        });

                    });
                    

                });

            </script>
        </head>

        <body>
            <center>
                <h1>Books Management</h1>
            </center>

            <div align="center">
                <c:if test="${book != null}">
                    <form action="#" >
                </c:if>
                <c:if test="${book == null}">
                    <form action="insert" method="post">
                </c:if>
                <table border="1" cellpadding="5">
                    <caption>
                        <h2>
                            <c:if test="${book != null}">
                                Edit Book
                            </c:if>
                            <c:if test="${book == null}">
                                Add New Book
                            </c:if>
                        </h2>
                    </caption>
                    <c:if test="${book != null}">
                        <input type="text" name="id" id="myid" value="<c:out value='${book.id}' />" />
                    </c:if>
                    <tr>
                        <th>Title: </th>
                        <td>
                            <input type="text" id= "title" name="title" size="45" value="<c:out value='${book.title}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Author: </th>
                        <td>
                            <input type="text" id= "author" name="author" size="45" value="<c:out value='${book.author}' />" />
                        </td>
                    </tr>
                    <tr>
                        <th>Price: </th>
                        <td>
                            <input type="text" id= "price" name="price" size="5" value="<c:out value='${book.price}' />" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Insert" id="insertbutton" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="button" value="Update" id="updatebutton" />
                        </td>
                    </tr>
                </table>
                </form>
            </div>

            <div id="tablediv">
                <table border="1" cellpadding="5" id="countrytable">

                    <tr>

                        <th scope="col">id</th>
                        <th scope="col">title</th>
                        <th scope="col">author</th>
                        <th scope="col">price</th>
                    </tr>
                </table>
            </div>
        </body>

        </html>