'use strict';

const Controller = require('egg').Controller;
const { cb, TREE,filterQuery } = require('../utils/index');

class OperateController extends Controller {
  async queryUserListByAdminId() {
    const { ctx } = this;
    const isPass = {
      number:['status','role'],
      string:['username','nickname']
    };
    let params = filterQuery(ctx.query,isPass);
    const result = await ctx.service.operate.queryUserListByAdminId(params);
    if (result) {
      ctx.body = cb({ data: result });
      return;
    } else {
      ctx.body = cb({ code: 500 });
      return;
    }
  }
}

module.exports = OperateController;
