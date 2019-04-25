xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getPlataformaXPlanDbaInput" location="../WSDL/getPlataformaXPlanDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getPlataformaXPlanDba";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_GetPlataformaXPlan/";

declare function xf:IN_XQ_GetPlataformaXPlan($nroCelular as xs:string)
    as element(ns0:getPlataformaXPlanDbaInput) {
        <ns0:getPlataformaXPlanDbaInput>
            <ns0:NROCELULAR>{ $nroCelular }</ns0:NROCELULAR>
        </ns0:getPlataformaXPlanDbaInput>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_GetPlataformaXPlan($nroCelular)