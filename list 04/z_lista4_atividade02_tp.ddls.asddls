@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transactional Processing'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity z_lista4_atividade02_tp 
  as select from z_lista4_atividade01 as _Header
  
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
                                                                    and _Periodicity.periodicityValue = _Header.periodicity
{
  key _Header.headeruuid,
      _Header.materialNumber,
      _Material.materialDescription,
      _Header.uom,
      @Semantics.quantity.unitOfMeasure: 'uom'
      _Header.quantity,
      _Header.periodicity,
      _Periodicity.periodicityDescription,
      _Header.dateFrom,
      _Header.dateTo,
      _Header.originPlant,
      _Header.originLocation,
      _orLocation.locationDescription   as originDescription,
      _Header.destinationPlant,
      _Header.destinationLocation,
      _destLocation.locationDescription as destinationDescription,
      _Header.mot,
      _Mot.motDescription,
  
      _Material,
      _Mot,
      _destLocation,
      _orLocation,
      _Periodicity
}
