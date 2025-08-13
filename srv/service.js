const cds = require('@sap/cds');
//require('dotenv').config();
module.exports = class LogaliGroup extends cds.ApplicationService {
    async init() {

        const { Sales, SaleItems } = this.entities;

        this.before('NEW', Sales.drafts, async (req) => {

            let result = await SELECT.one.from(Sales).columns('max(cod_saleid) as max');

            console.log('Numero max de tabla persistente', result);
            let result2 = await SELECT.one.from(Sales.drafts).columns('max(cod_saleid) as max');
            console.log('Numero max de Draft', result2);
            // max es el valor de la tabla persistente, es un string, lo convertimos a entero
            let max = parseInt(result.max);
            // max2 es el valor de la tabla borradore, max2 es un string, lo convertimos a entero
            let max2 = parseInt(result2.max);
            let newMax = 0;

              // Si max2 es NaN, significa que no hay registros en la tabla borrador, por lo que asignamos max + 1
            if (isNaN(max2)) {
                newMax = max + 1;
            } else if (max < max2) {
                // Si max es menor que max2, significa que hay registros en la tabla borrador, por lo que asignamos max2 + 1
                newMax = max2 + 1;
            } else {
                // Si max es mayor o igual que max2, significa que el Maximo valor ya esta en la tabla de persistencia,
                // por lo que asignamos max + 1
                newMax = max + 1;
            }
             console.log('Numero max de Draft', newMax.toString());
             console.log('fecha de creacion', new Date());
             req.data.createon = new Date();

             req.data.cod_saleid = newMax.toString();
             // You can add custom logic here before creating a new draft       



            


            // Set default values for new sales records
            //req.data.status = 'Open'; // Default status
            //req.data.deliverydate = new Date(); // Default to current date
        });



        return super.init();
    }
}