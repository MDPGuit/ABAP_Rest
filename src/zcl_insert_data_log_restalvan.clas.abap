CLASS zcl_insert_data_log_restalvan DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_data_log_restalvan IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_travel   TYPE TABLE OF ztravl_restalvan,
          lt_booking  TYPE TABLE OF zbook_restalvan,
          lt_book_sup TYPE TABLE OF zbsupp_restalvan.

    SELECT travel_id,
            agency_id,
            customer_id,
            begin_date,
            end_date,
            booking_fee,
            total_price,
            currency_code,
            description,
            status AS overall_status,
            createdby AS created_by,
            createdat AS created_at,
            lastchangedby AS last_changed_by,
            lastchangedat AS last_changed_at
            FROM /dmo/travel INTO CORRESPONDING FIELDS OF
            TABLE @lt_travel
            UP TO 50 ROWS.

**    LOOP AT lt_travel INTO DATA(lw_travel).
**        out->write( lw_travel-begin_date ).
**    ENDLOOP.

    SELECT * FROM /dmo/booking
        FOR ALL ENTRIES IN @lt_travel
        WHERE travel_id EQ @lt_travel-travel_id
        INTO CORRESPONDING FIELDS OF TABLE @lt_booking.

    SELECT * FROM /dmo/book_suppl
        FOR ALL ENTRIES IN @lt_booking
        WHERE travel_id EQ @lt_booking-travel_id
        AND booking_id EQ @lt_booking-booking_id
        INTO CORRESPONDING FIELDS OF TABLE @lt_book_sup.

    DELETE FROM: ztravl_restalvan,
                 zbook_restalvan,
                 zbsupp_restalvan.

**                 ML-0030
    LOOP AT lt_book_sup ASSIGNING FIELD-SYMBOL(<fs>).
      <fs>-suplement_id = 'ML-0030'.
    ENDLOOP.

    INSERT: ztravl_restalvan FROM TABLE @lt_travel,
            zbook_restalvan FROM TABLE @lt_booking,
            zbsupp_restalvan FROM TABLE @lt_book_sup.

    out->write( 'DONE!' ).


  ENDMETHOD.
ENDCLASS.
