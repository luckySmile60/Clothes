// 引入数据库模块
const mysql = require('mysql')
// 创建连接池对象
var pool = mysql.createPool({
  host:'localhost',
  port:'3306',
  user:'root',
  password:'',
  database:'clothes',
  connectionLimit:20
})
// 导出连接池
module.exports = pool;