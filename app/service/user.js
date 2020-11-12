// app/service/User.js
const Service = require('egg').Service;
class UserService extends Service {

  // 查询用户信息
  async queryInfoByUserId(username) {
    const { ctx, app } = this;
    // 假如 我们拿到用户 id 从数据库获取用户详细信息
    return await app.mysql.get('admin_userinfo', { username });
  }

  
  
}

module.exports = UserService;
