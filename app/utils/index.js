const { RETURN_CODE } = require('./enum');

// 接口统一回调
const cb = (option) => {
    const { code = 200, data = null, msg = RETURN_CODE[200] } = option;
    let result = {
        ...option,
        code,
        msg: msg || RETURN_CODE[code],
    };
    if (data) {
        result.data = data;
    }
    return result;
};



module.exports = {
    cb
};
