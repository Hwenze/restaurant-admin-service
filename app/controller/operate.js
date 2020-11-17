'use strict';

const Controller = require('egg').Controller;
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
