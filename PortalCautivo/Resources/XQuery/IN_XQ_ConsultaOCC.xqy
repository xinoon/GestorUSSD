xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../WSDLs/PROVI_BOLS_NII_BSCS_PORTAL_CAUTIVO_PKG_GET_CONFIG_OCC_PRC.xsd" ::)
(:: pragma  parameter="$traffic_type" type="anyType" ::)
(:: pragma  parameter="$sn_code" type="anyType" ::)
(:: pragma bea:global-element-return element="ns2:BookingRequestWrite" location="../../../3GBSCS/Resources/WSDLs/BookingRequestWrite.wsdl" ::)

declare namespace ns2 = "http://www.lhsgroup.com/ws_v2_NII_1";
declare namespace ns1 = "http://xml.apache.org/axis/wsdd/providers/java";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/PROVI_BOLS/NII_BSCS_PORTAL_CAUTIVO_PKG/GET_CONFIG_OCC_PRC/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_ConsultaOCC/";

declare function xf:IN_XQ_ConsultaOCC($outputParameters1 as element(ns0:OutputParameters),
    $lc_customer as xs:long,
    $lc_tmcode as xs:string,
    $tariff_prod as xs:double,
    $traffic_type as element(*),
    $sn_code as xs:string,
    $contractId as xs:long,
    $fechaActivacion as xs:string)
    as element(ns2:BookingRequestWrite) {
        <ns2:BookingRequestWrite>
            <ns1:input>
                {
                    for $SV_ACTIONCODE in $outputParameters1/ns0:SV_ACTIONCODE
                    return
                        <ns2:actionCode>{ data($SV_ACTIONCODE) }</ns2:actionCode>
                }
                <ns2:amount>
                    <ns2:amount>{ $tariff_prod }</ns2:amount>
                    {
                        for $SV_CURRENCY in $outputParameters1/ns0:SV_CURRENCY
                        return
                            <ns2:currency>{ data($SV_CURRENCY) }</ns2:currency>
                    }
                </ns2:amount>
                <ns2:coId>{ $contractId }</ns2:coId>
                <ns2:csId>{ $lc_customer }</ns2:csId>
                <ns2:feeClass>{ xs:int(data($outputParameters1/ns0:SN_FEECLASS)) }</ns2:feeClass>
                {
                    for $SV_FEETYPE in $outputParameters1/ns0:SV_FEETYPE
                    return
                        <ns2:feeType>{ data($SV_FEETYPE) }</ns2:feeType>
                }
                <ns2:numPeriods>{ xs:int(data($outputParameters1/ns0:SN_NUMPERIODS)) }</ns2:numPeriods>
                {
                    for $SV_REMARK in $outputParameters1/ns0:SV_REMARK
                    return
                        <ns2:remark>{ data($SV_REMARK) }</ns2:remark>
                }
                <ns2:rpcodePub>{ data($lc_tmcode) }</ns2:rpcodePub>
                <ns2:rsCode>{ xs:long(data($outputParameters1/ns0:SN_RSCODE)) }</ns2:rsCode>
                {
                    for $SV_SNCODEPUB in $outputParameters1/ns0:SV_SNCODEPUB
                    return
                        <ns2:sncodePub>{ data($SV_SNCODEPUB) }</ns2:sncodePub>
                }
                {
                    for $SV_SPCODEPUB in $outputParameters1/ns0:SV_SPCODEPUB
                    return
                        <ns2:spcodePub>{ data($SV_SPCODEPUB) }</ns2:spcodePub>
                }
                <ns2:validFrom>
                    <ns2:date>{ $fechaActivacion }</ns2:date>
                </ns2:validFrom>
                <ns2:validTo>
                    <ns2:date>{ $fechaActivacion }</ns2:date>
                </ns2:validTo>
            </ns1:input>
            <ns1:sessionChange>
                <ns2:values>
                    <ns2:item>
                        {
                            for $SV_KEY in $outputParameters1/ns0:SV_KEY
                            return
                                <ns2:key>{ data($SV_KEY) }</ns2:key>
                        }
                        <ns2:value>{ data($outputParameters1/ns0:SN_VALUE) }</ns2:value>
                    </ns2:item>
                </ns2:values>
            </ns1:sessionChange>
        </ns2:BookingRequestWrite>
};

declare variable $outputParameters1 as element(ns0:OutputParameters) external;
declare variable $lc_customer as xs:long external;
declare variable $lc_tmcode as xs:string external;
declare variable $tariff_prod as xs:double external;
declare variable $traffic_type as element(*) external;
declare variable $sn_code as xs:string external;
declare variable $contractId as xs:long external;
declare variable $fechaActivacion as xs:string external;

xf:IN_XQ_ConsultaOCC($outputParameters1,
    $lc_customer,
    $lc_tmcode, 
    $tariff_prod,
    $traffic_type,
    $sn_code,
    $contractId,
    $fechaActivacion)