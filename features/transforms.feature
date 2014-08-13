Feature: Transforms

  If you see certain phrases repeated over and over in your step definitions, you can
  use transforms to factor out that duplication, and make your step definitions simpler.

  Background:
    Let's just create a simple feature for testing out Transforms.
    We also have a Person class that we need to be able to build.

    Given a file named "features/foo.feature" with:
      """
      Feature:
        Scenario:
          Given a person aged 15
      """

  Scenario: Basic Transform
    This is the most basic way to use a transform. Notice that the regular
    expression is pretty much duplicated.

    And a file named "features/step_definitions/steps.js" with:
      """
      var transformSteps = function transformSteps() {
        this.Transform(/(\d+)/, function(age) {
          return parseInt(age);
        });

        this.Given(/^a person aged (\d+)$/, function(age, callback) {
          if (typeof age === 'number') {
            callback();
          } else {
            callback.fail();
          }
        });
      };

      module.exports = transformSteps;
      """
    When I run `cucumber.js features/foo.feature`
    Then it should pass with:
      """
      .

      1 scenario (1 passed)
      1 step (1 passed)

      """
