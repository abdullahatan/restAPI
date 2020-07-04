CLASS zcl_resource_orders DEFINITION
  PUBLIC
  INHERITING FROM cl_rest_resource
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS if_rest_resource~get
         REDEFINITION .
    METHODS if_rest_resource~post
         REDEFINITION .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_resource_orders IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_RESOURCE_ORDERS->IF_REST_RESOURCE~GET
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_rest_resource~get.
    SELECT SINGLE * FROM ztab_order INTO @DATA(l_order).

    DATA(lv_str) = /ui2/cl_json=>serialize( data = l_order ).

    mo_response->create_entity( )->set_string_data( iv_data = lv_str ).
    mo_response->set_header_field(
      EXPORTING
        iv_name  = 'Content-Type'
        iv_value = 'application/json' ).
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_RESOURCE_ORDERS->IF_REST_RESOURCE~POST
* +-------------------------------------------------------------------------------------------------+
* | [--->] IO_ENTITY                      TYPE REF TO IF_REST_ENTITY
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_rest_resource~post.
    CONSTANTS: BEGIN OF _cons,
                 str1 TYPE char1 VALUE '{',
                 str2 TYPE char1 VALUE '}',
               END OF _cons.

    DATA: ls_order TYPE ztab_order.

*-&Get request params->
    DATA(lo_entity_req) = mo_request->get_entity( ).
    DATA(lv_request) = lo_entity_req->get_string_data( ).

    TRY .
        DATA(url) = mo_request->get_uri_path( ) .
        /ui2/cl_json=>deserialize(
          EXPORTING
            json         = lv_request
          CHANGING
            data         = ls_order  ).

        IF ls_order-order_dat = space OR ls_order-cust_name = space OR ls_order-total_amnt = space OR ls_order-currency = space.
          DATA(_error) = abap_true.
        ELSE.
          ls_order-order_id = cl_uuid_factory=>create_system_uuid( )->create_uuid_x16( ).
          SELECT MAX( order_no ) FROM ztab_order INTO @DATA(l_maxid).
          ls_order-order_no = l_maxid + 1.
          INSERT INTO ztab_order VALUES ls_order.
          IF sy-subrc <> 0.
            _error = abap_true.
          ELSE.
            COMMIT WORK AND WAIT.
          ENDIF.
        ENDIF.
      CATCH cx_root .
        _error = abap_true.
    ENDTRY.

*-&Create response dat->
    DATA(lo_entity_res) = mo_response->create_entity( ).
    lo_entity_res->set_content_type( if_rest_media_type=>gc_appl_json ).
    DATA(l_final_res) = /ui2/cl_json=>serialize( data = ls_order ).

    IF _error EQ abap_true.
      lo_entity_res->set_string_data( |{ _cons-str1 } "status":  { _cons-str1 } "code": "400", "message": "Bad request" { _cons-str2 } { _cons-str2 } | ).
      mo_response->set_status( cl_rest_status_code=>gc_client_error_bad_request ).
    ELSE.
      lo_entity_res->set_string_data( |{ _cons-str1 } "status":  { _cons-str1 } "code": "200", "message": "Success" { _cons-str2 } { _cons-str2 } | ).
      mo_response->set_status( cl_rest_status_code=>gc_success_ok ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.