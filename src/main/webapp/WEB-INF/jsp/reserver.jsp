<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>予約者サービスメニュー画面</title>
</head>
<body>

    <header>
        <h2>共通ヘッダー</h2>
    </header>

    <p>メニューを選択してください。</p>

    <a href="${pageContext.request.contextPath}/facility/register">予約照会</a>
    <a href="${pageContext.request.contextPath}/user/register">施設予約</a>

    <br>

    <form method="post" action="${pageContext.request.contextPath}/logout">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    	<button type="submit">ログアウト</button>
    </form>

</body>
</html>