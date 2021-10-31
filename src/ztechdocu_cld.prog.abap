*&---------------------------------------------------------------------*
*& Include          ZTECHDOCU_CLD
*&---------------------------------------------------------------------*
INTERFACE lif_techdocu_treq_objects.
  METHODS:
    read RETURNING VALUE(ro_result) TYPE REF TO lif_techdocu_treq_objects,

    display.

ENDINTERFACE.

CLASS lcl_techdocu_treq_objects DEFINITION FINAL.
  PUBLIC SECTION.

    INTERFACES lif_techdocu_treq_objects.

    ALIASES read FOR lif_techdocu_treq_objects~read.
    ALIASES display FOR lif_techdocu_treq_objects~display.

    TYPES ty_t_treq_range TYPE RANGE OF e071-trkorr.
    TYPES ty_treqs_data TYPE ztechdocu_data.
    TYPES ty_t_treqs_data TYPE STANDARD TABLE OF ty_treqs_data WITH KEY primary_key COMPONENTS obj_type.

    METHODS:
      constructor IMPORTING it_treqs TYPE ty_t_treq_range
                            iv_lang  TYPE sy-langu.

  PRIVATE SECTION.
    DATA mt_treqs TYPE ty_t_treq_range.
    DATA mv_lang TYPE sy-langu.
    DATA mt_treqs_data TYPE ty_t_treqs_data.

    METHODS:
      select_treqs RETURNING VALUE(rt_result) TYPE ty_t_treq_range,

      read_treqs_data IMPORTING it_treqs TYPE ty_t_treq_range,

      is_treq_exist IMPORTING is_treqs_data    TYPE ty_treqs_data
                    RETURNING VALUE(rv_result) TYPE boole_d,

      read_treq_object_title IMPORTING iv_treq_object      TYPE trobj_name
                                       iv_treq_object_type TYPE trobjtype
                             RETURNING VALUE(rv_result)    TYPE string.

ENDCLASS.

CLASS lcl_techdocu_alv DEFINITION FINAL.
  PUBLIC SECTION.

    TYPES:
      ty_t_grid TYPE lcl_techdocu_treq_objects=>ty_t_treqs_data.

    METHODS:
      constructor IMPORTING it_grid TYPE ty_t_grid,

      display.

  PRIVATE SECTION.
    DATA mt_grid TYPE ty_t_grid.
    DATA mo_grid TYPE REF TO cl_gui_alv_grid.

    METHODS:
      create_grid,

      get_field_catalog RETURNING VALUE(rt_fcat) TYPE lvc_t_fcat.

ENDCLASS.

CLASS lcl_techdocu_scr_events DEFINITION FINAL.
  PUBLIC SECTION.

    CLASS-DATA: go_treq_objects TYPE REF TO lif_techdocu_treq_objects.

    CLASS-METHODS:
      initialization,

      at_ssonvrf_treqs,

      start_of_selection,

      end_of_selection.

ENDCLASS.

INTERFACE lif_techdocu_treq_object.
  METHODS title RETURNING VALUE(rv_result) TYPE string.
ENDINTERFACE.

CLASS lcl_techdocu_treq_object DEFINITION ABSTRACT.
  PUBLIC SECTION.
    INTERFACES lif_techdocu_treq_object.

    CLASS-METHODS
      get_instance IMPORTING iv_treq_object      TYPE trobj_name
                             iv_treq_object_type TYPE trobjtype
                             iv_lang             TYPE sy-langu
                   RETURNING VALUE(ro_result)    TYPE REF TO lif_techdocu_treq_object
                   RAISING   cx_sy_create_object_error.

    METHODS:
      constructor IMPORTING iv_treq_object      TYPE trobj_name
                            iv_treq_object_type TYPE trobjtype
                            iv_lang             TYPE sy-langu.

  PROTECTED SECTION.
    DATA mv_treq_object      TYPE trobj_name.
    DATA mv_treq_object_type TYPE trobjtype.
    DATA mv_lang             TYPE sy-langu.

ENDCLASS.

CLASS lcl_techdocu_treq_object_devc DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_prog DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_intf DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_clas DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_tabl DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_msag DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_shlp DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_doma DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_dtel DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_ttyp DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_view DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_sfpi DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_sfpf DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_fugr DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.

CLASS lcl_techdocu_treq_object_sxci DEFINITION INHERITING FROM lcl_techdocu_treq_object FINAL.
  PUBLIC SECTION.
    METHODS lif_techdocu_treq_object~title REDEFINITION.
ENDCLASS.
