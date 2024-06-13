@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption CDS View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity z_lista4_atividade03 
  as select from z_lista4_atividade02_tp
{
  key headeruuid,
      materialNumber,
      materialDescription,
      uom,
      @Semantics.quantity.unitOfMeasure: 'uom'
      quantity,
      periodicity,
      periodicityDescription,
      dateFrom,
      dateTo,
      originPlant,
      originLocation,
      originDescription,
      destinationPlant,
      destinationLocation,
      destinationDescription,
      mot,
      motDescription,
      
      _destLocation,
      _Material,
      _Mot,
      _orLocation,
      _Periodicity
}
