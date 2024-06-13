@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS View for Item table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity z_lista4_atividade04_basic 
  as select from /dmbe/t_item
  association [0..1] to z_lista4_atividade01 as _headerBasic on _headerBasic.headeruuid = $projection.headeruuid
{
  key header_uuid          as headeruuid,
  key item_uuid            as itemuuid,
      material_number      as materialNumber,
      uom,
      @Semantics.quantity.unitOfMeasure: 'uom'
      quantity,
      periodicity,
      effective_date_from  as dateFrom,
      effective_date_to    as dateTo,
      origin_plant         as originPlant,
      origin_location      as originLocation,
      destination_plant    as destinationPlant,
      destination_location as destinationLocation,
      mot,
      
      _headerBasic
}
