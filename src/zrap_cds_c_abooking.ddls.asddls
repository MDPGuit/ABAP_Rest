@EndUserText.label: 'Consumption Booking Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZRAP_CDS_C_ABOOKING
  as projection on ZRAP_CDS_I_BOOKING
{
  key travel_id,
  key booking_id,
      booking_date,
      customer_id,
      @ObjectModel.text.element: [ 'CarrierName' ]
      carrier_id,
      _Carrier.Name as CarrierName,
      connection_id,
      flight_date,
      @Semantics.amount.currencyCode: 'currency_code'
      flight_price,
      @Semantics.currencyCode: true
      currency_code,
      booking_status,
      last_change_at,

      /* Associations */
      _Travel : redirected to parent ZRAP_CDS_C_ATRAVEL,
      _Customer,
      _Carrier


}
