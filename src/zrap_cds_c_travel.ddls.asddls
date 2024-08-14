@EndUserText.label: 'Consumption Travel'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZRAP_CDS_C_TRAVEL
  as projection on ZRAP_CDS_I_TRAVEL
{
  key travel_id,
      @ObjectModel.text.element: [ 'AgencyName' ]
      agency_id,
      _Agency.Name as AgencyName,
      @ObjectModel.text.element: [ 'CustomerName' ]
      customer_id,
      _Customer.LastName as CustomerName,
      begin_date,
      end_date,
      @Semantics.amount.currencyCode: 'currency_code'
      booking_fee,
      @Semantics.amount.currencyCode: 'currency_code'
      total_price,
      @Semantics.currencyCode: true
      currency_code,
      description,
      overall_status,
      created_by,
      created_at,
      last_changed_by,
      last_changed_at,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZRAP_CDS_C_BOOKING,
      _Currency,
      _Customer
}
