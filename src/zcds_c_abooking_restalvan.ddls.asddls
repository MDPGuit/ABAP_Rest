@EndUserText.label: 'Consumption Booking Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZCDS_C_ABOOKING_RESTALVAN
  as projection on ZCDS_I_BOOKING_RESTALVAN
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      @ObjectModel.text.element: [ 'CarrierName' ]
      CarrierId,
      _Carrier.Name as CarrierName,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      BookingStatus,
      LastChangeAt,

      /* Associations */
      _Travel : redirected to parent ZCDS_C_ATRAVEL_RESTALVAN,
      _Customer,
      _Carrier


}
