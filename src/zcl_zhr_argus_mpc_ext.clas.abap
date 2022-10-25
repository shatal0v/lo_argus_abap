class ZCL_ZHR_ARGUS_MPC_EXT definition
  public
  inheriting from ZCL_ZHR_ARGUS_MPC
  create public .

public section.

  methods DEFINE
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZHR_ARGUS_MPC_EXT IMPLEMENTATION.


METHOD define.
  super->define( ).
  DATA(lo_entity) = model->get_entity_type( iv_entity_name = 'Scan' ).
  IF lo_entity IS BOUND.
    DATA(lo_property) = lo_entity->get_property( iv_property_name = 'mime'  ).
    lo_property->set_as_content_type( ).
  ENDIF.
  DATA: lo_entity_type    TYPE REF TO /iwbep/if_mgw_odata_entity_typ.
  lo_entity_type = model->get_entity_type( iv_entity_name = 'Request' ).
  lo_entity_type->bind_structure( iv_structure_name  = 	'ZCL_ZHR_ARGUS_DPC_EXT=>TS_DEEP' ).
ENDMETHOD.
ENDCLASS.
