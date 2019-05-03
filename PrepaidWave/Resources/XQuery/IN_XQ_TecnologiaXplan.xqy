xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:getTecnologiaXPlanDbaInput" location="../WSDL/getTecnologiaXPlanDba.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/getTecnologiaXPlanDba";
declare namespace xf = "http://tempuri.org/PrepaidWave/Resources/XQuery/IN_XQ_TecnologiaXplan/";

declare function xf:IN_XQ_TecnologiaXplan($nroCelular as xs:string)
    as element(ns0:getTecnologiaXPlanDbaInput) {
        <ns0:getTecnologiaXPlanDbaInput>
            <ns0:NROCELULAR>{ $nroCelular }</ns0:NROCELULAR>
        </ns0:getTecnologiaXPlanDbaInput>
};

declare variable $nroCelular as xs:string external;

xf:IN_XQ_TecnologiaXplan($nroCelular)