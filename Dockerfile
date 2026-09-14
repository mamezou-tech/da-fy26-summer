# FROM : 前の段の成果物を渡す

# 1行ごとがレイヤーとなり、Dockerfileを書き直すと、COPYのレイヤーが変わり、Mavenの行以下も全部やり直しになる
# .dockerignoreで解消する方法がある

# RUN : 一時的なコンテナが作られる
# --------------------------------------------------------------------------------------

# JDK25が入ったイメージを土台
FROM eclipse-temurin:25-jdk AS build

# 作業場所
# Dockerのルート以下にappフォルダが作られる
WORKDIR /app

# フォルダの中身を/app にコピー
COPY . .

# zip展開後にWindowsでmvnwコマンドを実行するためにchmod
# &&
# Mavenでwarを作る
RUN chmod +x mvnw && ./mvnw package -DskipTests

# 出来たwarファイルをapp.warに名前を直してENTRYPOINTを毎回書き直さなくてもいいようにする
RUN cp target/*.war app.war
# --------ここまでがビルド部分--------------------------------------------------------------------


FROM eclipse-temurin:25-jre
WORKDIR /app

# 上の段の/appからapp.warをこっちに持ってくる
COPY --from=build /app/app.war app.war
# 起動したら何をするか書く
ENTRYPOINT ["java", "-jar", "app.war"]