<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-sm-6">
            <h2 class="text-center">로그인</h2>
            <form>
                <div class="form-group">
                    <label for="idInput">아이디</label>
                    <input type="text" class="form-control" id="idInput" placeholder="아이디를 입력하세요">
                </div>
                <div class="form-group">
                    <label for="passwordInput">비밀번호</label>
                    <input type="password" class="form-control" id="passwordInput" placeholder="비밀번호를 입력하세요">
                </div>
                <button type="submit" class="btn btn-primary">로그인</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
