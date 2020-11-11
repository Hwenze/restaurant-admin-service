// app/service/User.js
const Service = require('egg').Service;
class UserService extends Service {
  async queryInfoByUserId(uid) {
    const { ctx, app } = this;
    // 假如 我们拿到用户 id 从数据库获取用户详细信息
    const res = await app.mysql.get('admin_userinfo', { id: uid });
    ctx.session.userinfo = res;
    return res;

  }
}

module.exports = UserService;
