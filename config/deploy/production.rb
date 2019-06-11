# AWS-本番環境
server '3.113.115.189', user: 'hajime', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/hoiku-picks_key_rsa'
