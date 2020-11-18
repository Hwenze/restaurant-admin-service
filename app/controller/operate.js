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
    const isPass = {
      string: ['name'],
      number: ['status']
    }
    const query = filterQuery(ctx.query, isPass);
    const result = await ctx.service.operate.queryRoleListByAdminId(query.column);
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

  // 启用禁用状态
  async changeRoleStatus() {
    const { ctx } = this;
    const { id } = ctx.request.body;
    // 查询操作者信息
    const { admin_id = '', role = '' } = await ctx.service.common.getUserInfo();
    if (role == id) {
      ctx.body = cb({ code: 500, msg: '无法当前权限' });
      return;
    }
    // 查询被操作的用户信息
    const targetRole = await ctx.service.operate.queryRoleInfoByRoleId(id);
    if (targetRole) {
      // 非店铺信息
      if (targetRole.admin_id !== admin_id) {
        ctx.body = cb({ code: 500, msg: '无权操作' });
        return;
      } else {
        const result = await ctx.service.operate.changeRoleStatus(targetRole.id, targetRole.status === 1 ? 0 : 1);
        ctx.body = cb(result ? { msg: '操作成功' } : { code: 500, msg: '操作失败' });
      }
    } else {
      ctx.body = cb({ code: 500, msg: '用户不存在' });
    }
  }
  // 根据权限id查询权限详情
  async queryRoleInfoById() {
    const { ctx } = this;
    let { id } = ctx.query;
    if (!id) {
      ctx.body = cb({ code: 1000, msg: '参数[id]不能为空' });
      return;
    }
    //1 查询权限基础信息
    id = parseInt(id);
    const { admin_id = '' } = await ctx.service.common.getUserInfo();
    let roleInfo = await ctx.service.operate.queryRoleInfoByRoleId(id);
    if (roleInfo) {
      // 非店铺信息
      if (roleInfo.admin_id !== admin_id) {
        ctx.body = cb({ code: 500, msg: '无权操作' });
        return;
      } else {
        //2 根据router_id查询菜单id
        let ids = [];
        try {
          ids = roleInfo.router_ids.split(',');
        } catch (error) {
        }
        let menuList = await ctx.service.operate.queryMenuByRouteIds(ids);
        // console.log('menuList',menuList);
        roleInfo.routerList = TREE(menuList);
        roleInfo.router_ids = ids.map(item=>parseInt(item));
        //3 根据菜单id查询资源
        ctx.body = cb({ data: roleInfo });
      }
    } else {
      ctx.body = cb({ code: 500, msg: '用户不存在' });
    }


  }
}

module.exports = OperateController;
