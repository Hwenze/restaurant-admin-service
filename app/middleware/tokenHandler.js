'use strict';

module.exports = () => {
    return async function tokenHandler(ctx, next) {
        const { session = {}, request = {} } = ctx;
        const path = request.path;
        const { userinfo = {} } = session;
        if(path.indexOf('/login') === 0){
            await next();
        }else{
            console.log('userinfo----', userinfo);
            // 可能要控制不同场景
            try {
                if (userinfo && userinfo.id) {
                    await next();
                } else {
                    ctx.body = '无权访问';
                }
            } catch (error) {
                ctx.body = '服务器出错了';
            }
            
        }
        
    }
}