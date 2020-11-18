'use strict';

const Controller = require('egg').Controller;
const md5 = require('md5');
const { cb, TREE, filterQuery } = require('../utils/index');

class OperateController extends Controller {
  async queryUserListByAdminId() {
    const { ctx } = this;
    const isPass = {
      number: ['status', 'role'],
      string: ['username', 'nickname']
    };
    let params = filterQuery(ctx.query, isPass);
    const result = await ctx.service.operate.queryUserListByAdminId(params);
    if (result) {
      ctx.body = cb({ data: result });
      return;
    } else {
      ctx.body = cb({ code: 500 });
      return;
    }
  }

  // 返回权限列表 限制店铺id
  async queryRoleListByAdminId() {
    const { ctx } = this;
    const result = await ctx.service.operate.queryRoleListByAdminId();
    if (result) {
      ctx.body = cb({
        data: {
          list: result
        }
      });
      return;
    } else {
      ctx.body = cb({ code: 500 });
      return;
    }
  }

  // 添加员工
  async insertUserByAminId() {
    const { ctx } = this;
    const isPass = {
      number: ['role'],
      string: ['username', 'password', 'nickname']
    }
    const query = filterQuery(ctx.request.body, isPass);
    const { username, nickname, password = 123456, role = 999 } = query.column;
    if (!username) {
      ctx.body = cb({
        code: 1000,
        msg: '参数[username]不能为空',
      });
      return;
    }
    if (!nickname) {
      ctx.body = cb({
        code: 1000,
        msg: '参数[nickname]不能为空',
      });
      return;
    }
    const userInfo = await ctx.service.user.queryInfoByUserName(username);
    if (userInfo) {
      ctx.body = cb({
        code: 500,
        msg: `用户名[${username}]已经存在`,
      });
      return;
    } else {
      let result = {
        username: username,
        nickname: nickname,
        role: role,
        password: md5(password),
      }
      const insertReuslt = await ctx.service.user.insertUserByAminId(result);
      if (insertReuslt && insertReuslt.affectedRows === 1) {
        ctx.body = cb({ msg: '创建成功' });
      } else {
        ctx.body = cb({ code: 500, msg: '创建失败' });
      }
    }
  }

  // 删除权限
  // todo 会更新绑定在权限下面的用户
  async deleteRoleById() {
    const { ctx } = this;
    // 要查一下被删除的权限是否属于admin_id下面的
    const { id = null } = ctx.query;
    if (!id) {
      ctx.body = cb({ code: 1000, msg: '参数[id]不能空' });
      return;
    }
    const { admin_id = '' } = await ctx.service.common.getUserInfo();
    const roleInfo = await ctx.service.operate.queryRoleInfoByRoleId(id);
    if (roleInfo && roleInfo.admin_id === admin_id) {
      const result = await ctx.service.operate.deleteRoleById();
      if (result) {
        ctx.body = cb({ data: result });
        return;
      } else {
        ctx.body = cb({ code: 500 });
        return;
      }
    } else {
      ctx.body = cb({ code: 500, msg: '无权删除或者不存在该权限' });
      return;
    }
  }
}

module.exports = OperateController;
