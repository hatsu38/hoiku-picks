# Hoiku-Picks
![DEMO](https://raw.githubusercontent.com/wiki/toywonder/hoiku-picks/images/hoiku-picks_sample.gif)
## Description
保育Picksは、保育士版のNewsPicksです。  
保育や子どもにまつわるニュースを自動で定期的に取得しているため、  
当サイト1つで
- 最近話題の保育のニュースの確認
- 保育のニュースに関する有識者のコメント

を同時に見ることが出来ます。
保育や子どもに感心ある方は、ぜひご利用ください！


## Deploy
### 注意点
- [ ] config/deploy.rb にブランチ名を書いたか
- [ ] デプロイ先はちゃんと変えたか
- [ ] サーバー上でnginxは起動しているか
- [ ] サーバー上でunicornは起動しているか
- [ ] サーバー上でmysqlは起動しているか

### 手順
1. developから **release/[1-9].[0-9].[0-9]** ブランチを作成

2. リリースするブランチを **config/deploy.rb** 10行目に記述(developから切ったブランチ)
    ```
    set :branch, 'release/1.0.0' #ここにリリースするブランチ名を書く
    ```

3. デプロイを実行  
    [capistranoでデプロイ]
    ```
    bundle exec cap production deploy
    ```
    [もしCSSが反映されていない場合]  
    3-1. AWSサーバーに入り  
    3-2. ユニコーンのPIDを確認  
    ```
    ps -ef | grep unicorn | grep -v grep
    ```
    3-3. PIDをKillする
    ```
    kill -9 PID
    ```
    3-4. PIDファイルを削除する
    ```
    rm current/tmp/pids/unicorn.rb
    ```
    3-5. assetsファイルを削除する
    ```
    rm -rf shared/public/assets/
    ```
    3-6. assetsディレクトリを作成する
    ```
    mkdir shared/publick/assets/
    ```
    3-7. デプロイ
    ```
    bundle exec cap production deploy
    ```  


4. http://3.113.115.189 でデプロイが正常に出来ているか確認
