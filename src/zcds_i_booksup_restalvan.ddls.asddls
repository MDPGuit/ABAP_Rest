@AbapCatalog.sqlViewName: 'ZV_BOOK_SUPL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface Booking Supplement'
define view ZCDS_I_BOOKSUP_RESTALVAN
  as select from zbsupp_restalvan as BookingSupplement
  association        to parent ZCDS_I_BOOKING_RESTALVAN as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                           and $projection.BookingId = _Booking.BookingId
  association [1..1] to ZCDS_I_TRAVEL_RESTALVAN         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement               as _Product        on  $projection.SuplementId = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText           as _SupplementText on  $projection.SuplementId = _SupplementText.SupplementID
{

  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      suplement_id          as SuplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @Semantics.currencyCode: true
      currency_code         as CurrencyCode,      
      last_changed_at       as LastChangedAt,
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
