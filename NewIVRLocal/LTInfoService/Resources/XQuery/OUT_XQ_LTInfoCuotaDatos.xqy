xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getInfoPlanCicloDBAOutputCollection1" element="ns1:getInfoPlanCicloDBAOutputCollection" location="../WSDLs/getInfoPlanCicloDba.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$listXmlBundle1" element="listXmlBundle" location="../WSDLs/responseXmlCuotaDato.xsd" ::)
(:: pragma bea:global-element-return element="ns0:infoCuotaDatosResponse" location="../WSDLs/LTInfoSchema.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/getInfoPlanCicloDBA";
declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/LTInfoXSD/v1";
declare namespace xf = "http://tempuri.org/LTInfoService/Resources/XQuery/OUT_XQ_LTInfoCuotaDatos/";
declare namespace funcOd = "http://tempuri.org/LTInfoService/Resources/XQuery/largoDecimal";



declare function funcOd:trasformGB($num as xs:long) as xs:decimal
{
  let $result :=  xs:decimal(($num div 1024)div 1024)
  return $result
};
      
declare function xf:OUT_XQ_LTInfoCuotaDatos($getInfoPlanCicloDBAOutputCollection1 as element(ns1:getInfoPlanCicloDBAOutputCollection),
    $listXmlBundle1 as element(listXmlBundle))
    as element(ns0:infoCuotaDatosResponse) {
        <ns0:infoCuotaDatosResponse>
            {
                let $postConsume := sum(for $consumo in $listXmlBundle1/listXmlBundles return 
                if (fn:substring(data($consumo/bolsa),1,4)eq'post' or data($consumo/fechaInicio) eq 'T') then 
                sum( if(data($consumo/cuotaOcupada)eq "") then 0 else data($consumo/cuotaOcupada) ) else (0))
                
                let $montoTotal := sum(for $consumo in $listXmlBundle1/listXmlBundles return 
                if (fn:substring(data($consumo/bolsa),1,4)eq'post' or data($consumo/fechaInicio) eq 'T') then 
                sum( if(data($consumo/cuotaBolsa)eq "") then 0 else data($consumo/cuotaBolsa) ) else (0))
                
                let $result :=
                    for $getInfoPlanCicloDBAOutput in $getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput
                    return
                        <ns0:infoCuotaDatos>
                            <ns0:codigoPlan>{ data($getInfoPlanCicloDBAOutput/ns1:PLAN) }</ns0:codigoPlan>
                            <ns0:nombrePlan>{ data($getInfoPlanCicloDBAOutput/ns1:NOMBRE_PLAN) }</ns0:nombrePlan>
                            <ns0:tipoTecnologia>{ data($getInfoPlanCicloDBAOutput/ns1:TEGNOLOGIA) }</ns0:tipoTecnologia>
                            <ns0:cicloFacturacion>{ fn-bea:dateTime-to-string-with-format('yyyy-MM-dd',xs:dateTime(fn:replace(data($getInfoPlanCicloDBAOutput/ns1:CICLO) ,' ', 'T')))  }</ns0:cicloFacturacion>
                            <ns0:inicioCicloVigente>{  fn-bea:dateTime-to-string-with-format('yyyy-MM-dd',xs:dateTime(fn:replace(data($getInfoPlanCicloDBAOutput/ns1:FECHA_INI_CICLO) ,' ', 'T')))  }</ns0:inicioCicloVigente>
                            <ns0:finCicloVigente>{ fn-bea:dateTime-to-string-with-format('yyyy-MM-dd',xs:dateTime(fn:replace(data($getInfoPlanCicloDBAOutput/ns1:FECHA_TER_CICLO) ,' ', 'T'))) }</ns0:finCicloVigente>
                            <ns0:customerId>{ data($getInfoPlanCicloDBAOutput/ns1:CUSTOMER_ID) }</ns0:customerId>
                            <ns0:coId>{ data($getInfoPlanCicloDBAOutput/ns1:CO_ID) }</ns0:coId>     
							<ns0:consumoCuotaDatosVigente>{round-half-to-even(funcOd:trasformGB(xs:long($postConsume)),2)}</ns0:consumoCuotaDatosVigente>
							<ns0:montoDatos>{round-half-to-even(funcOd:trasformGB(xs:long($montoTotal)),2)}</ns0:montoDatos>
							                            
                            {
                                let $result :=
                                    for $listXmlBundles in $listXmlBundle1/listXmlBundles
                                    
                                    return
                                    if($listXmlBundles/fechaInicio/text() = 'T' and fn:substring($listXmlBundles/bolsa/text(),1,4) = 'post')then
                                    (
                                        <ns0:infoPlanCiclo>
                                            <ns0:bolsa>{ data($listXmlBundles/bolsa) }</ns0:bolsa>
                                            <ns0:fechaInicio>{ data($listXmlBundles/fechaInicio) }</ns0:fechaInicio>
                                            <ns0:fechaFin>{ data($listXmlBundles/fechaFin) }</ns0:fechaFin>
                                            <ns0:cuotaBolsa>{ round-half-to-even(funcOd:trasformGB(xs:long(if($listXmlBundles/cuotaBolsa/text()eq "") then 0 else data($listXmlBundles/cuotaBolsa))),2) }</ns0:cuotaBolsa>
                                            <ns0:cuotaOcupada>{ round-half-to-even(funcOd:trasformGB(xs:long(if($listXmlBundles/cuotaOcupada/text() eq "") then 0 else data($listXmlBundles/cuotaOcupada))),2) }</ns0:cuotaOcupada>
                                            <ns0:cuotaDisponible>{ round-half-to-even(funcOd:trasformGB(xs:long(if($listXmlBundles/cuotaDisponible/text() eq "") then 0 else data($listXmlBundles/cuotaDisponible))),2) }</ns0:cuotaDisponible>
                                        </ns0:infoPlanCiclo>                                    ) 
                                    else 
                                    ()
                                return
                                    $result
                            }
                        </ns0:infoCuotaDatos>
                return
                    $result
            }
            
            <ns0:error_code>{if(xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '' or xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '0' ) then 2 else (0)}</ns0:error_code>
            <ns0:err_description>{if(xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '' or xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '0' ) then 'NOK' else ('OK')}</ns0:err_description>
            
        </ns0:infoCuotaDatosResponse>
};

declare variable $getInfoPlanCicloDBAOutputCollection1 as element(ns1:getInfoPlanCicloDBAOutputCollection) external;
declare variable $listXmlBundle1 as element(listXmlBundle) external;

xf:OUT_XQ_LTInfoCuotaDatos($getInfoPlanCicloDBAOutputCollection1,
    $listXmlBundle1)