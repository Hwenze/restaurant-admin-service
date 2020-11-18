// app/service/User.js
const Service = require('egg').Service;

class CommonService extends Service {
  
  // 获取用户信息
  async getUserInfo(){
    const { ctx, app } = this;
    const token = ctx.request.header.authorization;
    let userinfo = {};
    try {
      userinfo = app.jwt.verify(token, app.config.jwt.secret); // 解析用户token
    } catch (error) {
        console.log('获取用户信息失败', error);
    }
    return await userinfo;
  }
}

module.exports = CommonService;
  