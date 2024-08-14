@EndUserText.label: 'Interface Booking Supplement'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZRAP_CDS_C_BOOKSUP
  as projection on ZRAP_CDS_I_BOOKSUP
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      @ObjectModel.text.element: [ 'SupplementDescription' ]
      suplement_id,
      _SupplementText.Description as SupplementDescription : localized,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      last_changed_at,
      
      /* Associations */
      _Travel  : redirected to ZRAP_CDS_C_TRAVEL,
      _Booking : redirected to parent ZRAP_CDS_C_BOOKING,
      _Product,
      _SupplementText


}
