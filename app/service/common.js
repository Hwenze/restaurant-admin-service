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

  // 查询首页轮播
  async queryHomeRotation() {
    const { app } = this;
    return await app.mysql.select('home_rotation', {
      orders: [['sort', 'desc']], // 排序方式
    });
  }

  // 启用 or 禁用 首页轮播
  async changeRotationStatus(id) {
    const { app } = this;
    const adopt = await app.mysql.get('home_rotation', id);
    return await app.mysql.update('home_rotation',{ id: adopt.id, status: adopt.status === 1 ? 0 : 1 });
  }

}

module.exports = CommonService;
