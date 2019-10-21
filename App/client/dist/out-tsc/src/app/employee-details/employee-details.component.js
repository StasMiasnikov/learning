import { __decorate, __metadata } from "tslib";
import { Employee } from './../employee';
import { Component, Input } from '@angular/core';
import { EmployeeService } from '../employee.service';
import { EmployeeListComponent } from '../employee-list/employee-list.component';
var EmployeeDetailsComponent = /** @class */ (function () {
    function EmployeeDetailsComponent(employeeService, listComponent) {
        this.employeeService = employeeService;
        this.listComponent = listComponent;
    }
    EmployeeDetailsComponent.prototype.ngOnInit = function () {
    };
    __decorate([
        Input(),
        __metadata("design:type", Employee)
    ], EmployeeDetailsComponent.prototype, "employee", void 0);
    EmployeeDetailsComponent = __decorate([
        Component({
            selector: 'app-employee-details',
            templateUrl: './employee-details.component.html',
            styleUrls: ['./employee-details.component.css']
        }),
        __metadata("design:paramtypes", [EmployeeService, EmployeeListComponent])
    ], EmployeeDetailsComponent);
    return EmployeeDetailsComponent;
}());
export { EmployeeDetailsComponent };
//# sourceMappingURL=employee-details.component.js.map