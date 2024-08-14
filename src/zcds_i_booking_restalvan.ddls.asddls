@AbapCatalog.sqlViewName: 'ZV_BOOK'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Booking'
define view ZCDS_I_BOOKING_RESTALVAN
  as select from zbook_restalvan as Booking  
  association to parent ZCDS_I_TRAVEL_RESTALVAN as _Travel on $projection.TravelId = _Travel.TravelId
  composition [0..*] of ZCDS_I_BOOKSUP_RESTALVAN as _BookingSupplement    
  association [1..1] to /DMO/I_Customer as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier as _Carrier on $projection.CarrierId = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection as _Connection on Booking.connection_id = _Connection.ConnectionID  
{

  key travel_id      as TravelId,
  key booking_id     as BookingId,
      booking_date   as BookingDate,
      customer_id    as CustomerId,
      carrier_id     as CarrierId,
      connection_id  as ConnectionId,
      flight_date    as FlightDate,
      flight_price   as FlightPrice,
      currency_code  as CurrencyCode,
      booking_status as BookingStatus,
      last_change_at as LastChangeAt,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
