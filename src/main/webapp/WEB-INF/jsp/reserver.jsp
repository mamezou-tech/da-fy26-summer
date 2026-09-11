<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>メニュー</title>
</head>
<body>

    <%-- ① 共通ヘッダー --%>
    <header>
        <h2>共通ヘッダー</h2>
    </header>

    <%-- ② --%>
    <p>メニューを選択してください。</p>

    <%-- ③ --%>
    <a href="${pageContext.request.contextPath}/facility/register">
        予約照会
    </a>

    <%-- ④ --%>
    <a href="${pageContext.request.contextPath}/user/register">
        施設予約
    </a>

    <br><br>

    <%-- ⑤ --%>
    <a href="${pageContext.request.contextPath}/logout">
        ログアウト
    </a>

</body>
</html>