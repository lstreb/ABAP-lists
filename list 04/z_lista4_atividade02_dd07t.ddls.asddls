@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'periodicity description'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
  serviceQuality: #X,
  sizeCategory: #S,
  dataClass: #MIXED
}
define view entity z_lista4_atividade02_dd07t 
  as select from dd07t
{
  key domname    as domainName,
  key ddlanguage as language,
  //key valpos     as domainValue,
  //key as4local   as activationState,
  //key as4vers    as version,
  key domvalue_l as periodicityValue,
      ddtext     as periodicityDescription
}
