'use strict';
import dotenv from 'dotenv';
dotenv.config();

import { consoleBar, resSend, timeLog } from '../config/common.js';
import { pool } from './connect.js';

// ------------[get]all-users---------------
const getAllUsers = async (req, res) => {
    const query = 'SELECT * FROM user';
    // response data 담는 부분
    const results = {};
    results.result = true;
    results.error = [];
    results.users = [];

    try {
        const connection = await pool.getConnection(async conn => conn);
        try {
            const [rows, fields] = await connection.query(query);
            console.log(rows);
        } catch (err) {
            results.result = false;
            results.error.push('Query Error');
        }
    }
    catch (err) {
        results.result = false;
        results.error.push('DB Error');
    }

    res.send(results);
    consoleBar();
    timeLog('Get all-users called // ' + JSON.stringify(req.query) + ' // ' + JSON.stringify(results));
    // 결과물을 확인하기 위한 부분
};

export { getAllUsers };
