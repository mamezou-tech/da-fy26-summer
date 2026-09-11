<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理者サービスメニュー画面</title>
</head>
<body>

    <header>
        <h2>共通ヘッダー</h2>
    </header>

    <p>メニューを選択してください。</p>

    <a href="${pageContext.request.contextPath}/facility/register">施設登録</a>
    <a href="${pageContext.request.contextPath}/user/register">ユーザー登録</a>
    <br>

    <form method="post" action="${pageContext.request.contextPath}/logout">
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
    	<button type="submit">ログアウト</button>
	</form>

</body>
</html>