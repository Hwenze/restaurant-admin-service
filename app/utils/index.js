const { RETURN_CODE } = require('./enum');
const fs = require('fs');
const { dirname } = require('path');

// 接口统一回调
const cb = (option) => {
    const { code = 200, data = null, msg = RETURN_CODE[200] } = option;
    let result = {
        ...option,
        code,
        type: code === 200 ? 'success' : 'error',
        msg: msg || RETURN_CODE[code],
    };
    if (data) {
        result.data = data;
    }
    return result;
};

// 递归获取树状
// 结构
/**
 * {
 *   id:1
 *   parent_id:0,
 *   children:[
 *     {
*        id:1
*        parent_id:0,
*        children:[]
 *     }
 *   ]
 * }
 */
const TREE = (arr, parent_id = 0) => {
    let temp = [];  // 输出模板
    let treeArr = arr;
    treeArr.forEach((item, index) => {
        item.parent_id *= 1;
        if (item.parent_id == parent_id) {
            if (TREE(treeArr, treeArr[index].id).length > 0) {
                // 递归调用此函数
                treeArr[index].children = TREE(treeArr, treeArr[index].id);
            }
            temp.push({
                ...treeArr[index],
                key: treeArr[index].id,
                title: treeArr[index].router_name
            });
        }
    });
    return temp;
};
// 遍历分类树
const CATEGORYTREE = (arr, pid = 0) => {
    let temp = [];  // 输出模板
    let treeArr = arr;
    treeArr.forEach((item, index) => {
        item.isHide = item.isHide * 1 == 1 ? true : false;
        item.parent_id *= 1;
        if (item.parent_id == pid) {
            if (CATEGORYTREE(treeArr, treeArr[index].id).length > 0) {
                // 递归调用此函数
                if (item) {
                    treeArr[index].children = CATEGORYTREE(treeArr, treeArr[index].id);
                }
            }
            temp.push({ ...treeArr[index] });
        }
    });
    return temp;
};
const ID = () => {
    return Math.random().toString(32).slice(2)
}
// 四舍五入
const Price = (num) => {
    return (Math.round(num * 100) / 100);
}

// 过滤掉无用的参数
const filterQuery = (target, params) => {
    let query = {
        page: {},
        column: {},
    };
    let { number = [], string = [], array = [] } = params;
    if (!number || !Array.isArray(number)) {
        number = [];
    }
    if (!string || !Array.isArray(string)) {
        string = [];
    }
    const page = ['current', 'pageSize'];
    for (let key in target) {
        if (target[key]) {
            if (number.indexOf(key) !== -1 && !query.hasOwnProperty(key)) {
                query.column[key] = Number(target[key]);
            }
            if (page.indexOf(key) !== -1) {
                query.page[key] = key === 'current' ? Number(target[key]) === 0 ? 0 : Number(target[key]) - 1 : Number(target[key]);
            }
            if (string.indexOf(key) !== -1 && !query.hasOwnProperty(key)) {
                query.column[key] = target[key];
            }
        }
    }
    return query;

    

}
const mkdir = (dirName)=>{
    if(!fs.existsSync(dirName)){
        fs.mkdirSync(dirName)
    }
}



module.exports = {
    cb,
    TREE,
    CATEGORYTREE,
    filterQuery,
    mkdir
};



