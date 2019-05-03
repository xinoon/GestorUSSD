xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getGetSrvPCRFDbaInput" location="../WSDL/getGetSrvPCRFDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getGetSrvPCRFDba";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_GetSRVPcrf/";

declare function xf:IN_XQ_GetSRVPcrf($idPcrf as xs:string,
    $tecnologia4g as xs:string,
    $plataformPcrf as xs:string)
    as element(ns0:getGetSrvPCRFDbaInput) {
        <ns0:getGetSrvPCRFDbaInput>
            <ns0:idPcrf>{ $idPcrf }</ns0:idPcrf>
            <ns0:Tecnologia4g>{ $tecnologia4g }</ns0:Tecnologia4g>
            <ns0:plataformPcrf>{ $plataformPcrf }</ns0:plataformPcrf>
        </ns0:getGetSrvPCRFDbaInput>
};

declare variable $idPcrf as xs:string external;
declare variable $tecnologia4g as xs:string external;
declare variable $plataformPcrf as xs:string external;

xf:IN_XQ_GetSRVPcrf($idPcrf,
    $tecnologia4g,
    $plataformPcrf)