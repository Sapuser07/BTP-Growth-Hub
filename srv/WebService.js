module.exports = cds.service.impl(async function () {

    const { Expense } = this.entities;


    this.on('penalty', async (req, res) => {
        try {
            //start a transaction using cds ql - https://cap.cloud.sap/docs/node.js/cds-tx
            const tx = await cds.tx(req);
            let test = await tx.update(Expense).with({
                GROSS_AMOUNT: { '+=': 100 }
            }).where(ID);
            let reply = await tx.read(Expense).where(ID);
            return reply;

        } catch (error) {
            return 'Run time exception';
        }
    });
})

