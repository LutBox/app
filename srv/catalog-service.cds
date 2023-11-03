using {app.db as db} from '../db/data-model';

using {CV_SALES, CV_SESSION_INFO} from '../db/data-model';












using { NearEarthObjectWebService } from './external/NearEarthObjectWebService.csn';



service CatalogService @(path : '/catalog')
{
    entity Sales
      as select * from db.Sales
      actions {
        action boost() returns Sales;
      }
    ;


    @readonly
    entity VSales
      as select * from CV_SALES
    ;

    @readonly
    entity SessionInfo
      as select * from CV_SESSION_INFO
    ;

    function topSales
      (amount: Integer)
      returns many Sales;












    @readonly
    entity Asteroids
      as projection on NearEarthObjectWebService.Feed;





};