using {com.molinje as entities} from '../db/schema';

service molinje {
    entity Sales as projection on entities.Sales;
    entity SaleItems as projection on entities.SaleItems;

    entity VH_Status as projection on entities.Status;
    entity Vh_Measurements as projection on entities.Measurements;
    //entity VH_Countries as projection on entities.Countries;
    //entity VH_Currencies as projection on entities.Currencies;

};