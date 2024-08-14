@AbapCatalog.sqlViewName: 'ZRAPV_BOOK'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Booking'
define view ZRAP_CDS_I_BOOKING
  as select from zrap_book_alvan as Booking
  association        to parent ZRAP_CDS_I_TRAVEL as _Travel     on $projection.travel_id = _Travel.travel_id
  composition [0..*] of ZRAP_CDS_I_BOOKSUP       as _BookingSupplement
  association [1..1] to /DMO/I_Customer          as _Customer   on $projection.customer_id = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier           as _Carrier    on $projection.carrier_id = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection        as _Connection on Booking.connection_id = _Connection.ConnectionID
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      carrier_id,
      connection_id,
      flight_date,
      flight_price,
      currency_code,
      booking_status,
      last_change_at,
      
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
