xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:infoPlanCiclo" location="../../../NewIVRLocal/LTInfoService/Resources/WSDLs/LTInfoSchema.xsd" ::)

declare namespace ns0 = "http://nii.com/EnterpriseProxyService/ServiceManagement/LTInfoXSD/v1";
declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/IN_XQ_getInfoPlanCicloFact/";

declare function xf:IN_XQ_getInfoPlanCicloFact($NroCelular as xs:string)
    as element(ns0:infoPlanCiclo) {
        <ns0:infoPlanCiclo>
            <ns0:nroCelular>{ $NroCelular }</ns0:nroCelular>
        </ns0:infoPlanCiclo>
};

declare variable $NroCelular as xs:string external;

xf:IN_XQ_getInfoPlanCicloFact($NroCelular)