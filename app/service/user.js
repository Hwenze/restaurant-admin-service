// app/service/User.js
const Service = require('egg').Service;

class UserService extends Service {

  // 查询用户信息
  async queryInfoByUserName(username) {
    const { ctx, app } = this;
    // 假如 我们拿到用户 id 从数据库获取用户详细信息
    return await app.mysql.get('admin_userinfo', { username });
  }

  async queryInfoByUserId(id) {
    const { ctx, app } = this;
    // 假如 我们拿到用户 id 从数据库获取用户详细信息
    return await app.mysql.get('admin_userinfo', { id });
  }

  // 查询用户路由菜单
  async queryMenuByRoleId(roleId) {
    const { ctx, app } = this;
    let roleInfo = await this.queryRoleInfoById(roleId);
    let menuInfo;
    if (roleInfo) {
      if (roleInfo.status !== 1) {
        // 999 是游客
        roleInfo = await this.queryRoleInfoById(999);
      }
      let ids = [];
      try {
        ids = roleInfo.router_ids.split(',');
      } catch (error) {
      }
      menuInfo = await app.mysql.select('admin_router', { // 搜索 post 表
        where: { status: 1, id: ids }, // WHERE 条件
        orders: [['id', 'desc']], // 排序方式
      });
    }
    return { roleInfo, menuInfo }
  }

  // 查询用户权限基础信息
  async queryRoleInfoById(roleId) {
    const { ctx, app } = this;
    return await app.mysql.get('admin_role', { id: roleId })
  }

  // 插入员工
  async insertUserByAminId(column) {
    const { ctx, app } = this;
    const { admin_id = '' } = await ctx.service.common.getUserInfo();
    return await app.mysql.insert('admin_userinfo', {
      admin_id, ...column
    })
  }

  // 冻结 or 解冻用户
  async changeUserStatus(id, status) {
    const { app } = this;
    // return await app.mysql.insert('admin_userinfo', { id })
    return await app.mysql.update('admin_userinfo', {
      status: status
    }, {
      where: { id }
    })
  }

  // 删除用户
  async deleteUserById(id, status) {
    const { app } = this;
    return await app.mysql.delete('admin_userinfo', { id })
  }




}

module.exports = UserService;
