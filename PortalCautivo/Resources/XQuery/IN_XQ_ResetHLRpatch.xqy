xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:sendResetAPN" location="../../../HLRpatch/Resources/WSDLs/HLRpatch.xsd" ::)

declare namespace ns0 = "http://ws.hlrpatch.wom.smartdici/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_ResetHLRpatch/";

declare function xf:IN_XQ_ResetHLRpatch($imsi1 as xs:string,
    $idPlan1 as xs:string)
    as element(ns0:sendResetAPN) {
        <ns0:sendResetAPN>
            <imsi>{ $imsi1 }</imsi>
            <idPlan>{ $idPlan1 }</idPlan>
            <maxbrupl/>
            <maxbdwl/>
        </ns0:sendResetAPN>
};

declare variable $imsi1 as xs:string external;
declare variable $idPlan1 as xs:string external;

xf:IN_XQ_ResetHLRpatch($imsi1,
    $idPlan1)