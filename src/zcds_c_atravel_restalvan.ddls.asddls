@EndUserText.label: 'Consumption Travel Approval'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZCDS_C_ATRAVEL_RESTALVAN
  as projection on ZCDS_I_TRAVEL_RESTALVAN
{
  key TravelId,
      @ObjectModel.text.element: [ 'AgencyName' ]
      AgencyId,
      _Agency.Name       as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Semantics.currencyCode: true
      CurrencyCode,
      Description,
      OverallStatus,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to composition child ZCDS_C_ABOOKING_RESTALVAN,
      _Customer
}
