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

  // 查询用户协议
  async queryuserAgreement(id) {
    const { ctx, app } = this;
    return await app.mysql.get('user_agreement', { id: id });
  }

  // 更改用户协议
  async updateuserAgreement(agreement) {
    const { ctx, app } = this;
    return await this.app.mysql.update('user_agreement',{ id: 1, agreement: agreement });
  }
}

module.exports = CommonService;