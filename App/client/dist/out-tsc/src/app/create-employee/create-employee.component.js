import { __decorate, __metadata } from "tslib";
import { EmployeeService } from './../employee.service';
import { Employee } from './../employee';
import { Component } from '@angular/core';
var CreateEmployeeComponent = /** @class */ (function () {
    function CreateEmployeeComponent(employeeService) {
        this.employeeService = employeeService;
        this.employee = new Employee();
        this.submitted = false;
    }
    CreateEmployeeComponent.prototype.ngOnInit = function () {
    };
    CreateEmployeeComponent.prototype.newEmployee = function () {
        this.submitted = false;
        this.employee = new Employee();
    };
    CreateEmployeeComponent.prototype.save = function () {
        this.employeeService.createEmployee(this.employee)
            .subscribe(function (data) { return console.log(data); }, function (error) { return console.log(error); });
        this.employee = new Employee();
    };
    CreateEmployeeComponent.prototype.onSubmit = function () {
        this.submitted = true;
        this.save();
    };
    CreateEmployeeComponent = __decorate([
        Component({
            selector: 'app-create-employee',
            templateUrl: './create-employee.component.html',
            styleUrls: ['./create-employee.component.css']
        }),
        __metadata("design:paramtypes", [EmployeeService])
    ], CreateEmployeeComponent);
    return CreateEmployeeComponent;
}());
export { CreateEmployeeComponent };
//# sourceMappingURL=create-employee.component.js.map