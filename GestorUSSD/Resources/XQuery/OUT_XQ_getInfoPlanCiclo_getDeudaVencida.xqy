xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$infoPlanCicloResponse1" element="ns0:infoPlanCicloResponse" location="../../../NewIVRLocal/LTInfoService/Resources/WSDLs/LTInfoSchema.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns1:OutputParameters" location="../WSDL/FTOLERANCE_NII_IVR_CONSULTS_PKG_NII_DEBT_CONSULT_PRC.xsd" ::)
(:: pragma bea:global-element-return element="ns2:ussdOperacionResponse" location="../WSDL/USSDOperaciones.xsd" ::)

declare namespace ns2 = "http://ussd.operaciones.wom.ws.ncl.com";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/FTOLERANCE/NII_IVR_CONSULTS_PKG/NII_DEBT_CONSULT_PRC/";
declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/LTInfoXSD/v1";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/OUT_XQ_getInfoPlanCiclo_getDeudaVencida/";

declare function xf:dateXDiaMonth($strDate as xs:string ) as xs:string
{
	 let $strDateNewConvert := xs:string(fn:day-from-date(xs:date($strDate)))
	 let $incorporaZeroDia := if(fn:string-length($strDateNewConvert) = 1) 
	 then(fn:concat('0',$strDateNewConvert)) 
	 else($strDateNewConvert)
	 
	 let $strDateMonthNewConvert := xs:string(month-from-date(xs:date($strDate)))
	 let $incorporaZeroMonth := if(fn:string-length($strDateMonthNewConvert) = 1) 
	 then (fn:concat('0',$strDateMonthNewConvert))
	 else($strDateMonthNewConvert)
	 
	 return fn:concat($incorporaZeroDia,'/',$incorporaZeroMonth)
	
    
};


declare function xf:OUT_XQ_getInfoPlanCiclo_getDeudaVencida($infoPlanCicloResponse1 as element(ns0:infoPlanCicloResponse),
    $outputParameters1 as element(ns1:OutputParameters))
    as element(ns2:ussdOperacionResponse) {
        <ns2:ussdOperacionResponse>
            <errorCode>0</errorCode>
        
            {
                    let $OUT_FECHA_AVENCER := $outputParameters1[1]/ns1:OUT_FECHA_AVENCER
                    let $inicioCicloVigente := $infoPlanCicloResponse1/ns0:infoPlanCiclo[1]/ns0:inicioCicloVigente
                    let $finCicloVigente := $infoPlanCicloResponse1/ns0:infoPlanCiclo[1]/ns0:finCicloVigente  
                    
                    let $outFechaAVencer := if(not(empty($OUT_FECHA_AVENCER/text()))) then (xf:dateXDiaMonth($OUT_FECHA_AVENCER/text())) else ('00/00')
                    let $outIniCicloVigente := if(not(empty($inicioCicloVigente/text()))) then (xf:dateXDiaMonth($inicioCicloVigente/text())) else ('00/00')                
                    let $outFinCicloVigente := if(not(empty($finCicloVigente/text()))) then (xf:dateXDiaMonth($finCicloVigente/text())) else ('00/00')
                                    
                    return
                    if($outFechaAVencer eq '00/00')then(
                     <errorDescription>{ fn:concat('Su ultima boleta comprende el consumo entre los dias ',$outIniCicloVigente,' y ',$outFinCicloVigente) }</errorDescription>
                    )else
                    (
                      <errorDescription>{ fn:concat('Su ultima boleta comprende el consumo entre los dias ',$outIniCicloVigente,' y ',$outFinCicloVigente,', y vence el dia, ', $outFechaAVencer) }</errorDescription>
                    )
            }
        </ns2:ussdOperacionResponse>
};

declare variable $infoPlanCicloResponse1 as element(ns0:infoPlanCicloResponse) external;
declare variable $outputParameters1 as element(ns1:OutputParameters) external;

xf:OUT_XQ_getInfoPlanCiclo_getDeudaVencida($infoPlanCicloResponse1,
    $outputParameters1)