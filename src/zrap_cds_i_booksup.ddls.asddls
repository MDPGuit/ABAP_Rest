@AbapCatalog.sqlViewName: 'ZRAPV_BOOK_SUPL'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Booking Supplement'
define view ZRAP_CDS_I_BOOKSUP
  as select from zrap_bsupp_alvan as BookingSupplement
  association        to parent ZRAP_CDS_I_BOOKING as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                     and $projection.booking_id = _Booking.booking_id
  association [1..1] to ZRAP_CDS_I_TRAVEL         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement         as _Product        on  $projection.suplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SupplementText on  $projection.suplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      suplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      @Semantics.currencyCode: true
      currency_code,
      last_changed_at,

      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
