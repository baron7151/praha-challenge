describe("React Tutorial Test", () => {
  it("Winner X", () => {
    cy.visit("http://localhost:3000");
    cy.get("[data-e2e=0]").click();
    cy.get("[data-e2e=1]").click();
    cy.get("[data-e2e=2]").click();
    cy.get("[data-e2e=3]").click();
    cy.get("[data-e2e=4]").click();
    cy.get("[data-e2e=5]").click();
    cy.get("[data-e2e=6]").click();
    cy.contains("Winner: X");
  });
});
describe("React Tutorial Test", () => {
  it("Winner O", () => {
    cy.visit("http://localhost:3000");
    cy.get("[data-e2e=0]").click();
    cy.get("[data-e2e=2]").click();
    cy.get("[data-e2e=1]").click();
    cy.get("[data-e2e=5]").click();
    cy.get("[data-e2e=4]").click();
    cy.get("[data-e2e=8]").click();
    cy.contains("Winner: O");
  });
});
describe("React Tutorial Test", () => {
  it("Draw!!", () => {
    cy.visit("http://localhost:3000");
    cy.get("[data-e2e=0]").click();
    cy.get("[data-e2e=1]").click();
    cy.get("[data-e2e=3]").click();
    cy.get("[data-e2e=4]").click();
    cy.get("[data-e2e=2]").click();
    cy.get("[data-e2e=6]").click();
    cy.get("[data-e2e=7]").click();
    cy.get("[data-e2e=8]").click();
    cy.get("[data-e2e=5]").click();
    cy.contains("Draw!");
  });
});
