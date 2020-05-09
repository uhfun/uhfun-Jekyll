# Environment Variables
# key                   value
# GH_PAGES_BRANCH       gh-pages
# CUSTOM_DOAMIN         uhfun.cn
# GH_USER_EMAIL         2512500628@qq.com
# GH_USER_NAME          uhfun   
# GH_PAGES_REPOSITORY   Uhfun-Jekyll

echo '下载github pages 静态资源' && git clone -b ${GH_PAGES_BRANCH} git@github.com:${GH_USER_NAME}/${GH_PAGES_REPOSITORY}.git _site
echo '删除除.git 外所有文件' && rm -rf _site/**/* || exit 0
echo '重新编译生成静态文件' && bundle install && bundle exec jekyll build
cd _site
echo '自定义域名' && echo ${CUSTOM_DOAMIN} > CNAME
git config --global user.email ${GH_USER_EMAIL}
git config --global user.name ${GH_USER_NAME}
git add .
git commit -m "Commit ${CI_COMMIT_ID} ${CI_COMMIT_MESSAGE} to branch ${GH_PAGES_BRANCH}" && git push origin ${GH_PAGES_BRANCH}

