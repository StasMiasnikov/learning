import { __decorate, __metadata } from "tslib";
import { EmployeeService } from "./../employee.service";
import { Component } from "@angular/core";
import { Router } from '@angular/router';
var EmployeeListComponent = /** @class */ (function () {
    function EmployeeListComponent(employeeService, router) {
        this.employeeService = employeeService;
        this.router = router;
    }
    EmployeeListComponent.prototype.ngOnInit = function () {
        this.reloadData();
    };
    EmployeeListComponent.prototype.reloadData = function () {
        this.employees = this.employeeService.getEmployeesList();
    };
    EmployeeListComponent.prototype.deleteEmployee = function (id) {
        var _this = this;
        this.employeeService.deleteEmployee(id)
            .subscribe(function (data) {
            console.log(data);
            _this.reloadData();
        }, function (error) { return console.log(error); });
    };
    EmployeeListComponent = __decorate([
        Component({
            selector: "app-employee-list",
            templateUrl: "./employee-list.component.html",
            styleUrls: ["./employee-list.component.css"]
        }),
        __metadata("design:paramtypes", [EmployeeService,
            Router])
    ], EmployeeListComponent);
    return EmployeeListComponent;
}());
export { EmployeeListComponent };
//# sourceMappingURL=employee-list.component.js.map