CREATE VIEW vIntraDayPricesReporting
AS

SELECT 
    FactAttributes_Intraday.FactID, FactAttributes_Intraday.[DateTime], FactAttributes_Intraday.LastBid, FactAttributes_Intraday.High, FactAttributes_Intraday.Low, FactAttributes_Intraday.[Open], FactAttributes_Intraday.Volume, FactAttributes_Intraday.MarketCap, FactAttributes_Intraday.Beta,
    dimSecurity.Company, dimSecurity.Symbol,
    dimExchange.Symbol AS 'Exchange'
FROM dimExchange
    JOIN dimSecurity ON dimExchange.ID = dimSecurity.ExchangeID
        JOIN FactAttributes_Intraday ON dimSecurity.ID = FactAttributes_Intraday.SecurityID;

GO