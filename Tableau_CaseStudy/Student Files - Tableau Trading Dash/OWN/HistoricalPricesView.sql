CREATE VIEW vHistoricalPricesReportingOWN 
AS

SELECT 
    FactPrices_Daily.FactID, FactPrices_Daily.[Date], FactPrices_Daily.[Open], FactPrices_Daily.High, FactPrices_Daily.Low, FactPrices_Daily.[Close], FactPrices_Daily.AdjClose, FactPrices_Daily.Volume,
    dimSecurity.Company, dimSecurity.Symbol, dimSecurity.Industry, dimSecurity.IndexWeighting,
    dimExchange.Symbol AS 'Exchange'
FROM dimExchange
    JOIN dimSecurity ON dimExchange.ID = dimSecurity.ExchangeID
        JOIN FactPrices_Daily ON dimSecurity.ID = FactPrices_Daily.SecurityID;

GO