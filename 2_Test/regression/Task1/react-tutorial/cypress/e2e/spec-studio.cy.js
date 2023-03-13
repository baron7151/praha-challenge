describe("template spec", () => {
  it("Win X", () => {
    cy.visit("localhost:3000");
    /* ==== Generated with Cypress Studio ==== */
    cy.get('[data-e2e="0"]').click();
    cy.get('[data-e2e="1"]').click();
    cy.get('[data-e2e="2"]').click();
    cy.get('[data-e2e="3"]').click();
    cy.get('[data-e2e="4"]').click();
    cy.get('[data-e2e="5"]').click();
    cy.get('[data-e2e="6"]').click();
    /* ==== End Cypress Studio ==== */
  });

  /* ==== Test Created with Cypress Studio ==== */
  it("Win ○", function () {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit("localhost:3000");
    cy.get('[data-e2e="0"]').click();
    cy.get('[data-e2e="1"]').click();
    cy.get('[data-e2e="3"]').click();
    cy.get('[data-e2e="4"]').click();
    cy.get('[data-e2e="2"]').click();
    cy.get('[data-e2e="7"]').click();
    /* ==== End Cypress Studio ==== */
  });

  /* ==== Test Created with Cypress Studio ==== */
  it("Draw", function () {
    /* ==== Generated with Cypress Studio ==== */
    cy.visit("localhost:3000");
    cy.get('[data-e2e="0"]').click();
    cy.get('[data-e2e="1"]').click();
    cy.get('[data-e2e="2"]').click();
    cy.get('[data-e2e="4"]').click();
    cy.get('[data-e2e="3"]').click();
    cy.get('[data-e2e="6"]').click();
    cy.get('[data-e2e="5"]').click();
    cy.get('[data-e2e="8"]').click();
    cy.get('[data-e2e="7"]').click();
    /* ==== End Cypress Studio ==== */
  });
});
