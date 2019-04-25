xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getPlataformaXPlanDbaInput" location="../WSDL/getPlataformaXPlanDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getPlataformaXPlanDba";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_GetPlataformaXPlan/";

declare function xf:IN_XQ_GetPlataformaXPlan($tmcode as xs:string)
    as element(ns0:getPlataformaXPlanDbaInput) {
        <ns0:getPlataformaXPlanDbaInput>
            <ns0:TMCODE>{ data($tmcode) }</ns0:TMCODE>
        </ns0:getPlataformaXPlanDbaInput>
};

declare variable $tmcode as xs:string external;

xf:IN_XQ_GetPlataformaXPlan($tmcode)