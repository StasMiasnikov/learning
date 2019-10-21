import { __decorate, __metadata } from "tslib";
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
var EmployeeService = /** @class */ (function () {
    function EmployeeService(http) {
        this.http = http;
        this.baseUrl = '/api/v1/employees';
    }
    EmployeeService.prototype.getEmployee = function (id) {
        return this.http.get(this.baseUrl + "/" + id);
    };
    EmployeeService.prototype.createEmployee = function (employee) {
        return this.http.post("" + this.baseUrl, employee);
    };
    EmployeeService.prototype.updateEmployee = function (id, value) {
        return this.http.put(this.baseUrl + "/" + id, value);
    };
    EmployeeService.prototype.deleteEmployee = function (id) {
        return this.http.delete(this.baseUrl + "/" + id, { responseType: 'text' });
    };
    EmployeeService.prototype.getEmployeesList = function () {
        return this.http.get("" + this.baseUrl);
    };
    EmployeeService = __decorate([
        Injectable({
            providedIn: 'root'
        }),
        __metadata("design:paramtypes", [HttpClient])
    ], EmployeeService);
    return EmployeeService;
}());
export { EmployeeService };
//# sourceMappingURL=employee.service.js.map