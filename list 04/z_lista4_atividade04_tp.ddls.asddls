@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Processing'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity z_lista4_atividade04_tp 
  as select from z_lista4_atividade04_basic as _Item
    
  association [0..1] to z_lista4_atividade02_tp    as _headerTP     on _headerTP.headeruuid = $projection.headeruuid
  association [0..1] to z_lista4_atividade02_makt  as _Material     on _Material.materialNumber = $projection.materialNumber
                                                                    and _Material.language = $session.system_language
  association [0..1] to z_lista4_atividade02_t173t as _Mot          on _Mot.motNumber = $projection.mot
                                                                    and _Mot.language = $session.system_language
  association [0..1] to z_lista4_atividade02_t499s as _destLocation on _destLocation.location = $projection.destinationLocation
                                                                    and _destLocation.locationPlant = $projection.destinationPlant                                                             
  association [0..1] to z_lista4_atividade02_t499s as _orLocation   on _orLocation.location = $projection.destinationLocation
                                                                    and _orLocation.locationPlant = $projection.destinationPlant
  association [0..1] to z_lista4_atividade02_dd07t as _Periodicity  on _Periodicity.domainName = '/DMBE/D_PERIODICITY'
                                                                    and _Periodicity.language = $session.system_language
                                                                    and _Periodicity.periodicityValue = _Item.periodicity  
{
  key _Item.itemuuid,
  key _Item.headeruuid,
      _Item.materialNumber,
      _Material.materialDescription,
      _Item.uom,
      @Semantics.quantity.unitOfMeasure: 'uom'
      _Item.quantity,
      _Item.periodicity,
      _Periodicity.periodicityDescription,
      _Item.dateFrom,
      _Item.dateTo,
      _Item.originPlant,
      _Item.originLocation,
      _orLocation.locationDescription   as originDescription,
      _Item.destinationPlant,
      _Item.destinationLocation,
      _destLocation.locationDescription as destinationDescription,
      _Item.mot,
      _Mot.motDescription,
      
      _headerTP,
      _Material,
      _Mot,
      _destLocation,
      _orLocation,
      _Periodicity
}
