xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getBolsaIlimitadaXPlanInput" location="../WSDL/getBolsaIlimitadaXPlan.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getBolsaIlimitadaXPlan";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_GetBolsaIlimitadaXPlan/";

declare function xf:IN_XQ_GetBolsaIlimitadaXPlan($canal as xs:string,
    $tmcode as xs:string,
    $clasificaBolsa as xs:string)
    as element(ns0:getBolsaIlimitadaXPlanInput) {
        <ns0:getBolsaIlimitadaXPlanInput>
            <ns0:canal>{ $canal }</ns0:canal>
            <ns0:tmcode>{ $tmcode }</ns0:tmcode>
            <ns0:clasificaBolsa>{ $clasificaBolsa }</ns0:clasificaBolsa>
        </ns0:getBolsaIlimitadaXPlanInput>
};

declare variable $canal as xs:string external;
declare variable $tmcode as xs:string external;
declare variable $clasificaBolsa as xs:string external;

xf:IN_XQ_GetBolsaIlimitadaXPlan($canal,
    $tmcode,
    $clasificaBolsa)