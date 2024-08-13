@EndUserText.label: 'Consumption Booking'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZCDS_C_BOOKING_RESTALVAN
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
      _Travel            : redirected to parent ZCDS_C_TRAVEL_RESTALVAN,
      _BookingSupplement : redirected to composition child ZCDS_C_BOOKSUP_RESTALVAN,
      _Carrier,
      _Connection,
      _Customer

}
