@EndUserText.label: 'Consumption Booking Supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZCDS_C_BOOKSUP_RESTALVAN
  as projection on ZCDS_I_BOOKSUP_RESTALVAN
{

  key TravelId,
  key BookingId,
  key BookingSupplementId,
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      SuplementId,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      @Semantics.currencyCode: true
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel  : redirected to ZCDS_C_TRAVEL_RESTALVAN,
      _Booking : redirected to parent ZCDS_C_BOOKING_RESTALVAN,
      _Product,
      _SupplementText
}
