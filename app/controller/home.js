'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const { ctx, app } = this;
    const { uid = null } = ctx.query;
    const result = await ctx.service.user.queryInfoByUserId(uid);
    if (result) {
      ctx.body = result;
    } else {
      ctx.body = {
        code: '该用户不存在'
      }
    }
  }

  async login() {
    const { ctx, app } = this;
    const { uid = null } = ctx.query;
    const result = await ctx.service.user.queryInfoByUserId(1);
    if (result) {
      ctx.body = '你的信息已经存在session';
    } else {
      ctx.body = {
        code: '该用户不存在'
      }
    }
  }
}

module.exports = HomeController;
