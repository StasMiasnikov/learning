import { AppPage } from './app.po';
describe('workspace-project App', function () {
    var page;
    beforeEach(function () {
        page = new AppPage();
    });
    it('should display welcome message', function () {
        page.navigateTo();
        expect(page.getTitleText()).toEqual('Welcome to angular6-springboot-client!');
    });
});
//# sourceMappingURL=app.e2e-spec.js.map