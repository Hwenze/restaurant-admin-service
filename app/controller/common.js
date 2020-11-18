'use strict';

const Controller = require('egg').Controller;
const { cb } = require('../utils/index');

class CommonController extends Controller {

    // 查询用户协议
    async queryuserAgreement() {
        const { ctx } = this;
        const result = await ctx.service.common.queryuserAgreement(1);
        if (result) {
            ctx.body = cb({ data: result });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

    // 更改用户协议
    async updateuserAgreement() {
        const { ctx } = this;
        const { agreement = '' } = ctx.request.body;
        const result = await ctx.service.common.updateuserAgreement(agreement);
        if (result) {
            ctx.body = cb({ data: '保存成功！' });
            return;
        } else {
            ctx.body = cb({ code: 500 });
            return;
        }
    }

}

module.exports = CommonController;