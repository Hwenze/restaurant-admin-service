// app/service/User.js
const Service = require('egg').Service;
const { cb, TREE } = require('../utils/index');

class CommonService extends Service {

  // 获取用户信息
  async getUserInfo() {
    const { ctx, app } = this;
    const token = ctx.request.header.authorization;
    let userinfo = {};
    try {
      userinfo = await app.jwt.verify(token, app.config.jwt.secret); // 解析用户token
    } catch (error) {
      console.log('获取用户信息失败', error);
    }
    if (userinfo.id) {
      return await app.mysql.get('admin_userinfo', { id: userinfo.id, status: 1 });
    } else {
      ctx.body = cb({ code: 401 });
    }
  }

  // 查询用户协议
  async queryuserAgreement(id) {
    const { app } = this;
    return await app.mysql.get('user_agreement', { id });
  }

  // 更改用户协议
  async updateuserAgreement(agreement) {
    const { app } = this;
    return await app.mysql.update('user_agreement',{ id: 1, agreement });
  }
}

module.exports = CommonService;
