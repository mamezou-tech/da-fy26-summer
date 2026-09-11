<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ログイン画面</title>
</head>
<body>

<h1>ログイン</h1>

        <form method="post" action="${pageContext.request.contextPath}/login">

        	<input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}">

            <div>
                <label for="username">ログイン名</label>
                <input type="text" id="username" name="username">
            </div>

            <div>
                <label for="password">パスワード</label>
                <input type="password" id="password" name="password">
            </div>

            <button type="submit">ログイン</button>

        </form>

</body>
</html>