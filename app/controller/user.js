'use strict';

const Controller = require('egg').Controller;
const { cb } = require('../utils/index');

class UserController extends Controller {
  async queryUserListByAdminId() {
    const { ctx } = this;
    const { userinfo = {} } = ctx.session;
    
    const { pageSize = 10, current = 1 } = ctx.query;
    const result = await ctx.service.user.queryUserListByAdminId({pageSize,current});
    if(result){
      ctx.body = cb({ data:result });
      return;
    }else{
      ctx.body = cb({ code:500 });
      return;
    }
  }
}

module.exports = UserController;
