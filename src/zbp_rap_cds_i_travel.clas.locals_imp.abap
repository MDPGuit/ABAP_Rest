CLASS lhc_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Travel RESULT result.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Travel RESULT result.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~acceptTravel RESULT result.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS createTravelByTemplate FOR MODIFY
      IMPORTING keys FOR ACTION Travel~createTravelByTemplate RESULT result.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Travel~rejectTravel RESULT result.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS validateCustomer FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateCustomer.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateDates.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    METHODS validateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Travel~validateStatus.

ENDCLASS.

CLASS lhc_Travel IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD acceptTravel.
  ENDMETHOD.

  METHOD createTravelByTemplate.

**  keys[ 1 ]
**  result[ 1 ]
**  mapped-
**  failed-
**  reported-

    READ ENTITIES OF zrap_cds_i_travel
        ENTITY Travel
        FIELDS ( travel_id agency_id customer_id booking_fee total_price currency_code )
        WITH VALUE #( FOR lwa_keys IN keys (
                        %key = lwa_keys-%key
                     ) )
**        WITH VALUE #( ( %key = keys[ 1 ]-%key ) )
        RESULT DATA(lit_read_entity)
        FAILED failed
        REPORTED reported.

**    CHECK failed IS INITIAL.

    DATA lt_create_travel TYPE TABLE FOR CREATE zrap_cds_i_travel\\Travel.

    SELECT MAX( travel_id )
    FROM zrap_travl_alvan
    INTO @DATA(lv_travel).

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    lt_create_travel = VALUE #( FOR lwa_read_entity IN lit_read_entity
                                INDEX INTO idx
                                ( travel_id      = lv_travel + idx
                                  agency_id      = lwa_read_entity-agency_id
                                  customer_id    = lwa_read_entity-customer_id
                                  begin_date     = lv_today
                                  end_date       = lv_today + 30
                                  booking_fee    = lwa_read_entity-booking_fee
                                  total_price    = lwa_read_entity-total_price
                                  currency_code  = lwa_read_entity-currency_code
                                  description    = 'Add Comments'
                                  overall_status = 'O'  )
                              ).

    MODIFY ENTITIES OF zrap_cds_i_travel
        IN LOCAL MODE ENTITY Travel
        CREATE FIELDS ( travel_id
                        agency_id
                        customer_id
                        begin_date
                        end_date
                        booking_fee
                        total_price
                        currency_code
                        description
                        overall_status )
         WITH lt_create_travel
         MAPPED mapped
         FAILED failed
         REPORTED reported.

    result = VALUE #( FOR lwa_result IN lt_create_travel
                      INDEX INTO idx
                      ( %cid_ref = keys[ idx ]-%cid_ref
                        %key = keys[ idx ]-%key
                        %param = CORRESPONDING #( lwa_result ) )
                      ).



  ENDMETHOD.

  METHOD rejectTravel.
  ENDMETHOD.

  METHOD validateCustomer.
  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

  METHOD validateStatus.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZRAP_CDS_I_TRAVEL DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZRAP_CDS_I_TRAVEL IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
