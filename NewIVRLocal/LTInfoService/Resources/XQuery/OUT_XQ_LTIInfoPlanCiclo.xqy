xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getInfoPlanCicloDBAOutputCollection1" element="ns1:getInfoPlanCicloDBAOutputCollection" location="../WSDLs/getInfoPlanCicloDba.xsd" ::)
(:: pragma bea:global-element-return element="ns0:infoPlanCicloResponse" location="../WSDLs/LTInfoSchema.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/getInfoPlanCicloDBA";
declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/LTInfoXSD/v1";
declare namespace xf = "http://tempuri.org/LTInfoService/Resources/XQuery/OUT_XQ_LTIInfoPlanCiclo/";

declare function xf:OUT_XQ_LTIInfoPlanCiclo($getInfoPlanCicloDBAOutputCollection1 as element(ns1:getInfoPlanCicloDBAOutputCollection))
    as element(ns0:infoPlanCicloResponse) {
        <ns0:infoPlanCicloResponse>
            {
                let $result :=
                    for $getInfoPlanCicloDBAOutput in $getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput
                    let $totalVozOff :=  sum(if( data($getInfoPlanCicloDBAOutput/ns1:TYPE_UNIT_OFF_NET) eq 'Unlimited' or data($getInfoPlanCicloDBAOutput/ns1:TYPE_UNIT_OFF_NET) eq '') then 0 else (data($getInfoPlanCicloDBAOutput/ns1:UNIT_OFF_NET)))
                    let $totalVozAll:= sum(if( data($getInfoPlanCicloDBAOutput/ns1:TYPE_UNIT_ALL_DEST) eq 'Unlimited' or data($getInfoPlanCicloDBAOutput/ns1:TYPE_UNIT_ALL_DEST) eq '') then 0 else (data($getInfoPlanCicloDBAOutput/ns1:UNIT_ALL_DEST)))
                    
                    return
                        <ns0:infoPlanCiclo>
                            <ns0:codigoPlan>{ data($getInfoPlanCicloDBAOutput/ns1:PLAN) }</ns0:codigoPlan>
                            <ns0:nombrePlan>{ data($getInfoPlanCicloDBAOutput/ns1:NOMBRE_PLAN) }</ns0:nombrePlan>
                            <ns0:tipoTecnologia>{ data($getInfoPlanCicloDBAOutput/ns1:TEGNOLOGIA) }</ns0:tipoTecnologia>
                            <ns0:vozONNetIncluido>{ data($getInfoPlanCicloDBAOutput/ns1:UNIT_ON_NET) }</ns0:vozONNetIncluido>
                            <ns0:vozOFFNetIncluido>{ data($getInfoPlanCicloDBAOutput/ns1:UNIT_OFF_NET) }</ns0:vozOFFNetIncluido>
                            <ns0:vozAllDestIncluido>{ data($getInfoPlanCicloDBAOutput/ns1:UNIT_ALL_DEST) }</ns0:vozAllDestIncluido>
                            <ns0:totalVoz>{ xs:integer($totalVozAll+$totalVozOff) }</ns0:totalVoz>
                            <ns0:SMSIncluido>{ data($getInfoPlanCicloDBAOutput/ns1:SMSINCLUIDOS_PLAN) }</ns0:SMSIncluido>
                            <ns0:PTTIncluido>{ data($getInfoPlanCicloDBAOutput/ns1:PTTINCLUIDOS_PLAN) }</ns0:PTTIncluido>
                            <ns0:datosIncluido>{ data($getInfoPlanCicloDBAOutput/ns1:DATOSINLCUIDOS_PROVI) }</ns0:datosIncluido>
                            <ns0:cicloFacturacion>{ fn-bea:dateTime-to-string-with-format('yyyy-MM-dd',xs:dateTime(fn:replace(data($getInfoPlanCicloDBAOutput/ns1:CICLO) ,' ', 'T') )) }</ns0:cicloFacturacion>
                            <ns0:inicioCicloVigente>{ fn-bea:dateTime-to-string-with-format('yyyy-MM-dd',xs:dateTime(fn:replace(data($getInfoPlanCicloDBAOutput/ns1:FECHA_INI_CICLO) ,' ', 'T'))) }</ns0:inicioCicloVigente>
                            <ns0:finCicloVigente>{ fn-bea:dateTime-to-string-with-format('yyyy-MM-dd',xs:dateTime(fn:replace(data($getInfoPlanCicloDBAOutput/ns1:FECHA_TER_CICLO) ,' ', 'T'))) }</ns0:finCicloVigente>
                            <ns0:customerId>{ data($getInfoPlanCicloDBAOutput/ns1:CUSTOMER_ID) }</ns0:customerId>
                            <ns0:coId>{ data($getInfoPlanCicloDBAOutput/ns1:CO_ID) }</ns0:coId>
                        </ns0:infoPlanCiclo>
                return
                    $result
            }
            <ns0:error_code>{if(xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '' or xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '0' ) then 2 else (0)}</ns0:error_code>
            <ns0:err_description>{if(xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '' or xs:string(fn:count($getInfoPlanCicloDBAOutputCollection1/ns1:getInfoPlanCicloDBAOutput)) eq '0' ) then 'NOK' else ('OK')}</ns0:err_description>
        </ns0:infoPlanCicloResponse>
};

declare variable $getInfoPlanCicloDBAOutputCollection1 as element(ns1:getInfoPlanCicloDBAOutputCollection) external;

xf:OUT_XQ_LTIInfoPlanCiclo($getInfoPlanCicloDBAOutputCollection1)