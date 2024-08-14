@EndUserText.label: 'Interface Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZRAP_CDS_C_BOOKING
  as projection on ZRAP_CDS_I_BOOKING
{
  key travel_id,
  key booking_id,
      booking_date,
      @ObjectModel.text.element: [ 'CarrierName' ]
      customer_id,
      _Carrier.Name as CarrierName,
      carrier_id,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      @Semantics.currencyCode: true
      currency_code,
      booking_status,
      last_change_at,

      /* Associations */
      _Travel            : redirected to parent ZRAP_CDS_C_TRAVEL,
      _BookingSupplement : redirected to composition child ZRAP_CDS_C_BOOKSUP,
      _Carrier,
      _Connection,
      _Customer

}
