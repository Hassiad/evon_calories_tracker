module.exports = {
  cardAutoCharge: {
    frequency: "12 11 * * *",
    handler: "handlers/oneAMAutoChargeCard",
  },
  recurringCheck: {
    frequency: "33 18 * * *",
    handler: "handlers/recurringCheck",
  },
  tacos: {
    frequency: "* * * * *",
    handler: "handlers/tacos",
  },
};
