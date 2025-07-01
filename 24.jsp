<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Вычисление суммы</title>
</head>
<body>
<h2>Вычисление суммы</h2>

<%
    String message = "";
    String resultStr = "";
    boolean error = false;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String xStr = request.getParameter("x");
        String nStr = request.getParameter("n");
        double x = 0;
        int n = 0;

        try {
            x = Double.parseDouble(xStr);
            n = Integer.parseInt(nStr);

            if (Math.abs(x) >= 1) {
                message = "Условие |x| > 1 не выполнено. Пожалуйста, введите корректное значение.";
                error = true;
            } else {
                // Вычисление суммы
                double sum = 0.0;
                for (int i = 0; i < n; i++) {
                    double temp = (1.0 / (2 * i + 1)) * Math.pow(x, 2 * i + 1);
                    sum += temp;
                }
                double result = 2 * sum;
                resultStr = "Результат: " + result;
            }
        } catch (NumberFormatException e) {
            message = "Пожалуйста, введите корректные числовые значения.";
            error = true;
        }
    }
%>

<form method="post" action="">
    <label for="x">Введите верхний предел (|x| < 1): </label>
    <input type="text" id="x" name="x" required>

    <label for="n">Введите значение n: </label>
    <input type="number" id="n" name="n" required>

    <input type="submit" value="Вычислить">
</form>

<% if (!message.isEmpty()) { %>
    <p style="color:red;"><%= message %></p>
<% } %>

<% if (!resultStr.isEmpty()) { %>
    <p style="color:green;"><%= resultStr %></p>
<% } %>

</body>
</html>
