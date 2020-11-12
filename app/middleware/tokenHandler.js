'use strict';

const { cb } = require('../utils');
const { RETURN_CODE } = require('../utils/enum');

module.exports = (options, app) => {
    return async function (ctx, next) {
        const token = ctx.request.header.token;
        if (token) {
            try {
                ctx.app.jwt.verify(token, app.config.jwt.secret); // 验证token 
                await next();
            } catch (error) {
                ctx.status = 401;
                ctx.body = cb({ code: 401, msg: RETURN_CODE['401'] });
                return;
            }
        } else {
            ctx.status = 400;
            ctx.body = cb({ code: 400, msg: RETURN_CODE['400'] });
            return;
        }
    }
}
