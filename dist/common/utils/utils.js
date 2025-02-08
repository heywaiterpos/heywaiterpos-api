"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.generateOTP = exports.getBill = exports.daysDiff = exports.weeksDiff = exports.monthDiff = exports.generateIndentityCode = exports.columnDefToTypeORMCondition = exports.getFullName = exports.convertColumnNotationToObject = exports.round = exports.addHours = exports.getAge = exports.compare = exports.hash = exports.runDbMigrations = exports.getDbConnection = exports.getDbConnectionOptions = exports.toPromise = void 0;
exports.getEnvPath = getEnvPath;
exports.ToBoolean = ToBoolean;
exports.formatId = formatId;
const typeorm_1 = require("typeorm");
const bcrypt = require("bcrypt");
const fs = require("fs");
const path = require("path");
const class_transformer_1 = require("class-transformer");
const dayjs_1 = require("dayjs");
const crypto_1 = require("crypto");
const toPromise = (data) => {
    return new Promise((resolve) => {
        resolve(data);
    });
};
exports.toPromise = toPromise;
const getDbConnectionOptions = async (connectionName = "default") => {
    const options = await (0, typeorm_1.getConnectionOptions)(process.env.NODE_ENV || "development");
    return {
        ...options,
        name: connectionName,
    };
};
exports.getDbConnectionOptions = getDbConnectionOptions;
const getDbConnection = async (connectionName = "default") => {
    return await (0, typeorm_1.getConnection)(connectionName);
};
exports.getDbConnection = getDbConnection;
const runDbMigrations = async (connectionName = "default") => {
    const conn = await (0, exports.getDbConnection)(connectionName);
    await conn.runMigrations();
};
exports.runDbMigrations = runDbMigrations;
const hash = async (value) => {
    return await bcrypt.hash(value, 10);
};
exports.hash = hash;
const compare = async (newValue, hashedValue) => {
    return await bcrypt.compare(hashedValue, newValue);
};
exports.compare = compare;
const getAge = async (birthDate) => {
    const timeDiff = Math.abs(Date.now() - birthDate.getTime());
    return Math.floor(timeDiff / (1000 * 3600 * 24) / 365.25);
};
exports.getAge = getAge;
const addHours = (numOfHours, date) => {
    date.setTime(date.getTime() + numOfHours * 60 * 60 * 1000);
    return date;
};
exports.addHours = addHours;
const round = (number) => {
    return Math.round((number + Number.EPSILON) * 100);
};
exports.round = round;
function getEnvPath(dest) {
    const env = process.env["NODE" + "_ENV"];
    const fallback = path.resolve(`${dest}/.env`);
    const filename = env ? `${env}.env` : "development.env";
    let filePath = path.resolve(`${dest}/${filename}`);
    if (!fs.existsSync(filePath)) {
        filePath = fallback;
    }
    return filePath;
}
function ToBoolean() {
    return (0, class_transformer_1.Transform)((value) => value.obj[value.key]);
}
function formatId(value, args) {
    let s = value + "";
    while (s.length < args) {
        s = "0" + s;
    }
    return s;
}
const convertColumnNotationToObject = (notation, nestedValue) => {
    const object = {};
    let pointer = object;
    notation.split(".").map((key, index, arr) => {
        pointer = pointer[key] = index == arr.length - 1 ? nestedValue : {};
    });
    return object;
};
exports.convertColumnNotationToObject = convertColumnNotationToObject;
const getFullName = (firstName, middleName = "", lastName) => {
    if (middleName && middleName !== "") {
        return `${firstName} ${middleName} ${lastName}`;
    }
    else {
        return `${firstName} ${lastName}`;
    }
};
exports.getFullName = getFullName;
const columnDefToTypeORMCondition = (columnDef) => {
    const conditionMapping = [];
    for (var col of columnDef) {
        if (col.type === "date") {
            if ((0, dayjs_1.default)(new Date(col.filter), "MMM DD, YYYY", true).isValid() ||
                (0, dayjs_1.default)(new Date(col.filter), "MMMM DD, YYYY", true).isValid() ||
                (0, dayjs_1.default)(new Date(col.filter), "YYYY-MM-DD", true).isValid()) {
                conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, dayjs_1.default)(new Date(col.filter), "YYYY-MM-DD")));
            }
        }
        else if (col.type === "date-less-than") {
            if ((0, dayjs_1.default)(new Date(col.filter), "MMM DD, YYYY", true).isValid() ||
                (0, dayjs_1.default)(new Date(col.filter), "MMMM DD, YYYY", true).isValid() ||
                (0, dayjs_1.default)(new Date(col.filter), "YYYY-MM-DD", true).isValid()) {
                conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.LessThan)((0, dayjs_1.default)(new Date(col.filter)).format("YYYY-MM-DD hh:mm:ss"))));
            }
        }
        else if (col.type === "date-range") {
            const range = col.filter && col.filter.split(",").length > 0
                ? col.filter.split(",").filter((x) => x)
                : [];
            range[1] = range.length === 1 ? range[0] : range[1];
            if ((0, dayjs_1.default)(new Date(range[0]), "YYYY-MM-DD", true).isValid() &&
                (0, dayjs_1.default)(new Date(range[1]), "YYYY-MM-DD", true).isValid()) {
                conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.Between)(range[0], range[1])));
            }
        }
        else if (col.type === "option-yes-no") {
            if (col.filter &&
                col.filter !== "" &&
                ["yes", "no"].some((x) => x.toString().toLowerCase() ===
                    col.filter.toString().toLowerCase().trim())) {
                const value = col.filter.toString().toLowerCase().trim() === "yes";
                conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, value));
            }
        }
        else if (col.type === "number-range") {
            const range = col.filter.split("-").map((x) => x?.trim());
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.Between)(Number(range[0]), Number(range[1]))));
        }
        else if (col.type === "number") {
            const value = !isNaN(Number(col.filter)) ? Number(col.filter) : 0;
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, value));
        }
        else if (col.type === "precise") {
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, col.filter));
        }
        else if (col.type === "not" || col.type === "except") {
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.ArrayOverlap)(col.filter)));
        }
        else if (col.type === "in" || col.type === "includes") {
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.In)(col.filter)));
        }
        else if (col.type === "null") {
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.IsNull)()));
        }
        else {
            conditionMapping.push((0, exports.convertColumnNotationToObject)(col.apiNotation, (0, typeorm_1.ILike)(`%${col.filter}%`)));
        }
    }
    const newArr = [];
    for (const item of conditionMapping) {
        const name = Object.keys(item)[0];
        if (newArr.some((x) => x[name])) {
            const index = newArr.findIndex((x) => x[name]);
            const res = Object.keys(newArr[index]).map((key) => newArr[index][key]);
            res.push(item[name]);
            newArr[index] = {
                [name]: Object.assign({}, ...res),
            };
            res.push(newArr[index]);
        }
        else {
            newArr.push(item);
        }
    }
    return Object.assign({}, ...newArr);
};
exports.columnDefToTypeORMCondition = columnDefToTypeORMCondition;
const generateIndentityCode = (id) => {
    return String(id).padStart(6, "0");
};
exports.generateIndentityCode = generateIndentityCode;
const monthDiff = (d1, d2) => {
    let months;
    months = (d2.getFullYear() - d1.getFullYear()) * 12;
    months -= d1.getMonth();
    months += d2.getMonth();
    return months <= 0 ? 0 : months;
};
exports.monthDiff = monthDiff;
const weeksDiff = (d1, d2) => Math.round((d2 - d1) / (7 * 24 * 60 * 60 * 1000));
exports.weeksDiff = weeksDiff;
const daysDiff = (d1, d2) => {
    const dueDateTime = new Date(d1).getTime();
    const currentDateTime = new Date(d2).getTime();
    const overdueMilliseconds = Math.max(0, currentDateTime - dueDateTime);
    const overdueDays = Math.ceil(overdueMilliseconds / (1000 * 60 * 60 * 24));
    return overdueDays;
};
exports.daysDiff = daysDiff;
const calculateOverdueCharge = (dueAmount, overdueDays) => {
    const overdueChargeRate = 0.02;
    const overdueCharge = dueAmount * overdueChargeRate * overdueDays;
    return overdueCharge;
};
const getBill = (dueAmount, dueDate) => {
    const overdueMonths = (0, exports.monthDiff)(dueDate, new Date(new Date().setDate(new Date().getDate() + 1)));
    const overdueWeeks = (0, exports.weeksDiff)(dueDate, new Date(new Date().setDate(new Date().getDate() + 1)));
    const overdueDays = (0, exports.daysDiff)(dueDate, new Date(new Date().setDate(new Date().getDate() + 1)));
    const overdueCharge = calculateOverdueCharge(Number(dueAmount), overdueDays > 1 ? overdueDays - 1 : 0);
    const totalDueAmount = Number(dueAmount) + overdueCharge;
    return {
        dueAmount: Number(dueAmount).toFixed(2),
        overdueDays: overdueDays > 0 ? overdueDays - 1 : 0,
        overdueWeeks,
        overdueMonths,
        overdueCharge: Number(overdueCharge).toFixed(2),
        totalDueAmount: Number(totalDueAmount).toFixed(2),
    };
};
exports.getBill = getBill;
const generateOTP = () => {
    let otp;
    const uniqueOTPs = new Set();
    do {
        otp = (0, crypto_1.randomInt)(100000, 1000000).toString();
    } while (uniqueOTPs.has(otp));
    uniqueOTPs.add(otp);
    if (uniqueOTPs.size > 1000) {
        uniqueOTPs.clear();
    }
    return otp;
};
exports.generateOTP = generateOTP;
//# sourceMappingURL=utils.js.map